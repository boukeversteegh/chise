//kageeg.c
//

#include "kage.h"
#include "kagecgi.h"
#include "sysdep.h"

void generateGlyphByIDS(const KGString *in, KGString *out, int flag){
  KGString *tmp1, *tmp2;
  
  //pass this method if 'in' is not UCS parts
  if((in->str)[0] != 'u'){
    generateGlyph(in, out);
    return;
  }
  //pass this method if 'in' is place-variant-flag defined
  if(in->len < 5 && 7 < in->len){
    generateGlyph(in, out);
    return;
  }
  
  tmp1 = kg_string_new(in->str);
  tmp2 = kg_string_new(in->str);
  
  //append place flag
  if(1 <= flag && flag <= 7){
    if(tmp1->len != 7) kg_string_append(tmp1, "-");
    if(flag == 1) kg_string_append(tmp1, "01");
    else if(flag == 2) kg_string_append(tmp1, "02");
    else if(flag == 3) kg_string_append(tmp1, "03");
    else if(flag == 4) kg_string_append(tmp1, "04");
    else if(flag == 5) kg_string_append(tmp1, "05");
    else if(flag == 6) kg_string_append(tmp1, "06");
  }
  
  generateGlyph(tmp1, out);
  if(out->len != 0) return;
  generateGlyph(tmp2, out);
  if(out->len != 0) return;
  return;
}

void generateGlyph(const KGString *in, KGString *out){
  KGString *tmp;
  tmp = kg_string_new("");
  kg_string_set_size(out, 0);
  
  //search from parts
  searchPartsData(in, tmp);
  if(tmp->len != 0){
    //fprintf(stderr, "partsFound:%s\n",tmp->str);
    tmp = CalcSizes(tmp, 1);// this line may not be needed
    out = kg_string_assign(out, tmp->str);
    return;
  }
  //else{
  //  fprintf(stderr, "partsNotFound:%s\n",in->str);
  //}
  
  //search from alias
  searchAliasData(in, tmp);
  if(tmp->len != 0){
    //fprintf(stderr, "aliasFound:%s(%d)\n",tmp->str,tmp->len);
    generateGlyph(tmp, out);
    if(out->len == 0) return;
    //save to cache ... not yet
    return;
  }
  //else{
  //  fprintf(stderr, "aliasNotFound:%s\n",in->str);
  //}
  
  //check if its IDS
  if(isIDS(in)){
    doCombine(in, out);
    if(out->len == 0) return;
    //save to cache ... not yet
    return;
  }
}

