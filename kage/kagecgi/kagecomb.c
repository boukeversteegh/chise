//kagecomb.c
//

#include "kage.h"
#include "kagecgi.h"
#include "sysdep.h"

void combineYoko2(const KGString *parts1, const KGString *parts3, int *result){
  int f, g, h, i, j, k, l;
  int flg_boxL, flg_boxR;
  int YsideLa, YsideLb, YsideRa, YsideRb, YheightL, YnanameL, YsmallL;
  int pxL, pxR, pyL, pyR;
  double prL, prR, pryL, pryR, rL, rR, rTemp;
  int lxL, rxL, lxR, rxR;
  int dlyL, dryL, dlyR, dryR;
  int chk_y1, chk_y2;
  int mitsuL, mitsuR;
  double yokoL, tateL, yokoR, tateR;
  int *buf, strokes;
  int tempShotai;
  int bodyline1[pngWidth], bodyline2[pngWidth];
  double complex;
  int tooclose;
  
  //initialize
  pxL = 0;
  pyL = 0;
  prL = 1.0;
  pryL = 1.0;
  pxR = 0;
  pyR = 0;
  prR = 1.0;
  pryR = 1.0;
  
  YsideLa = 0;
  YsideLb = 0;
  YsideRa = 0;
  YsideRb = 0;
  YnanameL = 0;
  YheightL = pngWidth * 0.9;
  
  tempShotai = kShotai;
  kShotai = kGothic;
  
  CalcOptions(parts1, &mitsuL, &flg_boxL, &yokoL, &tateL);
  CalcOptions(parts3, &mitsuR, &flg_boxR, &yokoR, &tateR);
  
  //get thin when the left parts is radical
  if(flg_boxL & FLAG_RADICAL_LEFT) yokoL = yokoL / 2;
  
  //left parts Y-axis processing #1
  
  //if its upper and bottom are flat
  if(flg_boxL & FLAG_FLAT_TOP) YsideLa++;
  if(flg_boxL & FLAG_FLAT_BOTTOM) YsideLb++;
  
  //if its goes right-up
  j = 0;
  buf = convertStroke(parts1->str, buf, &strokes);
  for(i = 0; i < strokes; i++){
    if(buf[i * 11 + 0] / 10 == 1){
      j++;
    }
  }
  free(buf);
  l = 0;
  if(j != 0){
    YsideLb++;
    YnanameL++;
  }
  YheightL = YheightL - (YsideLa + YsideLb) * 2 * kWidth;
  
  //left parts Y-axis processing #2
  YsmallL = 0;
  YsmallL = 1;
  if(flg_boxL & FLAG_FLAT_TOP && flg_boxL & FLAG_FLAT_BOTTOM && tateL <= 4){
    YheightL = (double)YheightL * (max(0.65, tateL * 0.22));
  } else if(flg_boxL & FLAG_FLAT_BOTTOM && tateL <= 3){
    YheightL = (double)YheightL * 0.8;
  } else if(YnanameL != 0 && flg_boxL & FLAG_FLAT_TOP && tateL <= 4){
    YheightL = (double)YheightL * (max(0.65, tateL * 0.22));
  } else if(YnanameL != 0 && tateL <= 3){
    YheightL = (double)YheightL * 0.8;
  } else{
    YsmallL = 0;
  }
  
  //left parts Y-axis processing #3
  DoDrawParts(parts1, pxL, prL, pyL, pryL);
  DotsHeight(&dlyL, &dryL);
  pryL = (double)YheightL / (dryL - dlyL);
  
  if(YsmallL != 0){
    if(flg_boxL & FLAG_FLAT_TOP){
      pyL = kBaseline - (double)pngWidth * 0.9 + 6 * kWidth - dlyL * pryL;
    } else{
      pyL = kBaseline - (double)pngWidth * 0.9 + 2 * kWidth - dlyL * pryL;
    }
  } else{
    if(flg_boxL & FLAG_FLAT_BOTTOM || YnanameL != 0){
      pyL = kBaseline - 2 * kWidth - dryL * pryL;
    } else{
      pyL = kBaseline - dryL * pryL;
    }
  }
  
  //right parts Y-axis processing #1
  if(flg_boxR & FLAG_FLAT_TOP) YsideRa++;
  if(flg_boxR & FLAG_FLAT_BOTTOM) YsideRb++;
  
  DoDrawParts(parts3, pxR, prR, pyR, pryR);
  DotsHeight(&dlyR, &dryR);
  
  pryR = ((double)pngWidth * 0.9 - (YsideRa + YsideRb) * 2 * kWidth) / (dryR - dlyR);
  pyR = kBaseline - dryR * pryR;
  if(flg_boxR & FLAG_FLAT_BOTTOM){
    pyR = pyR - 2 * kWidth;
  }
  
  //calculate ratio
  rL = yokoL;
  rR = yokoR;
  
  if(flg_boxL & FLAG_FLAT_LEFT) rL = rL * 0.7;
  if(flg_boxL & FLAG_FLAT_RIGHT) rL = rL * 0.7;
  if(flg_boxR & FLAG_FLAT_LEFT) rR = rR * 0.7;
  if(flg_boxR & FLAG_FLAT_RIGHT) rR = rR * 0.7;
  
  rL = pow(rL, 0.6);
  rR = pow(rR, 0.6);
  
  rR = rR * 1.05;
  
  rTemp = rL + rR;
  rL = rL / rTemp;
  rR = rR / rTemp;
  
  prL = rL;
  prR = rR;
  
  pxL = 0;
  pxR = pngWidth * prL;
  
  //scan body line of left parts
  DoDrawParts(parts1, pxL, prL, pyL, pryL);
  for(i = 0; i < pngWidth; i++){
    bodyline1[i] = 0;
    for(j = pngWidth - 1; j >= 0; j--){
      if(kageCanvas[i][j] == 0 ||
         kageCanvas[i + 1][j] == 0 ||
         kageCanvas[i + 2][j] == 0 ||
         kageCanvas[i + 3][j] == 0 ||
         kageCanvas[i + 4][j] == 0 ||
         kageCanvas[i + 5][j] == 0 ||
         kageCanvas[i + 6][j] == 0 ||
         kageCanvas[i + 7][j] == 0){
/*
         kageCanvas[i + 7][j] == 0 ||
         kageCanvas[i + 8][j] == 0 ||
         kageCanvas[i + 9][j] == 0 ||
         kageCanvas[i + 10][j] == 0){
*/
        bodyline1[i] = j;
        j = -1;
      }
    }
  }
  
  //scan body line of right parts
  DoDrawParts(parts3, pxR, prR, pyR, pryR);
  for(i = 0; i < pngWidth; i++){
    bodyline2[i] = pngWidth;
    for(j = 0; j < pngWidth; j++){
      if(kageCanvas[i][j] == 0 ||
         kageCanvas[i + 1][j] == 0 ||
         kageCanvas[i + 2][j] == 0 ||
         kageCanvas[i + 3][j] == 0 ||
         kageCanvas[i + 4][j] == 0 ||
         kageCanvas[i + 5][j] == 0 ||
         kageCanvas[i + 6][j] == 0 ||
         kageCanvas[i + 7][j] == 0){
/*
         kageCanvas[i + 7][j] == 0 ||
         kageCanvas[i + 8][j] == 0 ||
         kageCanvas[i + 9][j] == 0 ||
         kageCanvas[i + 10][j] == 0){
*/
        bodyline2[i] = j;
        j = pngWidth;
      }
    }
  }
  
  //calculate the most thin length of two parts and fix right parts
  k = pngWidth;
  for(i = 0; i < pngWidth; i++){
    if(bodyline2[i] - bodyline1[i] < k){
      k = bodyline2[i] - bodyline1[i];
    }
  }
  if(k < 0){ k = 0; }
  k = min(kMixdot, k);
  pxR = pxR - k;
  
  //calculate if the two are too close
  tooclose = 0;
  for(i = 0; i < pngWidth; i++){
    if((bodyline2[i] - bodyline1[i]) - k < kWidth * 2){ // must be seperate with shotai?
      tooclose++;
    }
  }
  
  //final adjustment
  if(kShotai == kMincho){
    k = kMinWidthT;
  } else {
    k = kWidth;
  }
  complex = 1 / ((yokoL + yokoR) / 2);
  if(tooclose > pngWidth * 0.25){
    complex = complex * 1.5;
  }
  pxR = pxR + pow((complex * (double)k), 2.3);
  
  //set results
  result[0] = pxL;
  result[1] = pyL;
  result[2] = pxL + pngWidth * prL;
  result[3] = pyL + pngWidth * pryL;
  result[8] = pxR;
  result[9] = pyR;
  result[10] = pxR + pngWidth * prR;
  result[11] = pyR + pngWidth * pryR;
  
  kShotai = tempShotai;
}

