//kagedb.c
//

#include "kage.h"
#include "kagecgi.h"
#include "sysdep.h"

int initDB(){
  db_create(&kPartsdbDatabase, NULL, 0);
  kPartsdbDatabase->open(kPartsdbDatabase, NULL, partsdbFileName, NULL, DB_HASH, DB_RDONLY, 0644);
  db_create(&kIdsdbDatabase, NULL, 0);
  kIdsdbDatabase->open(kIdsdbDatabase, NULL, idsdbFileName, NULL, DB_HASH, DB_RDONLY, 0644);
  db_create(&kAliasdbDatabase, NULL, 0);
  kAliasdbDatabase->open(kAliasdbDatabase, NULL, aliasdbFileName, NULL, DB_HASH, DB_RDONLY, 0644);
  return 0;
}

int closeDB(){
  kPartsdbDatabase->close(kPartsdbDatabase, 0);
  kIdsdbDatabase->close(kIdsdbDatabase, 0);
  kAliasdbDatabase->close(kAliasdbDatabase, 0);
  return 0;
}

void searchPartsData(const KGString *in, KGString *out){
  DBT dbkey, dbdata;
  char *buf;
  KGString *temp, *temp2;
  
  //cut off the end '-0000' if 'in' end with it
  temp = kg_string_new(in->str);
  //if(strncmp(temp->str + temp->len - 5, "-0000", 5) == 0) kg_string_set_size(temp, temp->len - 5);
  if((temp->str)[0] == 'u'){
    if(strncmp(temp->str + temp->len - 4, "-j00", 4) == 0) kg_string_set_size(temp, temp->len - 4);
    else if(strncmp(temp->str + temp->len - 4, "-g00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-t00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-k00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-v00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-u00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
  }
  //else{
  //  kg_string_set_size(temp, in->len);
  //}
  
  memset(&dbkey,0,sizeof(DBT));
  memset(&dbdata,0,sizeof(DBT));
  dbkey.data = temp->str;
  dbkey.size = temp->len;
  kg_string_set_size(out, 0);
  //fprintf(stderr, "trytogetparts:%s(%s:%d)\n", in->str, temp->str,temp->len);
  kPartsdbDatabase->get(kPartsdbDatabase, NULL, &dbkey, &dbdata, 0);
  if(dbdata.size != 0){
    //fprintf(stderr, "getparts:%s\n", in->str);
    //for temporary : shares glyph both Mincho and Gothic
    buf = (char *)malloc(dbdata.size + 1);
    strncpy(buf, dbdata.data, dbdata.size);
    buf[dbdata.size] = '\0'; 
    temp2 = kg_string_new(buf);
    //fprintf(stderr,"%s\n",buf);
    free(buf);
    convert99(temp2, out);
    return;
  }
}

void searchAliasData(const KGString *in, KGString *out){
  DBT dbkey, dbdata;
  char *buf;
  KGString *temp;
  
  //cut off the end '-0000' if 'in' end with it
  temp = kg_string_new(in->str);
  //if(strncmp(temp->str + temp->len - 5, "-0000", 5) == 0) kg_string_set_size(temp, temp->len - 5);
  if((temp->str)[0] == 'u'){
    if(strncmp(temp->str + temp->len - 4, "-j00", 4) == 0) kg_string_set_size(temp, temp->len - 4);
    else if(strncmp(temp->str + temp->len - 4, "-g00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-t00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-k00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-v00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
    else if(strncmp(temp->str + temp->len - 4, "-u00", 4) == 0) kg_string_set_size(temp, temp->len - 2);
  }
  
  memset(&dbkey,0,sizeof(DBT));
  memset(&dbdata,0,sizeof(DBT));
  dbkey.data = temp->str;
  dbkey.size = temp->len;
  kg_string_set_size(out, 0);
  kAliasdbDatabase->get(kAliasdbDatabase, NULL, &dbkey, &dbdata, 0);
  if(dbdata.size != 0){
    buf = (char *)malloc(dbdata.size + 1);
    strncpy(buf, dbdata.data, dbdata.size);
    buf[dbdata.size] = '\0'; 
    //fprintf(stderr,"%s\n",buf);
    kg_string_append(out, buf);
    free(buf);
    return;
  }
  
  memset(&dbkey,0,sizeof(DBT));
  memset(&dbdata,0,sizeof(DBT));
  dbkey.data = temp->str;
  dbkey.size = temp->len;
  kg_string_set_size(out, 0);
  kIdsdbDatabase->get(kIdsdbDatabase, NULL, &dbkey, &dbdata, 0);
  if(dbdata.size != 0){
    buf = (char *)malloc(dbdata.size + 1);
    strncpy(buf, dbdata.data, dbdata.size);
    buf[dbdata.size] = '\0'; 
    //fprintf(stderr,"%s\n",buf);
    kg_string_append(out, buf);
    free(buf);
  }
}
