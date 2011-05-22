/* Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
   This file is part of the Ruby/CHISE Extension.

   This software is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   This software is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the CHISE Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include "ruby.h"
#include "chise.h"

static VALUE mCHISE, cDS, cCCS, cFEATURE;

typedef struct {
  CHISE_DS *ds;
} RB_CHISE_DS;

typedef struct {
  CHISE_Feature_Table *feature;
} RB_CHISE_FEATURE;

typedef struct {
  CHISE_CCS_Table *ccs;
} RB_CHISE_CCS;

static VALUE fds_new(VALUE klass, VALUE type, VALUE location, VALUE dbtype, VALUE mode){
  RB_CHISE_DS *rds;
  VALUE tdata = Data_Make_Struct(klass, RB_CHISE_DS, 0, free, rds);
  rds->ds = CHISE_DS_open((CHISE_DS_Type)NUM2INT(type), STR2CSTR(location), NUM2INT(dbtype), NUM2INT(mode));
  if (rds->ds == NULL) return Qnil;
  return tdata;
}

static VALUE fds_close(VALUE obj){
  RB_CHISE_DS *rds;
  Data_Get_Struct(obj, RB_CHISE_DS, rds);
  CHISE_DS_close(rds->ds);
  return Qnil;
}

static int name_map_func(CHISE_DS *ds, unsigned char *name){
  rb_yield(rb_str_new2(name));
  return 0; // important
}

static VALUE fds_each_feature_name(VALUE obj){
  RB_CHISE_DS *rds;
  Data_Get_Struct(obj, RB_CHISE_DS, rds);
  chise_ds_foreach_char_feature_name(rds->ds, &name_map_func);
  return Qnil;
}

static VALUE fds_get_feature(VALUE obj, VALUE name){
  RB_CHISE_DS *rds;
  RB_CHISE_FEATURE *rfeature;
  Data_Get_Struct(obj, RB_CHISE_DS, rds);
  VALUE vfeature = Data_Make_Struct(cFEATURE, RB_CHISE_FEATURE, 0, free, rfeature);
  rfeature->feature = chise_ds_get_feature(rds->ds, STR2CSTR(name));
  return vfeature;
}

static VALUE ffeature_setup_db(VALUE obj, VALUE writable){
  RB_CHISE_FEATURE *rfeature;
  Data_Get_Struct(obj, RB_CHISE_FEATURE, rfeature);
  int status = chise_feature_setup_db(rfeature->feature, NUM2INT(writable));
  if (status) return Qnil;
  return Qtrue;
}

static VALUE ffeature_sync(VALUE obj){
  RB_CHISE_FEATURE *rfeature;
  Data_Get_Struct(obj, RB_CHISE_FEATURE, rfeature);
  int status = chise_feature_sync(rfeature->feature);
  if (status) return Qnil;
  return Qtrue;
}

static VALUE ffeature_set_value(VALUE obj, VALUE cid, VALUE value){
  RB_CHISE_FEATURE *rfeature;
  Data_Get_Struct(obj, RB_CHISE_FEATURE, rfeature);
  int status = chise_char_set_feature_value((CHISE_Char_ID)NUM2INT(cid), rfeature->feature, STR2CSTR(value));
  if (status) return Qnil;
  return Qtrue;
}

static VALUE ffeature_get_value(VALUE obj, VALUE cid){
  RB_CHISE_FEATURE *rfeature;
  CHISE_Value valdatum;
  Data_Get_Struct(obj, RB_CHISE_FEATURE, rfeature);
  int status = chise_char_load_feature_value((CHISE_Char_ID)NUM2INT(cid), rfeature->feature, &valdatum);
  if (status) return Qnil;
  return rb_str_new(valdatum.data, valdatum.size);
}

static VALUE fds_load_feature(VALUE obj, VALUE cid, VALUE name){
  RB_CHISE_DS *rds;
  CHISE_Value valdatum;
  Data_Get_Struct(obj, RB_CHISE_DS, rds);
  int status = chise_ds_load_char_feature_value(rds->ds, NUM2INT(cid), STR2CSTR(name), &valdatum);
  if (status) return Qnil;
  return rb_str_new(valdatum.data, valdatum.size);
}

static int feature_map_func(CHISE_Char_ID cid, CHISE_Feature_Table *db, CHISE_Value *valdatum){
  VALUE vstr = rb_str_new(valdatum->data, valdatum->size);
  rb_yield(rb_assoc_new(INT2NUM(cid), vstr));
  return 0;
}

static VALUE ffeature_each_char(VALUE obj){
  RB_CHISE_FEATURE *rfeature;
  Data_Get_Struct(obj, RB_CHISE_FEATURE, rfeature);
  chise_feature_foreach_char_with_value(rfeature->feature, &feature_map_func);
  return Qnil;
}

static VALUE fds_get_ccs(VALUE obj, VALUE ccs){
  RB_CHISE_DS *rds;
  RB_CHISE_CCS *rccs;
  Data_Get_Struct(obj, RB_CHISE_DS, rds);
  VALUE vccs = Data_Make_Struct(cCCS, RB_CHISE_CCS, 0, free, rccs);
  rccs->ccs = chise_ds_get_ccs(rds->ds, STR2CSTR(ccs));
  if (rccs->ccs == NULL) return Qnil;
  return vccs;
}

static VALUE fds_decode_char(VALUE obj, VALUE ccs, VALUE code_point){
  RB_CHISE_DS *rds;
  Data_Get_Struct(obj, RB_CHISE_DS, rds);
  CHISE_Char_ID cid = chise_ds_decode_char(rds->ds, STR2CSTR(ccs), NUM2INT(code_point));
  return INT2NUM(cid);
}

static VALUE fccs_setup_db(VALUE obj, VALUE writable){
  RB_CHISE_CCS *rccs;
  Data_Get_Struct(obj, RB_CHISE_CCS, rccs);
  int status = chise_ccs_setup_db(rccs->ccs, NUM2INT(writable));
  if (status) return Qnil;
  return Qtrue;
}

static VALUE fccs_sync(VALUE obj){
  RB_CHISE_CCS *rccs;
  Data_Get_Struct(obj, RB_CHISE_CCS, rccs);
  int status = chise_ccs_sync(rccs->ccs);
  if (status) return Qnil;
  return Qtrue;
}

static VALUE fccs_set(VALUE obj, VALUE code_point, VALUE cid){
  RB_CHISE_CCS *rccs;
  Data_Get_Struct(obj, RB_CHISE_CCS, rccs);
  int status = chise_ccs_set_decoded_char(rccs->ccs, NUM2INT(code_point), (CHISE_Char_ID)NUM2INT(cid));
  if (status) return Qnil;
  return Qtrue;
}

static VALUE fccs_decode(VALUE obj, VALUE code_point){
  RB_CHISE_CCS *rccs;
  Data_Get_Struct(obj, RB_CHISE_CCS, rccs);
  CHISE_Char_ID cid = chise_ccs_decode(rccs->ccs, NUM2INT(code_point));
  if (cid == -1) return Qnil;
  return INT2NUM(cid);
}

void Init_libchise_c(){
  mCHISE = rb_define_module("CHISE");

  cDS = rb_define_class_under(mCHISE, "DataSource_C", rb_cObject);
  rb_define_const(cDS, "NONE", INT2FIX(CHISE_DS_NONE));
  rb_define_const(cDS, "Berkeley_DB", INT2FIX(CHISE_DS_Berkeley_DB));
  rb_define_const(cDS, "DB_DIR", rb_str_new2(chise_system_db_dir));
  rb_define_singleton_method(cDS, "new", fds_new, 4);
  rb_define_method(cDS, "close", fds_close, 0);
  rb_define_method(cDS, "each_feature_name", fds_each_feature_name, 0);
  rb_define_method(cDS, "get_feature", fds_get_feature, 1);
  rb_define_method(cDS, "load_feature", fds_load_feature, 2);
  rb_define_method(cDS, "get_ccs", fds_get_ccs, 1);
  rb_define_method(cDS, "decode_char", fds_decode_char, 2);

  cFEATURE = rb_define_class_under(mCHISE, "Feature_C", rb_cObject);
  rb_define_method(cFEATURE, "setup_db", ffeature_setup_db, 1);
  rb_define_method(cFEATURE, "sync", ffeature_sync, 0);
  rb_define_method(cFEATURE, "set_value", ffeature_set_value, 2);
  rb_define_method(cFEATURE, "get_value", ffeature_get_value, 1);
  rb_define_method(cFEATURE, "each_char", ffeature_each_char, 0);

  cCCS = rb_define_class_under(mCHISE, "CCS_C", rb_cObject);
  rb_define_method(cCCS, "setup_db", fccs_setup_db, 1);
  rb_define_method(cCCS, "sync", fccs_sync, 0);
  rb_define_method(cCCS, "set", fccs_set, 2);
  rb_define_method(cCCS, "decode", fccs_decode, 1);
}