void combineYoko3(const KGString *parts1, const KGString *parts2, const KGString *parts3, int *result){
  //temp.
  KGString *tempString;
  int tempResult[8], tempResult2[4];
  int minx, miny, maxx, maxy, width, height, width2, height2;
  
  tempString = kg_string_new("");
  combineYoko2(parts2, parts3, result);
  addStrokeWithTransform(parts2, 1, result, tempString, 1);
  addStrokeWithTransform(parts3, 3, result, tempString, 1);
  tempResult[0] = result[0];
  tempResult[1] = result[1];
  tempResult[2] = result[2];
  tempResult[3] = result[3];
  tempResult[4] = result[8];
  tempResult[5] = result[9];
  tempResult[6] = result[10];
  tempResult[7] = result[11];
  minx = result[0];
  miny = min(result[1], result[9]);
  maxx = result[10];
  maxy = max(result[3], result[11]);
  width = maxx - minx;
  height = maxy - miny;
  
  combineYoko2(parts1, tempString, result);
  tempResult2[0] = result[8];
  tempResult2[1] = result[9];
  tempResult2[2] = result[10];
  tempResult2[3] = result[11];
  width2 = result[10] - result[8];
  height2 = result[11] - result[9];
  
  result[4] = tempResult2[0] + (tempResult[0] - minx) * ((double)width2 / width); // always 0
  result[5] = tempResult2[1] + (tempResult[1] - miny) * ((double)height2 / height);
  result[6] = tempResult2[0] + (tempResult[2] - minx) * ((double)width2 / width);
  result[7] = tempResult2[1] + (tempResult[3] - miny) * ((double)height2 / height);
  result[8] = tempResult2[0] + (tempResult[4] - minx) * ((double)width2 / width);
  result[9] = tempResult2[1] + (tempResult[5] - miny) * ((double)height2 / height);
  result[10] = tempResult2[0] + (tempResult[6] - minx) * ((double)width2 / width);
  result[11] = tempResult2[1] + (tempResult[7] - miny) * ((double)height2 / height);
}

