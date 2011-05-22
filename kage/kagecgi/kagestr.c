//kagestr.c
//

#include "sysdep.h"
#include "kagestr.h"

KGString* kg_string_new(char *initString){
  KGString *tmp;
  tmp = (KGString *)malloc(sizeof(KGString));
  if(initString == NULL){
    tmp->len = 0;
    tmp->str = (char *)malloc(0);
  }
  else{
    tmp->len = strlen(initString);
    tmp->str = (char *)malloc(tmp->len + 1);
    strcpy(tmp->str, initString);
  }
  return tmp;
}

KGString* kg_string_set_size(KGString *target, int newSize){
  target->len = newSize;
  target->str = (char *)realloc((char *)target->str, target->len + 1);
  target->str[target->len] = '\0';
  return target;
}

KGString* kg_string_append_len(KGString *target, char *appendString, int length){
  target->len = target->len + length;
  target->str = (char *)realloc((char *)target->str, target->len + 1);
  strncat(target->str, appendString, length);
  return target;
}

KGString* kg_string_append(KGString *target, char *appendString){
  target->len = target->len + strlen(appendString);
  target->str = (char *)realloc((char *)target->str, target->len + 1);
  strcat(target->str, appendString);
  return target;
}

KGString* kg_string_erase(KGString *target, int startPoint, int length){
  char *tmp;
  int oldLength;
  oldLength = target->len;
  target->len = target->len - length;
  tmp = (char *)malloc(target->len + 1);
  strncpy(tmp, target->str, startPoint);
  tmp[startPoint] = '\0';
  if(oldLength > startPoint + length) strcat(tmp, target->str + startPoint + length);
  target->str = (char *)realloc((char *)target->str, target->len + 1);
  strcpy(target->str, tmp);
  free(tmp);
  return target;
}

KGString* kg_string_assign(KGString *target, char *assignString){
  target->len = strlen(assignString);
  target->str = (char *)realloc((char *)target->str, target->len + 1);
  strcpy(target->str, assignString);
  return target;
}

  



