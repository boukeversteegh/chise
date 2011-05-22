//kagechar.c
//

#include "kage.h"
#include "kagecgi.h"
#include "sysdep.h"

int isIDS(const KGString *in){
  //check IDC "u2ff*"
  if(strncmp(in->str, "u2ff", 4) == 0){
    //check the last char
    if('0' <= (in->str)[4] && (in->str)[4] <= 'a') return 1; //true
  }
  return 0; //false
}

void divideInto2(const KGString *in, KGString *partIDS1, KGString *partIDS3){
  KGString *buffer[16];
  char tmp[kMaxIDCLength + 1];
  int i, counter, pointer, flag;
  
  kg_string_set_size(partIDS1, 0);
  
  counter = 0;
  pointer = 0;
  for(i = 0; i < in->len; i++){
    if((in->str)[i] == '.'){
      strncpy(tmp, (in->str) + pointer, i - pointer);
      tmp[i - pointer] = '\0';
      buffer[counter] = kg_string_new(tmp);
      counter++;
      pointer = i + 1;
    }
  }
  strncpy(tmp, (in->str) + pointer, i - pointer);
  tmp[i - pointer] = '\0';
  buffer[counter] = kg_string_new(tmp);
  counter++;
  
  //reject over-length of IDS
  if(counter > kMaxIDSSequenceLength) return;
  
  //1st scan
  pointer = 1;
  flag = 0;
  while(flag >= 0 && pointer < counter){
    kg_string_append(partIDS1, (buffer[pointer])->str);
    kg_string_append(partIDS1, ".");
    if(strncmp((buffer[pointer])->str, "u2ff", 4) == 0){
      switch (((buffer[pointer])->str)[4]){
      case '0':
      case '1':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case 'a':
      case 'b':
	flag++;
	break;
      case '2':
      case '3':
	flag = flag + 2;
	break;
      }
    }
    else flag--;
    pointer++;
  }
  kg_string_erase(partIDS1, partIDS1->len - 1, 1);
  
  //2nd scan
  flag = 0;
  while(flag >= 0 && pointer < counter){
    kg_string_append(partIDS3, (buffer[pointer])->str);
    kg_string_append(partIDS3, ".");
    if(strncmp((buffer[pointer])->str, "u2ff", 4) == 0){
      switch (((buffer[pointer])->str)[4]){
      case '0':
      case '1':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case 'a':
      case 'b':
	flag++;
	break;
      case '2':
      case '3':
	flag = flag + 2;
	break;
      }
    }
    else flag--;
    pointer++;
  }
  kg_string_erase(partIDS3, partIDS3->len - 1, 1);
}

void divideInto3(const KGString *in, KGString *partIDS1, KGString *partIDS2, KGString *partIDS3){
  KGString *buffer[16];
  char tmp[kMaxIDCLength + 1];
  int i, counter, pointer, flag;
  
  kg_string_set_size(partIDS1, 0);
  
  counter = 0;
  pointer = 0;
  for(i = 0; i < in->len; i++){
    if((in->str)[i] == '.'){
      strncpy(tmp, (in->str) + pointer, i - pointer);
      tmp[i - pointer] = '\0';
      buffer[counter] = kg_string_new(tmp);
      counter++;
      pointer = i + 1;
    }
  }
  strncpy(tmp, (in->str) + pointer, i - pointer);
  tmp[i - pointer] = '\0';
  buffer[counter] = kg_string_new(tmp);
  counter++;
  
  //reject over-length of IDS
  if(counter > kMaxIDSSequenceLength) return;
  
  //1st scan
  pointer = 1;
  flag = 0;
  while(flag >= 0 && pointer < counter){
    kg_string_append(partIDS1, (buffer[pointer])->str);
    kg_string_append(partIDS1, ".");
    if(strncmp((buffer[pointer])->str, "u2ff", 4) == 0){
      switch (((buffer[pointer])->str)[4]){
      case '0':
      case '1':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case 'a':
      case 'b':
	flag++;
	break;
      case '2':
      case '3':
	flag = flag + 2;
	break;
      }
    }
    else flag--;
    pointer++;
  }
  kg_string_erase(partIDS1, partIDS1->len - 1, 1);
  
  //2nd scan
  flag = 0;
  while(flag >= 0 && pointer < counter){
    kg_string_append(partIDS2, (buffer[pointer])->str);
    kg_string_append(partIDS2, ".");
    if(strncmp((buffer[pointer])->str, "u2ff", 4) == 0){
      switch (((buffer[pointer])->str)[4]){
      case '0':
      case '1':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case 'a':
      case 'b':
	flag++;
	break;
      case '2':
      case '3':
	flag = flag + 2;
	break;
      }
    }
    else flag--;
    pointer++;
  }
  kg_string_erase(partIDS2, partIDS2->len - 1, 1);
  
  //3rd scan
  flag = 0;
  while(flag >= 0 && pointer < counter){
    kg_string_append(partIDS3, (buffer[pointer])->str);
    kg_string_append(partIDS3, ".");
    if(strncmp((buffer[pointer])->str, "u2ff", 4) == 0){
      switch (((buffer[pointer])->str)[4]){
      case '0':
      case '1':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case 'a':
      case 'b':
	flag++;
	break;
      case '2':
      case '3':
	flag = flag + 2;
	break;
      }
    }
    else flag--;
    pointer++;
  }
  kg_string_erase(partIDS3, partIDS3->len - 1, 1);
}

