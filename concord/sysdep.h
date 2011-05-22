#ifndef _CHISE_SYSDEP_H
#define _CHISE_SYSDEP_H

#include <string.h>

#ifndef HAVE_STRNLEN
/* original in mysql, strings/strnlen.c.
uint strnlen(register const char *s, register uint maxlen)
{
  const char *end= (const char *)memchr(s, '\0', maxlen);
  return end ? (uint) (end - s) : maxlen;
}
*/
static inline int
strnlen (register const char *s, register int maxlen)
{
  const char *end= (const char *)memchr(s, '\0', maxlen);
  return end ? (int) (end - s) : maxlen;
}
#endif

#define xzero(lvalue) ((void) memset (&(lvalue), '\0', sizeof (lvalue)))

#endif /* !_CHISE_SYSDEP_H */