void doCombine(const KGString *in, KGString *out){
  KGString *partIDS1, *partIDS2, *partIDS3;
  KGString *partStroke1, *partStroke2, *partStroke3;
  int result[12];
  
  partIDS1 = kg_string_new("");
  partIDS2 = kg_string_new("");
  partIDS3 = kg_string_new("");
  partStroke1 = kg_string_new("");
  partStroke2 = kg_string_new("");
  partStroke3 = kg_string_new("");
  
  kg_string_set_size(out, 0);
  
  //check first IDC
  if(strncmp(in->str, "u2ff", 4) != 0) return;
  //switch by combine types
  switch((in->str)[4]){
  case '0':
    divideInto2(in, partIDS1, partIDS3);
    if(partIDS1->len == 0) return;
    //ready each parts
    generateGlyphByIDS(partIDS1, partStroke1, 1);
    if(partStroke1->len == 0) return;
    partStroke1 = CalcSizes(partStroke1, 0);
    generateGlyphByIDS(partIDS3, partStroke3, 2);
    if(partStroke3->len == 0) return;
    partStroke3 = CalcSizes(partStroke3, 0);
    break;
  case '1':
    divideInto2(in, partIDS1, partIDS3);
    if(partIDS1->len == 0) return;
    //ready each parts
    generateGlyphByIDS(partIDS1, partStroke1, 3);
    if(partStroke1->len == 0) return;
    partStroke1 = CalcSizes(partStroke1, 0);
    generateGlyphByIDS(partIDS3, partStroke3, 4);
    if(partStroke3->len == 0) return;
    partStroke3 = CalcSizes(partStroke3, 0);
    break;
  case '4': //full surround
  case '5': //surround from above
  case '6': //surround from below
  case '7': //surround from left
  case '8': //surround from upper left
  case '9': //surround from upper right
  case 'a': //surround from lower left
    //case 'b': //overlaid (not supported)
    divideInto2(in, partIDS1, partIDS3);
    if(partIDS1->len == 0) return;
    //ready each parts
    generateGlyphByIDS(partIDS1, partStroke1, 5);
    if(partStroke1->len == 0) return;
    partStroke1 = CalcSizes(partStroke1, 0);
    generateGlyphByIDS(partIDS3, partStroke3, 6);
    if(partStroke3->len == 0) return;
    partStroke3 = CalcSizes(partStroke3, 0);
    break;
  case '2':
    divideInto3(in, partIDS1, partIDS2, partIDS3);
    if(partIDS1->len == 0) return;
    //ready each parts
    generateGlyphByIDS(partIDS1, partStroke1, 1);
    if(partStroke1->len == 0) return;
    partStroke1 = CalcSizes(partStroke1, 0);
    generateGlyphByIDS(partIDS2, partStroke2, 1);
    if(partStroke2->len == 0) return;
    partStroke2 = CalcSizes(partStroke2, 0);
    generateGlyphByIDS(partIDS3, partStroke3, 2);
    if(partStroke3->len == 0) return;
    partStroke3 = CalcSizes(partStroke3, 0);
    break;
  case '3':
    divideInto3(in, partIDS1, partIDS2, partIDS3);
    if(partIDS1->len == 0) return;
    //ready each parts
    generateGlyphByIDS(partIDS1, partStroke1, 3);
    if(partStroke1->len == 0) return;
    partStroke1 = CalcSizes(partStroke1, 0);
    generateGlyphByIDS(partIDS2, partStroke2, 3);
    if(partStroke2->len == 0) return;
    partStroke2 = CalcSizes(partStroke2, 0);
    generateGlyphByIDS(partIDS3, partStroke3, 4);
    if(partStroke3->len == 0) return;
    partStroke3 = CalcSizes(partStroke3, 0);
    break;
  }
  switch((in->str)[4]){
  case '0':
    combineYoko2(partStroke1, partStroke3, result);
    break;
  case '1':
    combineTate2(partStroke1, partStroke3, result);
    break;
  case '2':
    combineYoko3(partStroke1, partStroke2, partStroke3, result);
    break;
  case '3':
    combineTate3(partStroke1, partStroke2, partStroke3, result);
    break;
  case '4': //full surround
    combineHame2(partStroke1, partStroke3, result,
                 FLAG_SURROUND_LEFT |
                 FLAG_SURROUND_RIGHT |
                 FLAG_SURROUND_TOP |
                 FLAG_SURROUND_BOTTOM);
    break;
  case '5': //surround from above
    combineHame2(partStroke1, partStroke3, result,
                 FLAG_SURROUND_LEFT |
                 FLAG_SURROUND_RIGHT |
                 FLAG_SURROUND_TOP);
    break;
  case '6': //surround from below
    combineHame2(partStroke1, partStroke3, result,
                 FLAG_SURROUND_LEFT |
                 FLAG_SURROUND_RIGHT |
                 FLAG_SURROUND_BOTTOM);
    break;
  case '7': //surround from left
    combineHame2(partStroke1, partStroke3, result,
                 FLAG_SURROUND_LEFT |
                 FLAG_SURROUND_TOP |
                 FLAG_SURROUND_BOTTOM);
    break;
  case '8': //surround from upper left
    combineHame2(partStroke1, partStroke3, result,
                 FLAG_SURROUND_LEFT |
                 FLAG_SURROUND_TOP);
    break;
  case '9': //surround from upper right
    combineHame2(partStroke1, partStroke3, result,
                 FLAG_SURROUND_RIGHT |
                 FLAG_SURROUND_TOP);
    break;
  case 'a': //surround from lower left
    combineHame2(partStroke1, partStroke3, result,
                 FLAG_SURROUND_LEFT |
                 FLAG_SURROUND_BOTTOM);
    break;
    //case 'b': //overlaid (not supported)
  }
  switch((in->str)[4]){
  case '0':
  case '1':
  case '4':
  case '5':
  case '6':
  case '7':
  case '8':
  case '9':
  case 'a':
    //case 'b':
    addStrokeWithTransform(partStroke1, 1, result, out, 1);
    addStrokeWithTransform(partStroke3, 3, result, out, 1);
    break;
  case '2':
  case '3':
    addStrokeWithTransform(partStroke1, 1, result, out, 1);
    addStrokeWithTransform(partStroke2, 2, result, out, 1);
    addStrokeWithTransform(partStroke3, 3, result, out, 1);
    break;
  }
  //fprintf(stderr,"%s\n",out->str);
}

void drawGlyph(const KGString *in, const int mode){
  int i, j;
  int *buf;
  buf = convertStroke(in->str, buf, &j);
  for(i = 0; i < j; i++){
    if(mode == DRAW_GLYPH_MODE_NORMAL){ //normal
      dfDrawFont(buf[i * 11 + 0],
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
    }
    else if(mode == DRAW_GLYPH_MODE_WITHOUT_DECORATION){ //without decoration
      dfDrawFont(buf[i * 11 + 0],
                 0,
                 0,
                 buf[i * 11 + 3],
                 buf[i * 11 + 4],
                 buf[i * 11 + 5],
                 buf[i * 11 + 6],
                 buf[i * 11 + 7],
                 buf[i * 11 + 8],
                 buf[i * 11 + 9],
                 buf[i * 11 + 10]);
    }
  }
  free(buf);
}

KGString* finalAdjustment(const KGString *in){
  int i, j, k, l, m, n;
  int *buf;
  KGString *temp;
  
  n = kShotai;
  kShotai = kGothic;
  temp = kg_string_new("");
  
  DrawBox();
  drawGlyph(in, DRAW_GLYPH_MODE_WITHOUT_DECORATION);
  
  buf = convertStroke(in->str, buf, &j);
  for(i = 0; i < j; i++){
    m = 0;
    if(buf[i * 11 + 2] == 13){
      for(k = buf[i * 11 + 5] - kMinWidthT; k < buf[i * 11 + 5] + kMinWidthT; k++){
        for(l = buf[i * 11 + 6] + kWidth * kKakato * 0.5; l < buf[i * 11 + 6] + kWidth * kKakato + pngHeight * 0.1; l++){
          if(0 <= l && l < canvasHeight && 0 <= k && k < canvasHeight && kageCanvas[l][k] != kWhite) m++;
        }
      }
      if(m != 0) buf[i * 11 + 2] = 23;
    }
  }
  convertArray(buf, temp, j, 0);
  free(buf);
  kShotai = n;
  return kg_string_new(temp->str);
}