void combineTate2(const KGString *parts1, const KGString *parts3, int *result){
  int f, g, h, i, j, k, l;
  int flg_boxL, flg_boxR;
  int pxL, pxR, pyL, pyR;
  double prL, prR, pryL, pryR, rL, rR, rTemp;
  int lxL, rxL, lxR, rxR;
  int lyL, ryL, lyR, ryR;
  int dlxL, drxL, dlxR, drxR;
  int chk_x1, chk_x2;
  int mitsuL, mitsuR;
  double yokoL, tateL, yokoR, tateR;
  int tempShotai;
  
  //initialize
  pxL = 0;
  pyL = 0;
  prL = 1.0;
  pryL = 1.0;
  pxR = 0;
  pyR = 0;
  prR = 1.0;
  pryR = 1.0;
  
  tempShotai = kShotai;
  kShotai = kGothic;
  
  CalcOptions(parts1, &mitsuL, &flg_boxL, &yokoL, &tateL);
  CalcOptions(parts3, &mitsuR, &flg_boxR, &yokoR, &tateR);
  
  if(flg_boxL & FLAG_REPLACE_2FF1_TO_2FF5){
    combineHame2((KGString *)parts1, (KGString *)parts3, (int *)result,
                 FLAG_SURROUND_LEFT |
                 FLAG_SURROUND_RIGHT |
                 FLAG_SURROUND_TOP);
    kShotai = tempShotai;
    return;
  }
  
  //calculate ratio
  rL = tateL;
  rR = tateR;
  
  if(flg_boxL & FLAG_FLAT_TOP) rL = rL * 0.7;
  if(flg_boxL & FLAG_FLAT_BOTTOM) rL = rL * 0.7;
  if(flg_boxR & FLAG_FLAT_TOP) rR = rR * 0.7;
  if(flg_boxR & FLAG_FLAT_BOTTOM) rR = rR * 0.7;
  
  rL = pow(rL, 0.8);
  rR = pow(rR, 0.8);
  
  rR = rR * 1.1;
  
  rTemp = rL + rR;
  rL = rL / rTemp;
  rR = rR / rTemp;
  
  pryL = rL;
  pryR = rR;
  
  //calucurate size of X-axis
  PartsWidth(parts1, &lxL, &rxL);
  PartsWidth(parts3, &lxR, &rxR);
  PartsHeight(parts1, &lyL, &ryL);
  PartsHeight(parts3, &lyR, &ryR);
  
  //left parts
  if(flg_boxL & FLAG_FLAT_LEFT && flg_boxL & FLAG_FLAT_RIGHT){
    prL = min(1.0, (double)yokoL * 0.1 + 0.5) - ((kWidth * 6) / (kSize * 0.9));
    DoDrawParts(parts1, pxL, prL, pyL, pryL);
    DotsWidth(&dlxL, &drxL);
    pxL = (kSize / 2 - (dlxL + drxL) / 2);
  } else if(flg_boxL & FLAG_FLAT_LEFT){
    prL = (kSize * 0.9 - kWidth * 4) / (rxL - lxL);
    pxL = kWidth * 4;
  } else if(flg_boxL & FLAG_FLAT_RIGHT){
    prL = (kSize * 0.9 - kWidth * 4) / (rxL - lxL);
    pxL = (kSize * 0.05 + kWidth * 2) - lxL * prL;
  }
  
  //right parts
  if(flg_boxR & FLAG_FLAT_LEFT && flg_boxR & FLAG_FLAT_RIGHT){
    prR = min(1.0, (double)yokoR * 0.1 + 0.5) - ((kWidth * 6) / (kSize * 0.9));
    DoDrawParts(parts3, pxR, prR, pyR, pryR);
    DotsWidth(&dlxR, &drxR);
    pxR = (kSize / 2 - (dlxR + drxR) / 2);
  } else if(flg_boxR & FLAG_FLAT_LEFT){
    prR = (kSize * 0.9 - kWidth * 4) / (rxR - lxR);
    pxR = (kSize * 0.05 + kWidth * 3) - lxR * prR;
  } else if(flg_boxR & FLAG_FLAT_RIGHT){
    prR = (kSize * 0.9 - kWidth * 4) / (rxR - lxR);
    pxR = (kSize * 0.05 + kWidth * 1) - lxR * prR;
  }
  
  g = 0;
  
  //calculate width of each parts
  pyL = kWidth * 1.5 + (kSize - kWidth * 1.5 * 4) * pryL * 0.5 - (lyL + ryL) / 2 * pryL;
  pyR = kWidth * 1.5 + (kSize - kWidth * 1.5 * 4) * pryL + kWidth * 1.5 * 2 + (kSize - kWidth * 1.5 * 4) * pryR * 0.5 - (lyR + ryR) / 2 * pryR;
  
  DoDrawMixFont(parts1, pxL, prL, parts3, pxR, prR, pyL, pryL, pyR, pryR);
  
  //count dots for check crossing over
  DotsWidth(&chk_x1, &chk_x2);
  k = 0;
  for(i = 0; i < pngWidth * 1.1; i++){
    for(j = chk_x1; j <= chk_x2; j++){
      if(kageCanvas[i][j] != kWhite) k++;
    }
  }
  l = k;
  
  //get close both parts
  h = pyR;
  while(k - l < kMixdot && g < kWidth * (kKasane + 4)){
    g = g + 2;
    f = pyR - g;
    DoDrawMixFont(parts1, pxL, prL, parts3, pxR, prR, pyL, pryL, f, pryR);
    
    l = 0;
    for(i = 0; i < pngWidth * 1.1; i++){
      for(j = chk_x1; j <= chk_x2; j++){
        if(kageCanvas[i][j] != kWhite) l++;
      }
    }
  }
  pyR = f;
/*
  if(k - l > pngWidth * 0.4){
    pyR = pyR + kWidth * 4;
  } else {
    pyR = pyR + kWidth * 2;
  }
*/
  if(flg_boxL & FLAG_FLAT_BOTTOM && flg_boxR & FLAG_FLAT_TOP){
    pyR = pyR + kWidth * 4;
  } else if(k - l > pngWidth * 0.4){
    pyR = pyR + kWidth * 2;
  } else {
    pyR = pyR + kWidth;
  }
  
  //set results
  result[0] = pxL;
  result[1] = pyL;
  result[2] = pxL + pngWidth * prL;
  result[3] = pyL + pngWidth * pryL;
  result[8] = pxR;
  result[9] = pyR;
  result[10] = pxR + pngWidth * prR;
  result[11] = pyR + pngWidth * pryR;
  
  kShotai = tempShotai;
}

