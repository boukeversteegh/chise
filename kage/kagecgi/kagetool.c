//kagetool.c
//

#include "kage.h"
#include "kagecgi.h"
#include "sysdep.h"

void DotsWidth(int *dlx, int *drx){
  int i, j;
  
  *dlx = 0;
  *drx = 0;
  for(i = 0; i < canvasWidth && *dlx == 0; i++){
    for(j = 0; j < canvasHeight; j++){
      if(kageCanvas[j][i] != kWhite){
        *dlx = i;
        break;
      }
    }
  }
  
  for(i = canvasWidth - 1; i >= 0 && *drx == 0; i--){
    for(j = 0; j < canvasHeight; j++){
      if(kageCanvas[j][i] != kWhite){
        *drx = i;
        break;
      }
    }
  }
}

void DotsHeight(int *dly, int *dry){
  int i, j;
  
  *dly = 0;
  *dry = 0;
  for(j = 0; j < canvasHeight && *dly == 0; j++){
    for(i = 0; i < canvasWidth; i++){
      if(kageCanvas[j][i] != kWhite){
        *dly = j;
        break;
      }
    }
  }
  
  for(j = canvasHeight - 1; j >= 0 && *dry == 0; j--){
    for(i = 0; i < canvasWidth; i++){
      if(kageCanvas[j][i] != kWhite){
        *dry = j;
        break;
      }
    }
  }
}

void PartsWidth(const KGString *in, int *lx, int *rx){
  int tempShotai;
  DrawBox();
  tempShotai = kShotai;
  kShotai = kGothic;
  drawGlyph(in, DRAW_GLYPH_MODE_WITHOUT_DECORATION);
  kShotai = tempShotai;
  DotsWidth(lx, rx);
  /*
    int i;
	int *buf, strokes;
	double t, x;
	
	*lx = 1000; *rx = 0;
	buf = convertStroke(in->str, buf, &strokes);
	
    for(i = 0; i < strokes; i++){
		switch(buf[i * 11 + 0] % 10){
		
		case 0:
		case 9:
			break;
		case 1:
	        if(*lx > buf[i * 11 + 3]) *lx = buf[i * 11 + 3];
			if(*rx < buf[i * 11 + 3]) *rx = buf[i * 11 + 3];
	        if(*lx > buf[i * 11 + 5]) *lx = buf[i * 11 + 5];
	        if(*rx < buf[i * 11 + 5]) *rx = buf[i * 11 + 5];
			break;
		case 2:
			for(t = 0; t <= 1; t = t + 0.05){
				x = (1.0 - t) * (1.0 - t) * buf[i * 11 + 3] + 2.0 * t * (1.0 - t) * buf[i * 11 + 5] + t * t * buf[i * 11 + 7];
		        if(*lx > x) *lx = x;
        	    if(*rx < x) *rx = x;
			}
			break;
		case 3:
	        if(*lx > buf[i * 11 + 3]) *lx = buf[i * 11 + 3];
			if(*rx < buf[i * 11 + 3]) *rx = buf[i * 11 + 3];
	        if(*lx > buf[i * 11 + 5]) *lx = buf[i * 11 + 5];
	        if(*rx < buf[i * 11 + 5]) *rx = buf[i * 11 + 5];
	        if(*lx > buf[i * 11 + 7]) *lx = buf[i * 11 + 7];
            if(*rx < buf[i * 11 + 7]) *rx = buf[i * 11 + 7];
			break;
		case 6:
			for(t = 0; t < 1; t = t + 0.05){
				x = (1.0 - t) * (1.0 - t) * (1.0 - t) * buf[i * 11 + 3] + 3.0 * t * (1.0 - t) * (1.0 - t) * buf[i * 11 + 5] + 3 * t * t * (1.0 - t) * buf[i * 11 + 7] + t * t * t * buf[i * 11 + 9];
		        if(*lx > x) *lx = x;
        	    if(*rx < x) *rx = x;
			}
			break;
		case 7:
	        if(*lx > buf[i * 11 + 3]) *lx = buf[i * 11 + 3];
			if(*rx < buf[i * 11 + 3]) *rx = buf[i * 11 + 3];
			for(t = 0; t < 1; t = t + 0.05){
				x = (1.0 - t) * (1.0 - t) * buf[i * 11 + 5] + 2.0 * t * (1.0 - t) * buf[i * 11 + 7] + t * t * buf[i * 11 + 9];
		        if(*lx > x) *lx = x;
        	    if(*rx < x) *rx = x;
			}
		}
	}
	free(buf);
	*/
}