void addStrokeWithTransform(const KGString *stroke, const int num, const int *tf, KGString *out, int mode){
  int *buf, i, size;
  KGString *tmp;
  
  tmp = kg_string_new("");
  buf = convertStroke(stroke->str, buf, &size);
  
  for(i = 0; i < size; i++){
    if(buf[i * 11 + 0] != 0 && buf[i * 11 + 0] != 99){
      buf[i * 11 + 3] =
	tf[(num - 1) * 4 + 0] + buf[i * 11 + 3] * (tf[(num - 1) * 4 + 2] - tf[(num - 1) * 4 + 0]) / pngWidth;
      buf[i * 11 + 5] =
	tf[(num - 1) * 4 + 0] + buf[i * 11 + 5] * (tf[(num - 1) * 4 + 2] - tf[(num - 1) * 4 + 0]) / pngWidth;
      buf[i * 11 + 7] =
	tf[(num - 1) * 4 + 0] + buf[i * 11 + 7] * (tf[(num - 1) * 4 + 2] - tf[(num - 1) * 4 + 0]) / pngWidth;
      buf[i * 11 + 9] =
	tf[(num - 1) * 4 + 0] + buf[i * 11 + 9] * (tf[(num - 1) * 4 + 2] - tf[(num - 1) * 4 + 0]) / pngWidth;
      buf[i * 11 + 4] =
	tf[(num - 1) * 4 + 1] + buf[i * 11 + 4] * (tf[(num - 1) * 4 + 3] - tf[(num - 1) * 4 + 1]) / pngHeight;
      buf[i * 11 + 6] =
	tf[(num - 1) * 4 + 1] + buf[i * 11 + 6] * (tf[(num - 1) * 4 + 3] - tf[(num - 1) * 4 + 1]) / pngHeight;
      buf[i * 11 + 8] =
	tf[(num - 1) * 4 + 1] + buf[i * 11 + 8] * (tf[(num - 1) * 4 + 3] - tf[(num - 1) * 4 + 1]) / pngHeight;
      buf[i * 11 + 10] =
	tf[(num - 1) * 4 + 1] + buf[i * 11 + 10] * (tf[(num - 1) * 4 + 3] - tf[(num - 1) * 4 + 1]) / pngHeight;
    }
  }
  convertArray(buf, tmp, size, mode);
  if(out->len != 0) kg_string_append(out, "$");
  kg_string_append(out, tmp->str);
  
  free((void *)buf);
}

void convertArray(int *buf, KGString *out, int size, int mode){
  int i;
  char tmp[kMaxStrokeDataLength];
  
  for(i = 0; i < size; i++){
    if(!(mode == 1 && (buf[i * 11 + 0] == 0 || buf[i * 11 + 0] == 99))){
      sprintf(tmp, "%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d$",
	      buf[i * 11 + 0],
	      buf[i * 11 + 1],
	      buf[i * 11 + 2],
	      buf[i * 11 + 3],
	      buf[i * 11 + 4],
	      buf[i * 11 + 5],
	      buf[i * 11 + 6],
	      buf[i * 11 + 7],
	      buf[i * 11 + 8],
	      buf[i * 11 + 9],
	      buf[i * 11 + 10]);
      kg_string_append(out, tmp);
    }
  }
  out = kg_string_erase(out, (out->len - 1), 1);
}