void combineTate3(const KGString *parts1, const KGString *parts2, const KGString *parts3, int *result){
  //temp.
  KGString *tempString;
  int tempResult[8], tempResult2[4];
  int minx, miny, maxx, maxy, width, height, width2, height2;
  
  tempString = kg_string_new("");
  combineTate2(parts2, parts3, result);
  addStrokeWithTransform(parts2, 1, result, tempString, 1);
  addStrokeWithTransform(parts3, 3, result, tempString, 1);
  tempResult[0] = result[0];
  tempResult[1] = result[1];
  tempResult[2] = result[2];
  tempResult[3] = result[3];
  tempResult[4] = result[8];
  tempResult[5] = result[9];
  tempResult[6] = result[10];
  tempResult[7] = result[11];
  minx = min(result[0], result[8]);
  miny = min(result[1], result[9]);
  maxx = max(result[2], result[10]);
  maxy = max(result[3], result[11]);
  width = maxx - minx;
  height = maxy - miny;
  
  combineTate2(parts1, tempString, result);
  tempResult2[0] = result[8];
  tempResult2[1] = result[9];
  tempResult2[2] = result[10];
  tempResult2[3] = result[11];
  width2 = result[10] - result[8];
  height2 = result[11] - result[9];
  
  result[4] = tempResult2[0] + (tempResult[0] - minx) * ((double)width2 / width); // always 0
  result[5] = tempResult2[1] + (tempResult[1] - miny) * ((double)height2 / height);
  result[6] = tempResult2[0] + (tempResult[2] - minx) * ((double)width2 / width);
  result[7] = tempResult2[1] + (tempResult[3] - miny) * ((double)height2 / height);
  result[8] = tempResult2[0] + (tempResult[4] - minx) * ((double)width2 / width);
  result[9] = tempResult2[1] + (tempResult[5] - miny) * ((double)height2 / height);
  result[10] = tempResult2[0] + (tempResult[6] - minx) * ((double)width2 / width);
  result[11] = tempResult2[1] + (tempResult[7] - miny) * ((double)height2 / height);
}

