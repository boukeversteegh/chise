//kagestr.h
//

#ifndef _KAGESTR_H_
#define _KAGESTR_H_

typedef char kgchar;

typedef struct _KGString {
  char *str;
  int len;
} KGString;

KGString* kg_string_new(char*);
KGString* kg_string_set_size(KGString*, int);
KGString* kg_string_append_len(KGString*, char*, int);
KGString* kg_string_append(KGString*, char*);
KGString* kg_string_erase(KGString*, int, int);
KGString* kg_string_assign(KGString*, char*);

#endif