void PartsHeight(const KGString *in, int *ly, int *ry){
  int tempShotai;
  DrawBox();
  tempShotai = kShotai;
  kShotai = kGothic;
  drawGlyph(in, DRAW_GLYPH_MODE_WITHOUT_DECORATION);
  kShotai = tempShotai;
  DotsHeight(ly, ry);
	/*
    int i;
	int *buf, strokes;
	double t, y;
	
	*ly = 1000; *ry = 0;
	buf = convertStroke(in->str, buf, &strokes);
	
    for(i = 0; i < strokes; i++){
		switch(buf[i * 11 + 0] % 10){
		
		case 0:
		case 9:
			break;
		case 1:
	        if(*ly > buf[i * 11 + 4]) *ly = buf[i * 11 + 4];
			if(*ry < buf[i * 11 + 4]) *ry = buf[i * 11 + 4];
	        if(*ly > buf[i * 11 + 6]) *ly = buf[i * 11 + 6];
	        if(*ry < buf[i * 11 + 6]) *ry = buf[i * 11 + 6];
			break;
		case 2:
			for(t = 0; t <= 1; t = t + 0.05){
				y = (1.0 - t) * (1.0 - t) * buf[i * 11 + 4] + 2.0 * t * (1.0 - t) * buf[i * 11 + 6] + t * t * buf[i * 11 + 8];
		        if(*ly > y) *ly = y;
        	    if(*ry < y) *ry = y;
			}
			break;
		case 3:
	        if(*ly > buf[i * 11 + 4]) *ly = buf[i * 11 + 4];
			if(*ry < buf[i * 11 + 4]) *ry = buf[i * 11 + 4];
	        if(*ly > buf[i * 11 + 6]) *ly = buf[i * 11 + 6];
	        if(*ry < buf[i * 11 + 6]) *ry = buf[i * 11 + 6];
	        if(*ly > buf[i * 11 + 8]) *ly = buf[i * 11 + 8];
            if(*ry < buf[i * 11 + 8]) *ry = buf[i * 11 + 8];
			break;
		case 6:
			for(t = 0; t < 1; t = t + 0.05){
				y = (1.0 - t) * (1.0 - t) * (1.0 - t) * buf[i * 11 + 4] + 3.0 * t * (1.0 - t) * (1.0 - t) * buf[i * 11 + 6] + 3 * t * t * (1.0 - t) * buf[i * 11 + 8] + t * t * t * buf[i * 11 + 10];
		        if(*ly > y) *ly = y;
        	    if(*ry < y) *ry = y;
			}
			break;
		case 7:
	        if(*ly > buf[i * 11 + 4]) *ly = buf[i * 11 + 4];
			if(*ry < buf[i * 11 + 4]) *ry = buf[i * 11 + 4];
			for(t = 0; t < 1; t = t + 0.05){
				y = (1.0 - t) * (1.0 - t) * buf[i * 11 + 6] + 2.0 * t * (1.0 - t) * buf[i * 11 + 8] + t * t * buf[i * 11 + 10];
		        if(*ly > y) *ly = y;
        	    if(*ry < y) *ry = y;
			}
		}
	}
	free(buf);
	*/
	/*
    int i;
	int *buf, strokes;
	
	buf = convertStroke(in->str, buf, &strokes);
	*ly = 1000; *ry = 0;
	
    for(i = 0; i < strokes; i++){
        if(buf[i * 11 + 0] % 10 == 0) continue;
		
        if(*ly > buf[i * 11 + 4]) *ly = buf[i * 11 + 4];
		if(*ry < buf[i * 11 + 4]) *ry = buf[i * 11 + 4];
        if(*ly > buf[i * 11 + 6]) *ly = buf[i * 11 + 6];
        if(*ry < buf[i * 11 + 6]) *ry = buf[i * 11 + 6];
		
        if(buf[i * 11 + 0] % 10 == 2 || buf[i * 11 + 0] % 10 == 3 || buf[i * 11 + 0] % 10 == 8){
	        if(*ly > buf[i * 11 + 8]) *ly = buf[i * 11 + 8];
            if(*ry < buf[i * 11 + 8]) *ry = buf[i * 11 + 8];
		}
        if(buf[i * 11 + 0] % 10 == 4 || buf[i * 11 + 0] % 10 == 6 || buf[i * 11 + 0] % 10 == 7){
	        if(*ly > buf[i * 11 + 10]) *ly = buf[i * 11 + 10];
	        if(*ry < buf[i * 11 + 10]) *ry = buf[i * 11 + 10];
        }
	}
	free(buf);
	*/
}

