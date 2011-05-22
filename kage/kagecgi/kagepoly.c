// kagepoly.c
//

#include "kage.h"
#include "kagecgi.h"

void fillPolygon(kPoint *p, int number, int col, unsigned char **image){
  int miny, maxy;
  int cross[16], num;
  int i, j, k, l, m;
  kPoint tpoly[kResolution + 2];
  int tnum;
  double a, b;

  //copy to temp buffer and detect max/min y-point
  tnum = 0;
  tpoly[tnum].X = p[0].X;
  tpoly[tnum].Y = p[0].Y;
  miny = maxy = tpoly[tnum].Y;
  tnum++;
  for(i = 1; i < number; i++){
    if(p[i].X != tpoly[tnum - 1].X || p[i].Y != tpoly[tnum - 1].Y){
      tpoly[tnum].X = p[i].X;
      tpoly[tnum].Y = p[i].Y;
      if(tpoly[tnum].Y < miny) miny = tpoly[tnum].Y;
      if(tpoly[tnum].Y > maxy) maxy = tpoly[tnum].Y;
      tnum++;
    }
  }
  tpoly[tnum].X = tpoly[0].X;
  tpoly[tnum].Y = tpoly[0].Y;
  tpoly[tnum + 1].X = tpoly[1].X;
  tpoly[tnum + 1].Y = tpoly[1].Y;

  //detect crossing point of each y-point and draw
  for(j = miny; j <= maxy; j++){
    num = 0;
    for(i = 0; i < tnum; i++){
      //if be parallel to x-axis
      if(tpoly[i].Y == tpoly[i + 1].Y){
	if(tpoly[i].Y == j){
	  cross[num] = tpoly[i + 1].X;
	  num++;
	}
      }
      //if be parallel to y-axis
      else if(tpoly[i].X == tpoly[i + 1].X){
	if((tpoly[i].Y < j && j <= tpoly[i + 1].Y) ||
	 (tpoly[i + 1].Y <= j && j < tpoly[i].Y)){
	  cross[num] = tpoly[i].X;
	  num++;
	  //spearhead: add one more
	  if(tpoly[i + 1].Y == j &&
	   ((tpoly[i].Y > tpoly[i + 1].Y &&
	   tpoly[i + 1].Y < tpoly[i + 2].Y) ||
	   (tpoly[i].Y < tpoly[i + 1].Y &&
	   tpoly[i + 1].Y > tpoly[i + 2].Y))){
	    cross[num] = tpoly[i + 1].X;
	    num++;
	  }
	}
      }
      //detect crossing point of each vector
      else if((tpoly[i].Y < j && j <= tpoly[i + 1].Y) ||
       (tpoly[i + 1].Y <= j && j < tpoly[i].Y)){
	a = (tpoly[i + 1].Y - tpoly[i].Y) 
	 / (tpoly[i + 1].X - tpoly[i].X);
	b = tpoly[i].Y - a * tpoly[i].X;
	cross[num] = (j - b) / a;
	num++;
	//spearhead: add one more
	if(tpoly[i + 1].Y == j &&
	 ((tpoly[i].Y > tpoly[i + 1].Y &&
	 tpoly[i + 1].Y < tpoly[i + 2].Y) ||
	 (tpoly[i].Y < tpoly[i + 1].Y &&
	 tpoly[i + 1].Y > tpoly[i + 2].Y))){
	  cross[num] = tpoly[i + 1].X;
	  num++;
	}
      }
    }
    if(num != 0){
      //(for debug)
      //if(num % 2 != 0){
	//fprintf(stderr,"y:%d(%d)\n",j,num);
	//for(k=0;k<num;k++) fprintf(stderr,"%d+",cross[k]);
      //}
      //sort crossing point
      for(k = 0; k < num - 1; k++){
	for(l = num - 1; l > k; l--){
	  if(cross[l] < cross[l - 1]){
	    m = cross[l];
	    cross[l] = cross[l - 1];
	    cross[l - 1] = m;
	  }
	}
      }
      //draw to vram
      for(k = 0 ; k < num; k = k + 2){
	for(l = cross[k]; l <= cross[k + 1]; l++){
	  if(0 <= j && j < canvasHeight && 0 <= l && l < canvasWidth)
	   image[j][l] = col;
	}
      }
    }
  }
}