void adjust(int *x, int *y, int x1, int y1, int x2, int y2, double ratio){
  if(*x <= x1){
    *x = 0 + *x * ratio;
  } else if(x2 <= *x){
    *x = pngWidth - (pngWidth - *x) * ratio;
  }
  if(*y <= y1){
    *y = 0 + *y * ratio;
  } else if(y2 <= *y){
    *y = pngHeight - (pngHeight - *y) * ratio;
  }
}

void combineHame2(KGString *parts1, KGString *parts3, int *result, int surround){
  int i, flag;
  int *buf, strokes;
  double yoko, tate;
  int mitsu, flg_box;
  int x1, x2, y1, y2;
  double ratio;
  KGString *temp;
  
  CalcOptions(parts3, &mitsu, &flg_box, &yoko, &tate);
  
  if(yoko * tate > 12){
    ratio = sqrt(12 / (yoko * tate));
    temp = kg_string_new("");
    buf = convertStroke(parts1->str, buf, &strokes);
    for(i = 0; i < strokes; i++){
      if(buf[i * 11] == 9){
        x1 = buf[i * 11 + 3];
        y1 = buf[i * 11 + 4];
        x2 = buf[i * 11 + 5];
        y2 = buf[i * 11 + 6];
        i = strokes;
      }
    }
    for(i = 0; i <strokes; i++){
      switch(buf[i * 11]){
      case 6:
      case 7:
        adjust(&buf[i * 11 + 9], &buf[i * 11 + 10], x1,y1,x2,y2, ratio);
      case 2:
      case 12:
      case 3:
        adjust(&buf[i * 11 + 7], &buf[i * 11 + 8], x1,y1,x2,y2, ratio);
      case 1:
      case 9:
      case 8:
      case 99:
        adjust(&buf[i * 11 + 5], &buf[i * 11 + 6], x1,y1,x2,y2, ratio);
        adjust(&buf[i * 11 + 3], &buf[i * 11 + 4], x1,y1,x2,y2, ratio);
      }
    }
    convertArray(buf, temp, strokes, 0);
    kg_string_assign(parts1, temp->str);
  }
  
  flag = 0;
  
  //set results
  result[0] = 0;
  result[1] = 0;
  result[2] = 200;
  result[3] = 200;
  buf = convertStroke(parts1->str, buf, &strokes);
  for(i = 0; i < strokes; i++){
    if(buf[i * 11 + 0] == 9){
      result[8] = buf[i * 11 + 3];
      if(flg_box & FLAG_FLAT_LEFT){
        if(surround & FLAG_SURROUND_LEFT){
          result[8] += kWidth * 4;
        } else {
          result[8] += kWidth * 2;
        }
      }
      result[9] = buf[i * 11 + 4];
      if(flg_box & FLAG_FLAT_TOP){
        if(surround & FLAG_SURROUND_TOP){
          result[9] += kWidth * 4;
        } else {
          result[9] += kWidth * 2;
        }
      }
      result[10] = buf[i * 11 + 5];
      if(flg_box & FLAG_FLAT_RIGHT){
        if(surround & FLAG_SURROUND_RIGHT){
          result[10] -= kWidth * 4;
        } else {
          result[10] -= kWidth * 2;
        }
      }
      result[11] = buf[i * 11 + 6];
      if(flg_box & FLAG_FLAT_BOTTOM){
        if(surround & FLAG_SURROUND_BOTTOM){
          result[11] -= kWidth * 4;
        } else {
          result[11] -= kWidth * 2;
        }
      }
      flag = 1;
    }
  }
  if(flag == 0){ //error
    result[8] = 50;
    result[9] = 50;
    result[10] = 150;
    result[11] = 150;
  }
}
