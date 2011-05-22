//kagedf.c
//
#include "kage.h"
#include "kagecgi.h"

void dfDrawFont(int a1, int a2, int a3,
                int x1, int y1,
                int x2, int y2,
                int x3, int y3,
                int x4, int y4){
  int tx1, tx2, tx3, tx4, ty1, ty2, ty3, ty4, v;
  double rad;
  
  if(kShotai == kMincho){
    switch(a1 % 100){
    case 0:
      break;
    case 1:
      if(a3 == 4){
        if(x1 == x2){
          if(y1 < y2){ v = 1; } else{ v = -1; }
          tx1 = x2;
          ty1 = y2 - kMage * v;
        }
        else if(y1 == y2){
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * v;
          ty1 = y2;
        }
        else{
          rad = atan((double)(y2 - y1) / (double)(x2 - x1));
          if(x1 < x2){ v = 1; } else{v = -1; }
          tx1 = x2 - kMage * cos(rad) * v;
          ty1 = y2 - kMage * sin(rad) * v;
        }
        cdDrawLine(x1, y1, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x2, y2, x2 - kMage, y2, 1, 14);
      }
      else{
        cdDrawLine(x1, y1, x2, y2, a2, a3);
      }
      break;
    case 2:
    case 12:
      if(a3 == 4){
        if(x2 == x3){
          tx1 = x3;
          ty1 = y3 - kMage;
        }
        else if(y2 == y3){
          tx1 = x3 - kMage;
          ty1 = y3;
        }
        else{
          rad = atan((double)(y3 - y2) / (double)(x3 - x2));
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx1 = x3 - kMage * cos(rad) * v;
          ty1 = y3 - kMage * sin(rad) * v;
        }
        cdDrawCurve(x1, y1, x2, y2, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x3, y3, x3 - kMage, y3, 1, 14);
      }
      else if(a3 == 5){
        cdDrawCurve(x1, y1, x2, y2, x3, y3, a2, 15);
      }
      else{
        cdDrawCurve(x1, y1, x2, y2, x3, y3, a2, a3);
      }
      break;
    case 3:
      if(a3 == 5){
        if(x1 == x2){
          if(y1 < y2){ v = 1; } else{ v = -1; }
          tx1 = x2;
          ty1 = y2 - kMage * v;
        }
        else if(y1 == y2){
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * v;
          ty1 = y2;
        }
        else{
          rad = atan((double)(y2 - y1) / (double)(x2 - x1));
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * cos(rad) * v;
          ty1 = y2 - kMage * sin(rad) * v;
        }
        if(x2 == x3){
          if(y2 < y3){ v = 1; } else{ v = -1; }
          tx2 = x2;
          ty2 = y2 + kMage * v;
        }
        else if(y2 == y3){
          if(x2 < x3){ v = 1; } else { v = -1; }
          tx2 = x2 + kMage * v;
          ty2 = y2;
        }
        else{
          rad = atan((double)(y3 - y2) / (double)(x3 - x2));
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx2 = x2 + kMage * cos(rad) * v;
          ty2 = y2 + kMage * sin(rad) * v;
        }
        tx3 = x3 - kMage;
        ty3 = y3;
        tx4 = x3 + kMage * 0.5;
        ty4 = y3 - kMage * 2;
        
        cdDrawLine(x1, y1, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x2, y2, tx2, ty2, 1, 1);
        cdDrawLine(tx2, ty2, tx3, ty3, 6, 5); // bolder by force
      }
      else{
        if(x1 == x2){
          if(y1 < y2){ v = 1; } else { v = -1; }
          tx1 = x2;
          ty1 = y2 - kMage * v;
        }
        else if(y1 == y2){
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * v;
          ty1 = y2;
        }
        else{
          rad = atan((double)(y2 - y1) / (double)(x2 - x1));
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * cos(rad) * v;
          ty1 = y2 - kMage * sin(rad) * v;
        }
        if(x2 == x3){
          if(y2 < y3){ v = 1; } else{ v = -1; }
          tx2 = x2;
          ty2 = y2 + kMage * v;
        }
        else if(y2 == y3){
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx2 = x2 + kMage * v;
          ty2 = y2;
        }
        else{
          rad = atan((double)(y3 - y2) / (double)(x3 - x2));
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx2 = x2 + kMage * cos(rad) * v;
          ty2 = y2 + kMage * sin(rad) * v;
        }
        cdDrawLine(x1, y1, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x2, y2, tx2, ty2, 1, 1);
        cdDrawLine(tx2, ty2, x3, y3, 6, a3); // bolder by force
      }
      break;
    case 6:
      if(a3 == 5){
        /* only implimented for gothic
				tx1 = x4 - kMage;
				ty1 = y4;
				tx2 = x4 + kMage * 0.5;
				ty2 = y4 - kMage * 2;
         */
        cdDrawBezier(x1, y1, x2, y2, x3, y3, x4, y4, a2, 15);
      }
      else{
        cdDrawBezier(x1, y1, x2, y2, x3, y3, x4, y4, a2, a3);
      }
      break;
    case 7:
      cdDrawLine(x1, y1, x2, y2, a2, 1);
      cdDrawCurve(x2, y2, x3, y3, x4, y4, 1, 7);
      break;
    case 8:
      icBox(x1, y1, x2, y2);
      break;
    case 9: // may not be exist
      icDot(x1, y1);
      icDot(x2, y2);
      break;
    default:
      break;
    }
  }
  
  else{ // gothic
    switch(a1 % 100){
    case 0:
      break;
    case 1:
      if(a3 == 4){
        if(x1 == x2){
          if(y1 < y2){ v = 1; } else{ v = -1; }
          tx1 = x2;
          ty1 = y2 - kMage * v;
        }
        else if(y1 == y2){
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * v;
          ty1 = y2;
        }
        else{
          rad = atan((double)(y2 - y1) / (double)(x2 - x1));
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * cos(rad) * v;
          ty1 = y2 - kMage * sin(rad) * v;
        }
        cdDrawLine(x1, y1, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x2, y2, x2 - kMage * 2, y2 - kMage * 0.5, 1, 0);
      }
      else{
        cdDrawLine(x1, y1, x2, y2, a2, a3);
      }
      break;
    case 2:
    case 12:
      if(a3 == 4){
        if(x2 == x3){
          tx1 = x3;
          ty1 = y3 - kMage;
        }
        else if(y2 == y3){
          tx1 = x3 - kMage;
          ty1 = y3;
        }
        else{
          rad = atan((double)(y3 - y2) / (double)(x3 - x2));
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx1 = x3 - kMage * cos(rad) * v;
          ty1 = y3 - kMage * sin(rad) * v;
        }
        cdDrawCurve(x1, y1, x2, y2, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x3, y3, x3 - kMage * 2, y3 - kMage * 0.5, 1, 0);
      }
      else if(a3 == 5){
        tx1 = x3 + kMage;
        ty1 = y3;
        tx2 = tx1 + kMage * 0.5;
        ty2 = y3 - kMage * 2;
        cdDrawCurve(x1, y1, x2, y2, x3, y3, a2, 1);
        cdDrawCurve(x3, y3, tx1, ty1, tx2, ty2, 1, 0);
      }
      else{
        cdDrawCurve(x1, y1, x2, y2, x3, y3, a2, a3);
      }
      break;
    case 3:
      if(a3 == 5){
        if(x1 == x2){
          if(y1 < y2){ v = 1; } else{ v = -1; }
          tx1 = x2;
          ty1 = y2 - kMage * v;
        }
        else if(y1 == y2){
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * v;
          ty1 = y2;
        }
        else{
          rad = atan((double)(y2 - y1) / (double)(x2 - x1));
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * cos(rad) * v;
          ty1 = y2 - kMage * sin(rad) * v;
        }
        if(x2 == x3){
          if(y2 < y3){ v = 1; } else{ v = -1; }
          tx2 = x2;
          ty2 = y2 + kMage * v;
        }
        else if(y2 == y3){
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx2 = x2 + kMage * v;
          ty2 = y2;
        }
        else{
          rad = atan((double)(y3 - y2) / (double)(x3 - x2));
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx2 = x2 + kMage * cos(rad) * v;
          ty2 = y2 + kMage * sin(rad) * v;
        }
        tx3 = x3 - kMage;
        ty3 = y3;
        tx4 = x3 + kMage * 0.5;
        ty4 = y3 - kMage * 2;
        
        cdDrawLine(x1, y1, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x2, y2, tx2, ty2, 1, 1);
        cdDrawLine(tx2, ty2, tx3, ty3, 1, 1);
        cdDrawCurve(tx3, ty3, x3, y3, tx4, ty4, 1, 0);
      }
      else{
        if(x1 == x2){
          if(y1 < y2){ v = 1; } else{ v = -1; }
          tx1 = x2;
          ty1 = y2 - kMage * v;
        }
        else if(y1 == y2){
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * v;
          ty1 = y2;
        }
        else{
          rad = atan((double)(y2 - y1) / (double)(x2 - x1));
          if(x1 < x2){ v = 1; } else{ v = -1; }
          tx1 = x2 - kMage * cos(rad) * v;
          ty1 = y2 - kMage * sin(rad) * v;
        }
        if(x2 == x3){
          if(y2 < y3){ v = 1; } else{ v = -1; }
          tx2 = x2;
          ty2 = y2 + kMage * v;
        }
        else if(y2 == y3){
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx2 = x2 + kMage * v;
          ty2 = y2;
        }
        else{
          rad = atan((double)(y3 - y2) / (double)(x3 - x2));
          if(x2 < x3){ v = 1; } else{ v = -1; }
          tx2 = x2 + kMage * cos(rad) * v;
          ty2 = y2 + kMage * sin(rad) * v;
        }
        
        cdDrawLine(x1, y1, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x2, y2, tx2, ty2, 1, 1);
        cdDrawLine(tx2, ty2, x3, y3, 1, a3);
      }
      break;
    case 6:
      if(a3 == 5){
        tx1 = x4 - kMage;
        ty1 = y4;
        tx2 = x4 + kMage * 0.5;
        ty2 = y4 - kMage * 2;
        cdDrawBezier(x1, y1, x2, y2, x3, y3, tx1, ty1, a2, 1);
        cdDrawCurve(tx1, ty1, x4, y4, tx2, ty2, 1, 0);
      }
      else{
        cdDrawBezier(x1, y1, x2, y2, x3, y3, x4, y4, a2, a3);
      }
      break;
    case 7:
      cdDrawLine(x1, y1, x2, y2, a2, 1);
      cdDrawCurve(x2, y2, x3, y3, x4, y4, 1, a3);
      break;
    case 8:
      icBox(x1, y1, x2, y2);
      break;
    case 9: // may not be exist
      icDot(x1, y1);
      icDot(x2, y2);
      break;
    default:
      break;
    }
  }
}