int * convertStroke(const char *in, int *a, int *size){
  int i, counter, pointer;
  int a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10;
  char tmp[kMaxStrokeDataLength + 1];
  
  a = (int *)malloc(0);
  counter = 0;
  pointer = 0;
  for(i = 0; i < strlen(in); i++){
    if(in[i] == '$'){
      strncpy(tmp, &in[pointer], i - pointer);
      tmp[i - pointer] = '\0';
      a = (int *)realloc(a, sizeof(int) * 11 * (counter + 1));
      sscanf(tmp, "%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d",
	     &a0,&a1,&a2,&a3,&a4,&a5,&a6,&a7,&a8,&a9,&a10);
      a[counter * 11 + 0] = a0;
      a[counter * 11 + 1] = a1;
      a[counter * 11 + 2] = a2;
      a[counter * 11 + 3] = a3;
      a[counter * 11 + 4] = a4;
      a[counter * 11 + 5] = a5;
      a[counter * 11 + 6] = a6;
      a[counter * 11 + 7] = a7;
      a[counter * 11 + 8] = a8;
      a[counter * 11 + 9] = a9;
      a[counter * 11 + 10] = a10;
      counter++;
      pointer = i + 1;
    }
  }
  strncpy(tmp, &in[pointer], i - pointer);
  tmp[i - pointer] = '\0';
  a = (int *)realloc(a, sizeof(int) * 11 * (counter + 1));
  sscanf(tmp, "%d:%d:%d:%d:%d:%d:%d:%d:%d:%d:%d",
	 &a0,&a1,&a2,&a3,&a4,&a5,&a6,&a7,&a8,&a9,&a10);
  a[counter * 11 + 0] = a0;
  a[counter * 11 + 1] = a1;
  a[counter * 11 + 2] = a2;
  a[counter * 11 + 3] = a3;
  a[counter * 11 + 4] = a4;
  a[counter * 11 + 5] = a5;
  a[counter * 11 + 6] = a6;
  a[counter * 11 + 7] = a7;
  a[counter * 11 + 8] = a8;
  a[counter * 11 + 9] = a9;
  a[counter * 11 + 10] = a10;
  counter++;
  *(size) = counter;
  return a;
}

void convert99(const KGString *in, KGString *out){
  int i, pointer;
  char tmp[kMaxStrokeDataLength + 1];
  KGString *buf;
  
  kg_string_set_size(out, 0);
  buf = kg_string_new("");
  pointer = 0;
  for(i = 0; i < in->len; i++){
    if((in->str)[i] == '$'){
      strncpy(tmp, in->str + pointer, i - pointer);
      tmp[i - pointer] = '\0';
      if(strncmp(tmp, "99:", 3) == 0){
	convert99calc(tmp, buf);
	if(buf->len == 0){
	  kg_string_set_size(out, 0);
	  return;
	}
	kg_string_append(out, buf->str);
      }
      else kg_string_append(out, tmp);
      kg_string_append(out, "$");
      
      pointer = i + 1;
    }
  }
  strncpy(tmp, in->str + pointer, i - pointer);
  tmp[i - pointer] = '\0';
  if(strncmp(tmp, "99:", 3) == 0){
    convert99calc(tmp, buf);
    if(buf->len == 0){
      kg_string_set_size(out, 0);
      return;
    }
    kg_string_append(out, buf->str);
  }
  else kg_string_append(out, tmp);
}

void convert99calc(const char *in, KGString *out){
  KGString *buf1, *buf2;
  int a1,x1,y1,x2,y2,option,option2;
  char pname[kMaxStrokeDataLength];
  int tf[12];
  
  kg_string_set_size(out, 0);
  buf2 = kg_string_new("");
  
  //get parts data
  sscanf(in, "%d:%d:%d:%d:%d:%d:%d:%s",
	 &a1,&option,&option2,&x1,&y1,&x2,&y2,pname);
  //end = strchr(pname, ':');
  //*end = '\0';
  buf1 = kg_string_new(pname);
  generateGlyph(buf1, buf2);
  //calc_sizes for using IDS as pname
  buf2 = CalcSizes(buf2, 1);
  if(buf2->len == 0) return;
  
  //convert
  tf[0] = x1;
  tf[1] = y1;
  tf[2] = x2;
  tf[3] = y2;
  addStrokeWithTransform(buf2, 1, tf, out, 1);
}
