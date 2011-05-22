// chise.i
//
// Copyright (C) 2005,2006 KAMICHI Koichi.
//
// reference : http://www.swig.org/Doc1.3/Perl5.html
//             sample.c included to libchise

%module chise

%{
#include <concord.h>
#include <chise.h>
%}

%include concord.h
%include chise.h

%inline %{

#include <concord.h>
#include <chise.h>

unsigned char *get_uchar(char *argv){
  return (unsigned char *)argv;
}

char *get_char(unsigned char *argv){
  return (char *)argv;
}

unsigned char *feature;
int feature_size = 102400;
unsigned char *buffer;
int buffer_size = 1024;

void clear_buffer(){
  int i;
  for(i = 0; i < buffer_size; i++){
    buffer[i] = 0;
  }
}

void allocate_buffer(){
  feature = (unsigned char *)malloc(feature_size * sizeof(unsigned char));
  buffer = (unsigned char *)malloc(buffer_size * sizeof(unsigned char));
}
void free_buffer(){
  free(feature);
  free(buffer);
}

static int
name_map_func (CHISE_DS *ds, unsigned char *name)
{
  strcat((char *)feature, (char *)name);
  strcat((char *)feature, (char *)"\n");
  return 0;
}
void listup_feature(CHISE_DS *ds){
  int i;
  for(i = 0; i < feature_size; i++){
    feature[i] = 0;
  }
  chise_ds_foreach_char_feature_name (ds, &name_map_func);
}

%}

%perlcode %{
sub new{
  my $class = shift;
  chise::allocate_buffer();
  my $chise_ds = chise::CHISE_DS_open($chise::CHISE_DS_Berkeley_DB,
                                      $chise::chise_system_db_dir,
                                      0,
                                      0755);
  chise::listup_feature($chise_ds);
  my @chise_feature = split(/\n/, chise::get_char($chise::feature));
  my $chise_newid = -1;
  return bless {
    chise_ds => $chise_ds,
    chise_feature => \@chise_feature,
    chise_newid => $chise_newid}, $class;
}
sub DESTROY{
  my $self = shift;
  chise::free_buffer();
  if(define($self->{chise_ds})){ # Strange to say, chise_ds has already unavailable
    chise::CHISE_DS_close($self->{chise_ds});
  }
}
sub get_feature_list{ # original
  my $self = shift;
  my $hash = $self->{chise_feature};
  return @$hash;
}
sub ds_get_ccs{
  my $self = shift;
  return chise::chise_ds_get_ccs($self->{chise_ds},
                                 chise::get_uchar($_[0]));
}
sub ds_get_feature{
  my $self = shift;
  return chise::chise_ds_get_feature($self->{chise_ds},
                                     chise::get_uchar($_[0]));
}
sub ds_get_property{
  my $self = shift;
  return chise::chise_ds_get_property($self->{chise_ds},
                                      chise::get_uchar($_[0]));
}
sub ds_decode_char{
  my $self = shift;
  return chise::chise_ds_decode_char($self->{chise_ds},
                                     chise::get_uchar($_[0]),
                                     $_[1]);
}
sub ccs_decode{
  my $self = shift;
  return chise::chise_ccs_decode($_[0],
                                 $_[1]);
}
sub feature_gets_property_value{ # use feature/property strings directly
  my $self = shift;
  chise::clear_buffer();
  chise::chise_feature_gets_property_value($self->ds_get_feature($_[0]),
                                           $self->ds_get_property($_[1]),
                                           $chise::buffer,
                                           $chise::buffer_size);
  return chise::get_char($chise::buffer);
}
sub feature_gets_property_value_by_handle{
  my $self = shift;
  chise::clear_buffer();
  chise::chise_feature_gets_property_value($_[0],
                                           $_[1],
                                           $chise::buffer,
                                           $chise::buffer_size);
  return chise::get_char($chise::buffer);
}
sub char_gets_feature_value{ # use feature string directly
  my $self = shift;
  chise::clear_buffer();
  chise::chise_char_gets_feature_value($_[0],
                                       $self->ds_get_feature($_[1]),
                                       $chise::buffer,
                                       $chise::buffer_size);
  return chise::get_char($chise::buffer);
}
sub char_gets_feature_value_by_handle{
  my $self = shift;
  chise::clear_buffer();
  chise::chise_char_gets_feature_value($_[0],
                                       $_[1],
                                       $chise::buffer,
                                       $chise::buffer_size);
  return chise::get_char($chise::buffer);
}
sub system_db_dir{
  my $self = shift;
  return chise::get_char($chise::chise_system_db_dir);
}
sub db_dir{
  my $self = shift;
  return chise::get_char($chise::chise_db_dir);
}
sub db_format_version{
  my $self = shift;
  return chise::get_char($chise::chise_db_format_version);
}
sub ds_location{
  my $self = shift;
  return chise::get_char(chise::chise_ds_location($self->{chise_ds}));
}
sub get_newid{ # original : search new char_id and update $chise_newid
  my $self = shift;
  if($self->{chise_newid} < 0){
    $self->{chise_newid} = 0x0F0000;
    my @feature = $self->get_feature_list();
    while(1){
      my $found = 0;
      foreach(@feature){
        if($self->char_gets_feature_value($self->{chise_newid}, $_) ne ""){
          $found = 1;
          last;
        }
      }
      if($found == 0){
        last;
      }
      $self->{chise_newid}++;
    }
  }
  return $self->{chise_newid};
}

%}