KGString * CalcSizes(const KGString *in, int mode){
  int i, j, k, basewidth, one_lineX, one_lineY;
  int dlx1, drx1, dly1, dry1;
  int px1, py1;
  double pr1, pry1;
  
  int mitsuT, flg_boxT, widthT, heightT;
  double tateT, yokoT;
  int cutx, cuty;
  
  int *buf, strokes;
  int tf[12];
  KGString *out;
  
  out = kg_string_new("");
  basewidth = pngWidth * 0.9;
  
  if(mode == 0){
    //temporary adjustment X-axis
    PartsWidth(in, &dlx1, &drx1);
    if(dlx1 == drx1){
      pr1 = 1.0;
      px1 = pngWidth / 2 - dlx1;
      one_lineX = 1;
    }
    else{
      pr1 = (double)basewidth/(drx1 - dlx1);
      px1 = (pngWidth-basewidth)/2 - (double)(dlx1 * pr1);
      one_lineX = 0;
    }
    
    //temporary adjustment Y-axis
    PartsHeight(in, &dly1, &dry1);
    if(dly1 == dry1){
      pry1 = 1.0;
      py1 = pngWidth / 2 - dly1;
      one_lineY = 1;
    }
    else{
      pry1 = (double)basewidth/(dry1 - dly1);
      py1 = (pngWidth-basewidth)/2 - (double)(dly1 * pry1);
      one_lineY = 0;
    }
  }
  else{
    PartsWidth(in, &dlx1, &drx1);
    PartsHeight(in, &dly1, &dry1);
    
    cutx = 0;
    cuty = 0;
    
    CalcOptions(in, &mitsuT, &flg_boxT, &yokoT, &tateT);
    
    widthT = basewidth;
    heightT = basewidth;
    
    if(flg_boxT % 2 / 1 != 0){
      widthT = widthT - kWidth * 3;
      cutx++;
    }
    if(flg_boxT % 4 / 2 != 0){
      widthT = widthT - kWidth * 3;
      cutx++;
    }
    if(flg_boxT % 8 / 4 != 0){
      heightT = heightT - kWidth * 3;
      cuty++;
    }
    if(flg_boxT % 16 / 8 != 0){
      heightT = heightT - kWidth * 3;
      cuty++;
    }
    
    //especially get small the 'mouth'
    if(mode == 2 && flg_boxT % 16 == 15){
      widthT = widthT - kWidth * (max(0, 16 - (int)yokoT * 4));
      heightT = heightT - kWidth * (max(0, 16 - (int)tateT * 4));
    }
    //'dot' as same as 'mouth'
    if(mode == 2 && tateT == 1 && yokoT == 1){
      widthT = pngWidth * 0.9 * 0.5;
      heightT = pngWidth * 0.9 * 0.5;
    }
    
    /*
if(flg_boxT % 64 / 32 != 0){
            buf = convertStroke(in->str, buf, &strokes);
            for(i = 0; i < strokes; i++){
              if(buf[i * 11 + 0] == 0) j = buf[i * 11 + 4];// j : center line
            }
            free(buf);
            k = max(j - dlx1, drx1 - j);// k : distance from center line
            pr1 = (basewidth * 0.5) / k;
            
            if(k == j - dlx1) px1 = 0;
            else px1 = pngWidth * 0.5 - j * pr1;
          }
        else
*/
          if(dlx1 == drx1){
            pr1 = 1.0;
            px1 = pngWidth / 2 - dlx1;
          }
          else{
            pr1 = (double)widthT/(drx1 - dlx1);
            px1 = pngWidth / 2 - (double)((dlx1 + drx1) / 2 * pr1);
            if(flg_boxT % 2 / 1 != 0 && flg_boxT % 4 / 2 == 0) px1 = px1 + kWidth * 1.5;
            if(flg_boxT % 2 / 1 == 0 && flg_boxT % 4 / 2 != 0) px1 = px1 - kWidth * 1.5;
          }
		
        if(dly1 == dry1){
            pry1 = 1.0;
            py1 = pngWidth / 2 - dly1;
        }
        else{
            pry1 = (double)heightT/(dry1 - dly1);
            py1 = pngWidth / 2 - (double)((dly1 + dry1) / 2 * pry1);
            if(flg_boxT % 8 / 4 != 0 && flg_boxT % 16 / 8 == 0) py1 = py1 + kWidth * 1.5;
            if(flg_boxT % 8 / 4 == 0 && flg_boxT % 16 / 8 != 0) py1 = py1 - kWidth * 1.5;
        }
	}
	
	//generate result
	tf[0] = px1;
	tf[1] = py1;
	tf[2] = px1 + pr1 * 200;
	tf[3] = py1 + pry1 * 200;
	addStrokeWithTransform(in, 1, tf, out, 0);
	return kg_string_new(out->str);
}

void DrawBox(){
  int i, j;
  
  for(i = 0; i < canvasWidth; i++){
    for(j = 0; j < canvasHeight; j++){
      kageCanvas[j][i] = kWhite;
    }
  }
}

void CalcOptions(const KGString *in, int *mitsudo, int *flag, double *yoko, double *tate){
    int i, j, k, l, flg;
  int dlx1, drx1, dly1, dry1;
  int kari, mode;
  int tempShotai;
  int *buf, strokes;
  int value;
  
  *flag = 0;
  
  buf = convertStroke(in->str, buf, &strokes);
  
  //check left side (NEW)
  value = 200;
  for(i = 0; i < strokes; i++){
    switch(buf[i * 11]){
    case 6:
    case 7:
      if(buf[i * 11 + 9] < value){ value = buf[i * 11 + 9]; }
    case 2:
    case 12:
    case 3:
      if(buf[i * 11 + 7] < value){ value = buf[i * 11 + 7]; }
    case 1:
      if(buf[i * 11 + 5] < value){ value = buf[i * 11 + 5]; }
      if(buf[i * 11 + 3] < value){ value = buf[i * 11 + 3]; }
    }
  }
  for(i = 0; i < strokes; i++){
    if((buf[i * 11] == 1 || buf[i * 11] == 3) && // stroke #1 and #3
       buf[i * 11 + 3] == value &&
       buf[i * 11 + 5] == value &&
       (buf[i * 11 + 6] - buf[i * 11 + 4]) > pngWidth * 0.9 / 4){
      *flag = *flag | FLAG_FLAT_LEFT;
    }
  }

  //check right side (NEW)
  value = 0;
  for(i = 0; i < strokes; i++){
    switch(buf[i * 11]){
    case 6:
    case 7:
      if(buf[i * 11 + 9] > value){ value = buf[i * 11 + 9]; }
    case 2:
    case 12:
    case 3:
      if(buf[i * 11 + 7] > value){ value = buf[i * 11 + 7]; }
    case 1:
      if(buf[i * 11 + 5] > value){ value = buf[i * 11 + 5]; }
      if(buf[i * 11 + 3] > value){ value = buf[i * 11 + 3]; }
    }
  }
  for(i = 0; i < strokes; i++){
    if(buf[i * 11] == 1 &&
       buf[i * 11 + 3] == value &&
       buf[i * 11 + 5] == value &&
       (buf[i * 11 + 6] - buf[i * 11 + 4]) > pngWidth * 0.9 / 4){
      *flag = *flag | FLAG_FLAT_RIGHT;
    }
  }
  
  //check upper side (NEW)
  value = 200;
  for(i = 0; i < strokes; i++){
    switch(buf[i * 11]){
    case 6:
    case 7:
      if(buf[i * 11 + 10] < value){ value = buf[i * 11 + 10]; }
    case 2:
    case 12:
    case 3:
      if(buf[i * 11 + 8] < value){ value = buf[i * 11 + 8]; }
    case 1:
      if(buf[i * 11 + 6] < value){ value = buf[i * 11 + 6]; }
      if(buf[i * 11 + 4] < value){ value = buf[i * 11 + 4]; }
    }
  }
  for(i = 0; i < strokes; i++){
    if(buf[i * 11] == 1 &&
       buf[i * 11 + 4] == value &&
       buf[i * 11 + 6] == value &&
       (buf[i * 11 + 5] - buf[i * 11 + 3]) > pngWidth * 0.9 / 4){
      *flag = *flag | FLAG_FLAT_TOP;
    }
  }

  //check bottom side (NEW)
  value = 0;
  for(i = 0; i < strokes; i++){
    switch(buf[i * 11]){
    case 6:
    case 7:
      if(buf[i * 11 + 10] > value){ value = buf[i * 11 + 10]; }
    case 2:
    case 12:
    case 3:
      if(buf[i * 11 + 8] > value){ value = buf[i * 11 + 8]; }
    case 1:
      if(buf[i * 11 + 6] > value){ value = buf[i * 11 + 6]; }
      if(buf[i * 11 + 4] > value){ value = buf[i * 11 + 4]; }
    }
  }
  for(i = 0; i < strokes; i++){
    if(buf[i * 11] == 1 &&
       buf[i * 11 + 4] == value &&
       buf[i * 11 + 6] == value &&
       (buf[i * 11 + 5] - buf[i * 11 + 3]) > pngWidth * 0.9 / 4){
      *flag = *flag | FLAG_FLAT_BOTTOM;
    }
  }

  DrawBox();
  tempShotai = kShotai;
  kShotai = kGothic;
  drawGlyph(in, DRAW_GLYPH_MODE_WITHOUT_DECORATION);
  kShotai = tempShotai;
  DotsWidth(&dlx1, &drx1);
  DotsHeight(&dly1, &dry1);
  
  //count black dots
  *mitsudo = 0;
  for(i = 0; i < pngHeight; i++){
    for(j = 0; j < pngWidth; j++){
      if(kageCanvas[i][j] != kWhite) *mitsudo += 1;
    }
  }
  
  //calculate X-axis complexity
  *yoko = 0;
  for(i = dly1; i <= dry1; i++){
    mode = 0;
    kari = 0;
    for(j = dlx1; j <= drx1; j++){
      if(kageCanvas[i][j] != kWhite &&
         kageCanvas[i][j+1] != kWhite &&
         kageCanvas[i][j+2] != kWhite){
        if(mode == 0){
          mode = 1;
          kari++;
        }
      }
      else if(mode == 1) mode = 0;
    }
    if(kari > *yoko) *yoko = kari;
  }
  
  //calculate Y-axis complexity
  *tate = 0;
  for(i = dlx1; i <= drx1; i++){
    mode = 0;
    kari = 0;
    for(j = dly1; j <= dry1; j++){
      if(kageCanvas[j][i] != kWhite &&
         kageCanvas[j+1][i] != kWhite &&
         kageCanvas[j+2][i] != kWhite){
        if(mode == 0){
          mode = 1;
          kari++;
        }
      }
      else if(mode == 1) mode = 0;
    }
    if(kari > *tate) *tate = kari;
  }
  
  //use user defined option if it exists
  //buf = convertStroke(in->str, buf, &strokes);
  for(i = 0; i < strokes; i++){
    if(buf[i * 11 + 0] % 10 == 0){
      if(buf[i * 11 + 1] != 0) *yoko = (double)(buf[i * 11 + 1]) * 0.1;
      if(buf[i * 11 + 2] != 0) *tate = (double)(buf[i * 11 + 2]) * 0.1;
      if(buf[i * 11 + 3] != 0) *flag = *flag + buf[i * 11 + 3];
    }
  }
  free(buf);
}

void DoDrawParts(const KGString *in, const int lx1, const double rf1, const int ly1, const double rfy1){
  int i;
  int *buf, strokes;
  
  DrawBox();
  buf = convertStroke(in->str, buf, &strokes);
  for(i = 0; i < strokes; i++){
    dfDrawFont(buf[i * 11 + 0],
               buf[i * 11 + 1],
               buf[i * 11 + 2],
               buf[i * 11 + 3] * rf1 + lx1,
               buf[i * 11 + 4] * rfy1 + ly1,
               buf[i * 11 + 5] * rf1 + lx1,
               buf[i * 11 + 6] * rfy1 + ly1,
               buf[i * 11 + 7] * rf1 + lx1,
               buf[i * 11 + 8] * rfy1 + ly1,
               buf[i * 11 + 9] * rf1 + lx1,
               buf[i * 11 + 10] * rfy1 + ly1);
  }
  free(buf);
}

void DoDrawMixFont(const KGString *in1,
                   const int lx1,
                   const double rf1,
                   const KGString *in2,
                   const int lx2,
                   const double rf2,
                   const int ly1,
                   const double rfy1,
                   const int ly2,
                   const double rfy2){
  int i;
  int *buf, strokes;
  
  DrawBox();
  buf = convertStroke(in1->str, buf, &strokes);
  for(i = 0; i < strokes; i++){
    dfDrawFont(buf[i * 11 + 0],
               buf[i * 11 + 1],
               buf[i * 11 + 2],
               buf[i * 11 + 3] * rf1 + lx1,
               buf[i * 11 + 4] * rfy1 + ly1,
               buf[i * 11 + 5] * rf1 + lx1,
               buf[i * 11 + 6] * rfy1 + ly1,
               buf[i * 11 + 7] * rf1 + lx1,
               buf[i * 11 + 8] * rfy1 + ly1,
               buf[i * 11 + 9] * rf1 + lx1,
               buf[i * 11 + 10] * rfy1 + ly1);
  }
  free(buf);
  
  buf = convertStroke(in2->str, buf, &strokes);
  for(i = 0; i < strokes; i++){
    dfDrawFont(buf[i * 11 + 0],
               buf[i * 11 + 1],
               buf[i * 11 + 2],
               buf[i * 11 + 3] * rf2 + lx2,
               buf[i * 11 + 4] * rfy2 + ly2,
               buf[i * 11 + 5] * rf2 + lx2,
               buf[i * 11 + 6] * rfy2 + ly2,
               buf[i * 11 + 7] * rf2 + lx2,
               buf[i * 11 + 8] * rfy2 + ly2,
               buf[i * 11 + 9] * rf2 + lx2,
               buf[i * 11 + 10] * rfy2 + ly2);
  }
  free(buf);
}

