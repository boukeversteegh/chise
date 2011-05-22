//kagecd.c
//
#include "kage.h"
#include "kagecgi.h"

void cdDrawBezier(double x1, double y1,
	double x2, double y2,
	double x3, double y3,
	double x4, double y4,
	int a1, int a2){

	double rad, t;
	double x, y, v;
	double ix, iy, ia, ib, ir;
	int count, tt;
	double delta;
	double deltad;
	double XX, XY, YX, YY;
	
	if(kShotai == kMincho){ // mincho
	switch(a1){
	case 0:
	case 7:
		delta = -1 * kMinWidthY * 0.5;
		break;
	case 1:
	case 2:
	case 6:
	case 22:
		delta = 0;
		break;
	case 12:
	case 32:
		delta = kMinWidthY;
		break;
	default:
		break;
	}
	
	if(x1 == x2){
		if(y1 < y2){ y1 = y1 - delta; }
		else{ y1 = y1 + delta; }
	}
	else if(y1 == y2){
		if(x1 < x2){ x1 = x1 - delta; }
		else{ x1 = x1 + delta; }
	}
	else{
		rad = atan((double)(y2 - y1) / (double)(x2 - x1));
		if(x1 < x2){ v = 1; } else{ v = -1; }
		x1 = x1 - delta * cos(rad) * v;
		y1 = y1 - delta * sin(rad) * v;
	}
	
	switch(a2){
	case 0:
	case 1:
	case 8:
	case 7:
	case 9:
	case 15:
	case 14:
	case 17:
	case 5:
		delta = 0;
		break;
	default:
		break;
	}
	
	if(x3 == x4){
		if(y3 < y4){ y4 = y4 + delta; }
		else{ y4 = y4 - delta; }
	}
	else if(y3 == y4){
		if(x3 < x4){ x4 = x4 + delta; }
		else{ x4 = x4 - delta; }
	}
	else{
		rad = atan((double)(y4 - y3) / (double)(x4 - x3));
		if(x3 < x4){ v = 1; } else{ v = -1; }
		x4 = x4 + delta * cos(rad) * v;
		y4 = y4 + delta * sin(rad) * v;
	}
	
	count = 0;
	
	for(tt = 0; tt <= 1000; tt = tt + kRate){
		t = (double)(tt) / 1000;
		
		//calculate a dot
		x = (1.0 - t) * (1.0 - t) * (1.0 - t) * x1 + 3.0 * t * (1.0 - t) * (1.0 - t) * x2 + 3 * t * t * (1.0 - t) * x3 + t * t * t * x4;
		y = (1.0 - t) * (1.0 - t) * (1.0 - t) * y1 + 3.0 * t * (1.0 - t) * (1.0 - t) * y2 + 3 * t * t * (1.0 - t) * y3 + t * t * t * y4;
		//KATAMUKI of vector by BIBUN
		ix = t * t * (-3 * x1 + 9 * x2 + -9 * x3 + 3 * x4) + t * (6 * x1 + -12 * x2 + 6 * x3) + -3 * x1 + 3 * x2;
		iy = t * t * (-3 * y1 + 9 * y2 + -9 * y3 + 3 * y4) + t * (6 * y1 + -12 * y2 + 6 * y3) + -3 * y1 + 3 * y2;
		
		//line SUICHOKU by vector
		if(ix != 0 && iy != 0){
			ir = atan(iy / ix * -1);
			ia = sin(ir) * (double)(kMinWidthT);
			ib = cos(ir) * (double)(kMinWidthT);
		}
		else if(ix == 0){
			ia = kMinWidthT;
			ib = 0;
		}
		else{
			ia = 0;
			ib = kMinWidthT;
		}
		
		if(a1 == 7){ deltad = sqrt(t); }
		else if(a2 == 7){ deltad = sqrt(1.0 - t); }
		else{ deltad = 1; }
		ia = ia * deltad;
		ib = ib * deltad;
		
		//reverse if vector is going 2nd/3rd quadrants
		if(ix <= 0){
		  ia = ia * -1;
		  ib = ib * -1;
		}
		
		//copy to polygon structuer
		poly[count].X = x - ia;
		poly[count].Y = y - ib;
		poly[(1000 / kRate + 1) * 2 - 1 - count].X = x + ia;
		poly[(1000 / kRate + 1) * 2 - 1 - count].Y = y + ib;
		count += 1;
	}
	
	icPolygon(poly, (1000 / kRate + 1) * 2);
	
	//process for head of stroke
	rad = atan((double)(y2 - y1) / (double)(x2 - x1));
	if(x1 < x2){ v = 1; } else{ v = -1; }
	XX = sin(rad) * v;
	XY = cos(rad) * v * -1;
	YX = cos(rad) * v;
	YY = sin(rad) * v;
	
	if(a1 == 12){
		if(x1 == x2){
			poly2[0].X = x1 - kMinWidthT;
			poly2[0].Y = y1;
			poly2[1].X = x1 + kMinWidthT;
			poly2[1].Y = y1;
			poly2[2].X = x1 - kMinWidthT;
			poly2[2].Y = y1 - kMinWidthT;
			icPolygon(poly2, 3);
		}
		else{
			poly2[0].X = x1 - kMinWidthT * XX;
			poly2[0].Y = y1 - kMinWidthT * XY;
			poly2[1].X = x1 + kMinWidthT * XX;
			poly2[1].Y = y1 + kMinWidthT * XY;
			poly2[2].X = x1 - kMinWidthT * XX - kMinWidthT * YX;
			poly2[2].Y = y1 - kMinWidthT * XY - kMinWidthT * YY;
			icPolygon(poly2, 3);
		}
	}
	
	if(a1 == 0){
		if(y1 <= y4){ //from up to bottom
			if(x1 == x2){
	 			poly2[0].X = x1 - kMinWidthT;
				poly2[0].Y = y1;
				poly2[1].X = x1 + kMinWidthT;
				poly2[1].Y = y1;
				poly2[2].X = x1 - kMinWidthT;
				poly2[2].Y = y1 - kMinWidthY;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x1 - kMinWidthT * XX;
				poly2[0].Y = y1 - kMinWidthT * XY;
				poly2[1].X = x1 + kMinWidthT * XX;
				poly2[1].Y = y1 + kMinWidthT * XY;
				poly2[2].X = x1 - kMinWidthT * XX - kMinWidthY * YX;
				poly2[2].Y = y1 - kMinWidthT * XY - kMinWidthY * YY;
				icPolygon(poly2, 3);
			}
		}
		else{ //bottom to up
			if(x1 == x2){ //is it right?
				poly2[0].X = x1 - kMinWidthT;
				poly2[0].Y = y1;
				poly2[1].X = x1 + kMinWidthT;
				poly2[1].Y = y1;
				poly2[2].X = x1 - kMinWidthT;
				poly2[2].Y = y1 + kMinWidthY;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x1 - kMinWidthT * XX;
				poly2[0].Y = y1 - kMinWidthT * XY;
				poly2[1].X = x1 + kMinWidthT * XX;
				poly2[1].Y = y1 + kMinWidthT * XY;
				poly2[2].X = x1 + kMinWidthT * XX - kMinWidthY * YX;
				poly2[2].Y = y1 + kMinWidthT * XY - kMinWidthY * YY;
				icPolygon(poly2, 3);
			}
		}
	}
	
	if(a1 == 22){ //box's up-right corner, any time same degree
		poly3[0].X = x1 - kMinWidthT;
		poly3[0].Y = y1 - kMinWidthY;
		poly3[1].X = x1;
		poly3[1].Y = y1 - kMinWidthY - kWidth;
		poly3[2].X = x1 + kMinWidthT + kWidth;
		poly3[2].Y = y1 + kMinWidthY;
		poly3[3].X = x1 + kMinWidthT;
		poly3[3].Y = y1 + kMinWidthT;
		poly3[4].X = x1 - kMinWidthT;
		poly3[4].Y = y1;
		icPolygon(poly3, 5);
	}
	
	if(a1 == 0){ //beginning of the stroke
		if(y1 <= y4){ //from up to bottom
			if(x1 == x2){
				poly2[0].X = x1 + kMinWidthT;
				poly2[0].Y = y1 + kMinWidthY * 0.5;
				poly2[1].X = x1 + kMinWidthT + kMinWidthT * 0.5;
				poly2[1].Y = y1 + kMinWidthY * 0.5 + kMinWidthY;
				poly2[2].X = x1 + kMinWidthT;
				poly2[2].Y = y1 + kMinWidthY * 0.5 + kMinWidthY * 2;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x1 + kMinWidthT * XX + (kMinWidthY * 0.5) * YX;
				poly2[0].Y = y1 + kMinWidthT * XY + (kMinWidthY * 0.5) * YY;
				poly2[1].X = x1 + (kMinWidthT + kMinWidthT * 0.5) * XX + (kMinWidthY * 0.5 + kMinWidthY) * YX;
				poly2[1].Y = y1 + (kMinWidthT + kMinWidthT * 0.5) * XY + (kMinWidthY * 0.5 + kMinWidthY) * YY;
				poly2[2].X = x1 + kMinWidthT * XX + (kMinWidthY * 0.5 + kMinWidthY * 2) * YX;
				poly2[2].Y = y1 + kMinWidthT * XY + (kMinWidthY * 0.5 + kMinWidthY * 2) * YY;
				icPolygon(poly2, 3);
			}
		}
		else{ //from bottom to up
			if(x1 == x2){ //is it right?
				poly2[0].X = x1 + kMinWidthT;
				poly2[0].Y = y1 - kMinWidthY * 0.5;
				poly2[1].X = x1 + kMinWidthT + kMinWidthT * 0.5;
				poly2[1].Y = y1 - kMinWidthY * 0.5 - kMinWidthY;
				poly2[2].X = x1 + kMinWidthT;
				poly2[2].Y = y1 - kMinWidthY * 0.5 - kMinWidthY * 2;
				icPolygon(poly2, 3);
			}
			else //SETSUGOUMEN GA KAKERUNODE HOKYOU
				poly3[0].X = x1 - (kMinWidthT - 1) * XX + (kMinWidthY * 0.5) * YX;
				poly3[0].Y = y1 - (kMinWidthT - 1) * XY + (kMinWidthY * 0.5) * YY;
				poly3[1].X = x1 - (kMinWidthT - 0) * XX + (kMinWidthY * 0.5) * YX;
				poly3[1].Y = y1 - (kMinWidthT - 0) * XY + (kMinWidthY * 0.5) * YY;
				poly3[2].X = x1 - (kMinWidthT + kMinWidthT * 0.5) * XX + (kMinWidthY * 0.5 + kMinWidthY) * YX;
				poly3[2].Y = y1 - (kMinWidthT + kMinWidthT * 0.5) * XY + (kMinWidthY * 0.5 + kMinWidthY) * YY;
				poly3[3].X = x1 - (kMinWidthT - 0) * XX + (kMinWidthY * 0.5 + kMinWidthY * 2) * YX;
				poly3[3].Y = y1 - (kMinWidthT - 0) * XY + (kMinWidthY * 0.5 + kMinWidthY * 2) * YY;
				poly3[4].X = x1 - (kMinWidthT - 1) * XX + (kMinWidthY * 0.5 + kMinWidthY * 2) * YX;
				poly3[4].Y = y1 - (kMinWidthT - 1) * XY + (kMinWidthY * 0.5 + kMinWidthY * 2) * YY;
				icPolygon(poly3, 5);
			}
		}
		
		//process for tail
		rad = atan((double)(y4 - y3) / (double)(x4 - x3));
		if(x3 < x4){ v = 1; } else{ v = -1; }
		YX = sin(rad) * v * -1;
		YY = cos(rad) * v;
		XX = cos(rad) * v;
		XY = sin(rad) * v;
		
		if(a2 == 1 || a2 == 8 || a2 == 15){ //the last filled circle
			if(x3 == x4){
				poly3[0].X = x4 - kMinWidthT;
				poly3[0].Y = y4;
				poly3[1].X = x4 - kMinWidthT * 0.6;
				poly3[1].Y = y4 + kMinWidthT * 0.6;
				poly3[2].X = x4;
				poly3[2].Y = y4 + kMinWidthT;
				poly3[3].X = x4 + kMinWidthT * 0.6;
				poly3[3].Y = y4 + kMinWidthT * 0.6;
				poly3[4].X = x4 + kMinWidthT;
				poly3[4].Y = y4;
				icPolygon(poly3, 5);
			}
			else if(y3 == y4){
				poly3[0].X = x4;
				poly3[0].Y = y4 - kMinWidthT;
				poly3[1].X = x4 + kMinWidthT * 0.6;
				poly3[1].Y = y4 - kMinWidthT * 0.6;
				poly3[2].X = x4 + kMinWidthT;
				poly3[2].Y = y4;
				poly3[3].X = x4 + kMinWidthT * 0.6;
				poly3[3].Y = y4 + kMinWidthT * 0.6;
				poly3[4].X = x4;
				poly3[4].Y = y4 + kMinWidthT;
				icPolygon(poly3, 5);
			}
			else{
				poly3[0].X = x4 + sin(rad) * kMinWidthT * v;
				poly3[0].Y = y4 - cos(rad) * kMinWidthT * v;
				poly3[1].X = x4 + cos(rad) * kMinWidthT * 0.8 * v + sin(rad) * kMinWidthT * 0.6 * v;
				poly3[1].Y = y4 + sin(rad) * kMinWidthT * 0.8 * v - cos(rad) * kMinWidthT * 0.6 * v;
				poly3[2].X = x4 + cos(rad) * kMinWidthT * v;
				poly3[2].Y = y4 + sin(rad) * kMinWidthT * v;
				poly3[3].X = x4 + cos(rad) * kMinWidthT * 0.8 * v - sin(rad) * kMinWidthT * 0.6 * v;
				poly3[3].Y = y4 + sin(rad) * kMinWidthT * 0.8 * v + cos(rad) * kMinWidthT * 0.6 * v;
				poly3[4].X = x4 - sin(rad) * kMinWidthT * v;
				poly3[4].Y = y4 + cos(rad) * kMinWidthT * v;
				icPolygon(poly3, 5);
			}
		}
		
		if(a2 == 9 || (a1 == 7 && a2 == 0)){ // Sinnyu & L2RD Harai
			if(y3 == y4){
				poly2[0].X = x4;
				poly2[0].Y = y4 + kMinWidthT;
				poly2[1].X = x4;
				poly2[1].Y = y4 - kMinWidthT;
				poly2[2].X = x4 + kMinWidthT;
				poly2[2].Y = y4 - kMinWidthT;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x4 + kMinWidthT * YX;
				poly2[0].Y = y4 + kMinWidthT * YY;
				poly2[1].X = x4 - kMinWidthT * YX;
				poly2[1].Y = y4 - kMinWidthT * YY;
				poly2[2].X = x4 + kMinWidthT * XX - kMinWidthT * YX;
				poly2[2].Y = y4 + kMinWidthT * XY - kMinWidthT * YY;
				icPolygon(poly2, 3);
			}
		}
		
		if(a2 == 15){ //jump up
			if(y3 == y4){
				poly4[0].X = x4;
				poly4[0].Y = y4 - kMinWidthT + 1;
				poly4[1].X = x4 + 2;
				poly4[1].Y = y4 - kMinWidthT - kWidth * 5;
				poly4[2].X = x4;
				poly4[2].Y = y4 - kMinWidthT - kWidth * 5;
				poly4[3].X = x4 - kMinWidthT;
				poly4[3].Y = y4 - kMinWidthT + 1;
				icPolygon(poly4, 4);
			}
			else{
				poly4[0].X = x4 + (kMinWidthT - 1) * sin(rad) * v;
				poly4[0].Y = y4 - (kMinWidthT - 1) * cos(rad) * v;
				poly4[1].X = x4 + 2 * cos(rad) * v + (kMinWidthT + kWidth * 5) * sin(rad) * v;
				poly4[1].Y = y4 + 2 * sin(rad) * v - (kMinWidthT + kWidth * 5) * cos(rad) * v;
				poly4[2].X = x4 + (kMinWidthT + kWidth * 5) * sin(rad) * v;
				poly4[2].Y = y4 - (kMinWidthT + kWidth * 5) * cos(rad) * v;
				poly4[3].X = x4 + (kMinWidthT - 1) * sin(rad) * v - kMinWidthT * cos(rad) * v;
				poly4[3].Y = y4 - (kMinWidthT - 1) * cos(rad) * v - kMinWidthT * sin(rad) * v;
				icPolygon(poly4, 4);
			}
		}
		
		if(a2 == 14){ //jump to left, allways go left
			poly4[0].X = x4;
			poly4[0].Y = y4;
			poly4[1].X = x4;
			poly4[1].Y = y4 - kMinWidthT;
			poly4[2].X = x4 - kWidth * 4;
			poly4[2].Y = y4 - kMinWidthT;
			poly4[3].X = x4 - kWidth * 4;
			poly4[3].Y = y4 - kMinWidthT * 0.5;
			icPolygon(poly4, 4);
		}
	}
	else{ //gothic
		if(a1 % 10 == 2){
			if(x1 == x2){
				if(y1 < y2){ y1 = y1 - kWidth; } else{ y1 = y1 + kWidth; }
			}
			else if(y1 == y2){
				if(x1 < x2){ x1 = x1 - kWidth; } else{ x1 = x1 + kWidth; }
			}
			else{
				rad = atan((double)(y2 - y1) / (double)(x2 - x1));
				if(x1 < x2){ v = 1; } else{ v = -1; }
				x1 = x1 - kWidth * cos(rad) * v;
				y1 = y1 - kWidth * sin(rad) * v;
			}
		}
		
		if(a1 % 10 == 3){
			if(x1 == x2){
				if(y1 < y2){
					 y1 = y1 - kWidth * kKakato;
				}
			else{
				 y1 = y1 + kWidth * kKakato;
			}
		}
		else if(y1 == y2){
			if(x1 < x2){
				x1 = x1 - kWidth * kKakato;
			}
			else{
				x1 = x1 + kWidth * kKakato;
			}
		}
		else{
			rad = atan((double)(y2 - y1) / (double)(x2 - x1));
			if(x1 < x2){ v = 1; } else{ v = -1; }
			x1 = x1 - kWidth * cos(rad) * v * kKakato;
			y1 = y1 - kWidth * sin(rad) * v * kKakato;
			}
		}
		if(a2 % 10 == 2){
			if(x3 == x4){
				if(y3 < y4){ y4 = y4 + kWidth; } else{ y4 = y4 - kWidth; }
			}
			else if(y3 == y4){
				if(x3 < x4){ x4 = x4 + kWidth; } else{ x4 = x4 - kWidth; }
			}
			else{
				rad = atan((double)(y4 - y3) / (double)(x4 - x3));
				if(x3 < x4){ v = 1; } else{ v = -1; }
				x4 = x4 + kWidth * cos(rad) * v;
				y4 = y4 + kWidth * sin(rad) * v;
			}
		}
		
		if(a2 % 10 == 3){
			if(x3 == x4){
				if(y3 < y4){
					y4 = y4 + kWidth * kKakato;
				}
				else{
					y4 = y4 - kWidth * kKakato;
				}
			}
			else if(y3 == y4){
				if(x3 < x4){
					x4 = x4 + kWidth * kKakato;
				}
				else{
					x4 = x4 - kWidth * kKakato;
				}
			}
			else{
				rad = atan((double)(y4 - y3) / (double)(x4 - x3));
				if(x3 < x4){ v = 1; } else{ v = -1; }
				x4 = x4 + kWidth * cos(rad) * v * kKakato;
				y4 = y4 + kWidth * sin(rad) * v * kKakato;
			}
		}
		
		count = 0;
		
		for(tt = 0; tt <= 1000; tt = tt + kRate){
			t = (double)tt / 1000;
			
			//calculate a dot
			x = (1.0 - t) * (1.0 - t) * (1.0 - t) * x1 + 3.0 * t * (1.0 - t) * (1.0 - t) * x2 + 3 * t * t * (1.0 - t) * x3 + t * t * t * x4;
			y = (1.0 - t) * (1.0 - t) * (1.0 - t) * y1 + 3.0 * t * (1.0 - t) * (1.0 - t) * y2 + 3 * t * t * (1.0 - t) * y3 + t * t * t * y4;
			//KATAMUKI of vector by BIBUN
			ix = t * t * (-3 * x1 + 9 * x2 + -9 * x3 + 3 * x4) + t * (6 * x1 + -12 * x2 + 6 * x3) + -3 * x1 + 3 * x2;
			iy = t * t * (-3 * y1 + 9 * y2 + -9 * y3 + 3 * y4) + t * (6 * y1 + -12 * y2 + 6 * y3) + -3 * y1 + 3 * y2;
			
			//SESSEN NI SUICHOKU NA CHOKUSEN NO KEISAN
			if(kShotai == kMincho){ //always false ?
				if(ix != 0 && iy != 0){
					ir = atan(iy / ix * -1.0);
	 				ia = sin(ir) * (double)kMinWidthT;
					ib = cos(ir) * (double)kMinWidthT;
				}
				else if(ix == 0){
					ia = kMinWidthT;
					ib = 0;
				}
				else{
					ia = 0;
					ib = kMinWidthT;
				}
				ia = ia * sqrt(1.0 - t);
				ib = ib * sqrt(1.0 - t);
			}
			else{
				if(ix != 0 && iy != 0){
					ir = atan(iy / ix * -1.0);
					ia = sin(ir) * (double)kWidth;
					ib = cos(ir) * (double)kWidth;
				}
				else if(ix == 0){
					ia = kWidth;
					ib = 0;
				}
				else{
					ia = 0;
					ib = kWidth;
				}
			}

			//reverse if vector is going 2nd/3rd quadrants
			if(ix <= 0){
			  ia = ia * -1;
			  ib = ib * -1;
			}
		
			//save to polygon
			poly[count].X = x - ia;
			poly[count].Y = y - ib;
			poly[(1000 / kRate + 1) * 2 - 1 - count].X = x + ia;
			poly[(1000 / kRate + 1) * 2 - 1 - count].Y = y + ib;
			count += 1;
		}
		
		icPolygon(poly, (1000 / kRate + 1) * 2);
	}
}

void cdDrawCurve(double x1, double y1,
	double x2, double y2,
	double x3, double y3,
	int a1, int a2){

	double rad, t;
	double x, y, v;
	double ix, iy, ia, ib, ir;
	int count, tt;
	double delta;
	double deltad;
	double XX, XY, YX, YY;
	
	if(kShotai == kMincho){ // mincho
	switch(a1){
	case 0:
	case 7:
		delta = -1 * kMinWidthY * 0.5;
		break;
	case 1:
	case 2:
	case 6:
	case 22:
		delta = 0;
		break;
	case 12:
	case 32:
		delta = kMinWidthY;
		break;
	default:
		break;
	}
	
	if(x1 == x2){
		if(y1 < y2){ y1 = y1 - delta; }
		else{ y1 = y1 + delta; }
	}
	else if(y1 == y2){
		if(x1 < x2){ x1 = x1 - delta; }
		else{ x1 = x1 + delta; }
	}
	else{
		rad = atan((double)(y2 - y1) / (double)(x2 - x1));
		if(x1 < x2){ v = 1; } else{ v = -1; }
		x1 = x1 - delta * cos(rad) * v;
		y1 = y1 - delta * sin(rad) * v;
	}
	
	switch(a2){
	case 0:
	case 1:
	case 7:
	case 9:
	case 15:
	case 14:
	case 17:
	case 5:
		delta = 0;
		break;
        case 8: // get shorten for tail's circle
          delta = -1 * kMinWidthT * 0.5;
          break;
	default:
		break;
	}
	
	if(x2 == x3){
		if(y2 < y3){ y3 = y3 + delta; }
		else{ y3 = y3 - delta; }
	}
	else if(y2 == y3){
		if(x2 < x3){ x3 = x3 + delta; }
		else{ x3 = x3 - delta; }
	}
	else{
		rad = atan((double)(y3 - y2) / (double)(x3 - x2));
		if(x2 < x3){ v = 1; } else{ v = -1; }
		x3 = x3 + delta * cos(rad) * v;
		y3 = y3 + delta * sin(rad) * v;
	}
	
	count = 0;
	
	for(tt = 0; tt <= 1000; tt = tt + kRate){
		t = (double)(tt) / 1000;
		
		//calculate a dot
		x = ((1.0 - t) * (1.0 - t) * x1 + 2.0 * t * (1.0 - t) * x2 + t * t * x3);
		y = ((1.0 - t) * (1.0 - t) * y1 + 2.0 * t * (1.0 - t) * y2 + t * t * y3);
		
		//KATAMUKI of vector by BIBUN
		ix = (x1 - 2.0 * x2 + x3) * 2.0 * t + (-2.0 * x1 + 2.0 * x2);
		iy = (y1 - 2.0 * y2 + y3) * 2.0 * t + (-2.0 * y1 + 2.0 * y2);
		
		//line SUICHOKU by vector
		if(ix != 0 && iy != 0){
			ir = atan(iy / ix * -1);
			ia = sin(ir) * (double)(kMinWidthT);
			ib = cos(ir) * (double)(kMinWidthT);
		}
		else if(ix == 0){
			ia = kMinWidthT;
			ib = 0;
		}
		else{
			ia = 0;
			ib = kMinWidthT;
		}
		
		if(a1 == 7 && a2 == 0){ deltad = sqrt(t) * kL2RDfatten; } //L2RD: fatten
		else if(a1 == 7){ deltad = sqrt(t); }
		else if(a2 == 7){ deltad = sqrt(1.0 - t); }
		else{ deltad = 1; }
		ia = ia * deltad;
		ib = ib * deltad;
		
		//reverse if vector is going 2nd/3rd quadrants
		if(ix <= 0){
		  ia = ia * -1;
		  ib = ib * -1;
		}
		
		//copy to polygon structuer
		poly[count].X = x - ia;
		poly[count].Y = y - ib;
		poly[(1000 / kRate + 1) * 2 - 1 - count].X = x + ia;
		poly[(1000 / kRate + 1) * 2 - 1 - count].Y = y + ib;
		count += 1;
	}
	
	icPolygon(poly, (1000 / kRate + 1) * 2);
	
	//process for head of stroke
	rad = atan((double)(y2 - y1) / (double)(x2 - x1));
	if(x1 < x2){ v = 1; } else{ v = -1; }
	XX = sin(rad) * v;
	XY = cos(rad) * v * -1;
	YX = cos(rad) * v;
	YY = sin(rad) * v;
	
	if(a1 == 12){
		if(x1 == x2){
			poly2[0].X = x1 - kMinWidthT;
			poly2[0].Y = y1;
			poly2[1].X = x1 + kMinWidthT;
			poly2[1].Y = y1;
			poly2[2].X = x1 - kMinWidthT;
			poly2[2].Y = y1 - kMinWidthT;
			icPolygon(poly2, 3);
		}
		else{
			poly2[0].X = x1 - kMinWidthT * XX;
			poly2[0].Y = y1 - kMinWidthT * XY;
			poly2[1].X = x1 + kMinWidthT * XX;
			poly2[1].Y = y1 + kMinWidthT * XY;
			poly2[2].X = x1 - kMinWidthT * XX - kMinWidthT * YX;
			poly2[2].Y = y1 - kMinWidthT * XY - kMinWidthT * YY;
			icPolygon(poly2, 3);
		}
	}
	
	if(a1 == 0){
		if(y1 <= y3){ //from up to bottom
			if(x1 == x2){
	 			poly2[0].X = x1 - kMinWidthT;
				poly2[0].Y = y1;
				poly2[1].X = x1 + kMinWidthT;
				poly2[1].Y = y1;
				poly2[2].X = x1 - kMinWidthT;
				poly2[2].Y = y1 - kMinWidthY;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x1 - kMinWidthT * XX;
				poly2[0].Y = y1 - kMinWidthT * XY;
				poly2[1].X = x1 + kMinWidthT * XX;
				poly2[1].Y = y1 + kMinWidthT * XY;
				poly2[2].X = x1 - kMinWidthT * XX - kMinWidthY * YX;
				poly2[2].Y = y1 - kMinWidthT * XY - kMinWidthY * YY;
				icPolygon(poly2, 3);
			}
		}
		else{ //bottom to up
			if(x1 == x2){ //is it right?
				poly2[0].X = x1 - kMinWidthT;
				poly2[0].Y = y1;
				poly2[1].X = x1 + kMinWidthT;
				poly2[1].Y = y1;
				poly2[2].X = x1 - kMinWidthT;
				poly2[2].Y = y1 + kMinWidthY;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x1 - kMinWidthT * XX;
				poly2[0].Y = y1 - kMinWidthT * XY;
				poly2[1].X = x1 + kMinWidthT * XX;
				poly2[1].Y = y1 + kMinWidthT * XY;
				poly2[2].X = x1 + kMinWidthT * XX - kMinWidthY * YX;
				poly2[2].Y = y1 + kMinWidthT * XY - kMinWidthY * YY;
				icPolygon(poly2, 3);
			}
		}
	}
	
	if(a1 == 22){ //box's up-right corner, any time same degree
		poly3[0].X = x1 - kMinWidthT;
		poly3[0].Y = y1 - kMinWidthY;
		poly3[1].X = x1;
		poly3[1].Y = y1 - kMinWidthY - kWidth;
		poly3[2].X = x1 + kMinWidthT + kWidth;
		poly3[2].Y = y1 + kMinWidthY;
		poly3[3].X = x1 + kMinWidthT;
		poly3[3].Y = y1 + kMinWidthT;
		poly3[4].X = x1 - kMinWidthT;
		poly3[4].Y = y1;
		icPolygon(poly3, 5);
	}
	
	if(a1 == 0){ //beginning of the stroke
		if(y1 <= y3){ //from up to bottom
			if(x1 == x2){
				poly2[0].X = x1 + kMinWidthT;
				poly2[0].Y = y1 + kMinWidthY * 0.5;
				poly2[1].X = x1 + kMinWidthT + kMinWidthT * 0.5;
				poly2[1].Y = y1 + kMinWidthY * 0.5 + kMinWidthY;
				poly2[2].X = x1 + kMinWidthT;
				poly2[2].Y = y1 + kMinWidthY * 0.5 + kMinWidthY * 2;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x1 + kMinWidthT * XX + (kMinWidthY * 0.5) * YX;
				poly2[0].Y = y1 + kMinWidthT * XY + (kMinWidthY * 0.5) * YY;
				poly2[1].X = x1 + (kMinWidthT + kMinWidthT * 0.5) * XX + (kMinWidthY * 0.5 + kMinWidthY) * YX;
				poly2[1].Y = y1 + (kMinWidthT + kMinWidthT * 0.5) * XY + (kMinWidthY * 0.5 + kMinWidthY) * YY;
				poly2[2].X = x1 + kMinWidthT * XX + (kMinWidthY * 0.5 + kMinWidthY * 2) * YX;
				poly2[2].Y = y1 + kMinWidthT * XY + (kMinWidthY * 0.5 + kMinWidthY * 2) * YY;
				icPolygon(poly2, 3);
			}
		}
		else{ //from bottom to up
			if(x1 == x2){ //is it right?
				poly2[0].X = x1 + kMinWidthT;
				poly2[0].Y = y1 - kMinWidthY * 0.5;
				poly2[1].X = x1 + kMinWidthT + kMinWidthT * 0.5;
				poly2[1].Y = y1 - kMinWidthY * 0.5 - kMinWidthY;
				poly2[2].X = x1 + kMinWidthT;
				poly2[2].Y = y1 - kMinWidthY * 0.5 - kMinWidthY * 2;
				icPolygon(poly2, 3);
			}
			else //SETSUGOUMEN GA KAKERUNODE HOKYOU
				poly3[0].X = x1 - (kMinWidthT - 1) * XX + (kMinWidthY * 0.5) * YX;
				poly3[0].Y = y1 - (kMinWidthT - 1) * XY + (kMinWidthY * 0.5) * YY;
				poly3[1].X = x1 - (kMinWidthT - 0) * XX + (kMinWidthY * 0.5) * YX;
				poly3[1].Y = y1 - (kMinWidthT - 0) * XY + (kMinWidthY * 0.5) * YY;
				poly3[2].X = x1 - (kMinWidthT + kMinWidthT * 0.5) * XX + (kMinWidthY * 0.5 + kMinWidthY) * YX;
				poly3[2].Y = y1 - (kMinWidthT + kMinWidthT * 0.5) * XY + (kMinWidthY * 0.5 + kMinWidthY) * YY;
				poly3[3].X = x1 - (kMinWidthT - 0) * XX + (kMinWidthY * 0.5 + kMinWidthY * 2) * YX;
				poly3[3].Y = y1 - (kMinWidthT - 0) * XY + (kMinWidthY * 0.5 + kMinWidthY * 2) * YY;
				poly3[4].X = x1 - (kMinWidthT - 1) * XX + (kMinWidthY * 0.5 + kMinWidthY * 2) * YX;
				poly3[4].Y = y1 - (kMinWidthT - 1) * XY + (kMinWidthY * 0.5 + kMinWidthY * 2) * YY;
				icPolygon(poly3, 5);
			}
		}
		
		//process for tail
		rad = atan((double)(y3 - y2) / (double)(x3 - x2));
		if(x2 < x3){ v = 1; } else{ v = -1; }
		YX = sin(rad) * v * -1;
		YY = cos(rad) * v;
		XX = cos(rad) * v;
		XY = sin(rad) * v;
		
		if(a2 == 1 || a2 == 8 || a2 == 15){ //the last filled circle
			if(x2 == x3){
				poly3[0].X = x3 - kMinWidthT;
				poly3[0].Y = y3;
				poly3[1].X = x3 - kMinWidthT * 0.6;
				poly3[1].Y = y3 + kMinWidthT * 0.6;
				poly3[2].X = x3;
				poly3[2].Y = y3 + kMinWidthT;
				poly3[3].X = x3 + kMinWidthT * 0.6;
				poly3[3].Y = y3 + kMinWidthT * 0.6;
				poly3[4].X = x3 + kMinWidthT;
				poly3[4].Y = y3;
				icPolygon(poly3, 5);
			}
			else if(y2 == y3){
				poly3[0].X = x3;
				poly3[0].Y = y3 - kMinWidthT;
				poly3[1].X = x3 + kMinWidthT * 0.6;
				poly3[1].Y = y3 - kMinWidthT * 0.6;
				poly3[2].X = x3 + kMinWidthT;
				poly3[2].Y = y3;
				poly3[3].X = x3 + kMinWidthT * 0.6;
				poly3[3].Y = y3 + kMinWidthT * 0.6;
				poly3[4].X = x3;
				poly3[4].Y = y3 + kMinWidthT;
				icPolygon(poly3, 5);
			}
			else{
				poly3[0].X = x3 + sin(rad) * kMinWidthT * v;
				poly3[0].Y = y3 - cos(rad) * kMinWidthT * v;
				poly3[1].X = x3 + cos(rad) * kMinWidthT * 0.8 * v + sin(rad) * kMinWidthT * 0.6 * v;
				poly3[1].Y = y3 + sin(rad) * kMinWidthT * 0.8 * v - cos(rad) * kMinWidthT * 0.6 * v;
				poly3[2].X = x3 + cos(rad) * kMinWidthT * v;
				poly3[2].Y = y3 + sin(rad) * kMinWidthT * v;
				poly3[3].X = x3 + cos(rad) * kMinWidthT * 0.8 * v - sin(rad) * kMinWidthT * 0.6 * v;
				poly3[3].Y = y3 + sin(rad) * kMinWidthT * 0.8 * v + cos(rad) * kMinWidthT * 0.6 * v;
				poly3[4].X = x3 - sin(rad) * kMinWidthT * v;
				poly3[4].Y = y3 + cos(rad) * kMinWidthT * v;
				icPolygon(poly3, 5);
			}
		}
		
		if(a2 == 9 || (a1 == 7 && a2 == 0)){ // Sinnyu & L2RD Harai
			if(y2 == y3){
				poly2[0].X = x3;
				poly2[0].Y = y3 + kMinWidthT * kL2RDfatten;
				poly2[1].X = x3;
				poly2[1].Y = y3 - kMinWidthT * kL2RDfatten;
				poly2[2].X = x3 + kMinWidthT * kL2RDfatten;
				poly2[2].Y = y3 - kMinWidthT * kL2RDfatten;
				icPolygon(poly2, 3);
			}
			else{
				poly2[0].X = x3 + kMinWidthT * kL2RDfatten * YX;
				poly2[0].Y = y3 + kMinWidthT * kL2RDfatten * YY;
				poly2[1].X = x3 - kMinWidthT * kL2RDfatten * YX;
				poly2[1].Y = y3 - kMinWidthT * kL2RDfatten * YY;
				poly2[2].X = x3 + kMinWidthT * kL2RDfatten * XX - kMinWidthT * kL2RDfatten * YX;
				poly2[2].Y = y3 + kMinWidthT * kL2RDfatten * XY - kMinWidthT * kL2RDfatten * YY;
				icPolygon(poly2, 3);
			}
		}
		
		if(a2 == 15){ //jump up
			if(y2 == y3){
				poly4[0].X = x3;
				poly4[0].Y = y3 - kMinWidthT + 1;
				poly4[1].X = x3 + 2;
				poly4[1].Y = y3 - kMinWidthT - kWidth * 5;
				poly4[2].X = x3;
				poly4[2].Y = y3 - kMinWidthT - kWidth * 5;
				poly4[3].X = x3 - kMinWidthT;
				poly4[3].Y = y3 - kMinWidthT + 1;
				icPolygon(poly4, 4);
			}
			else{
				poly4[0].X = x3 + (kMinWidthT - 1) * sin(rad) * v;
				poly4[0].Y = y3 - (kMinWidthT - 1) * cos(rad) * v;
				poly4[1].X = x3 + 2 * cos(rad) * v + (kMinWidthT + kWidth * 5) * sin(rad) * v;
				poly4[1].Y = y3 + 2 * sin(rad) * v - (kMinWidthT + kWidth * 5) * cos(rad) * v;
				poly4[2].X = x3 + (kMinWidthT + kWidth * 5) * sin(rad) * v;
				poly4[2].Y = y3 - (kMinWidthT + kWidth * 5) * cos(rad) * v;
				poly4[3].X = x3 + (kMinWidthT - 1) * sin(rad) * v - kMinWidthT * cos(rad) * v;
				poly4[3].Y = y3 - (kMinWidthT - 1) * cos(rad) * v - kMinWidthT * sin(rad) * v;
				icPolygon(poly4, 4);
			}
		}
		
		if(a2 == 14){ //jump to left, allways go left
			poly4[0].X = x3;
			poly4[0].Y = y3;
			poly4[1].X = x3;
			poly4[1].Y = y3 - kMinWidthT;
			poly4[2].X = x3 - kWidth * 4;
			poly4[2].Y = y3 - kMinWidthT;
			poly4[3].X = x3 - kWidth * 4;
			poly4[3].Y = y3 - kMinWidthT * 0.5;
			icPolygon(poly4, 4);
		}
	}
	else{ //gothic
		if(a1 % 10 == 2){
			if(x1 == x2){
				if(y1 < y2){ y1 = y1 - kWidth; } else{ y1 = y1 + kWidth; }
			}
			else if(y1 == y2){
				if(x1 < x2){ x1 = x1 - kWidth; } else{ x1 = x1 + kWidth; }
			}
			else{
				rad = atan((double)(y2 - y1) / (double)(x2 - x1));
				if(x1 < x2){ v = 1; } else{ v = -1; }
				x1 = x1 - kWidth * cos(rad) * v;
				y1 = y1 - kWidth * sin(rad) * v;
			}
		}
		
		if(a1 % 10 == 3){
			if(x1 == x2){
				if(y1 < y2){
					 y1 = y1 - kWidth * kKakato;
				}
			else{
				 y1 = y1 + kWidth * kKakato;
			}
		}
		else if(y1 == y2){
			if(x1 < x2){
				x1 = x1 - kWidth * kKakato;
			}
			else{
				x1 = x1 + kWidth * kKakato;
			}
		}
		else{
			rad = atan((double)(y2 - y1) / (double)(x2 - x1));
			if(x1 < x2){ v = 1; } else{ v = -1; }
			x1 = x1 - kWidth * cos(rad) * v * kKakato;
			y1 = y1 - kWidth * sin(rad) * v * kKakato;
			}
		}
		if(a2 % 10 == 2){
			if(x2 == x3){
				if(y2 < y3){ y3 = y3 + kWidth; } else{ y3 = y3 - kWidth; }
			}
			else if(y2 == y3){
				if(x2 < x3){ x3 = x3 + kWidth; } else{ x3 = x3 - kWidth; }
			}
			else{
				rad = atan((double)(y3 - y2) / (double)(x3 - x2));
				if(x2 < x3){ v = 1; } else{ v = -1; }
				x3 = x3 + kWidth * cos(rad) * v;
				y3 = y3 + kWidth * sin(rad) * v;
			}
		}
		
		if(a2 % 10 == 3){
			if(x2 == x3){
				if(y2 < y3){
					y3 = y3 + kWidth * kKakato;
				}
				else{
					y3 = y3 - kWidth * kKakato;
				}
			}
			else if(y2 == y3){
				if(x2 < x3){
					x3 = x3 + kWidth * kKakato;
				}
				else{
					x3 = x3 - kWidth * kKakato;
				}
			}
			else{
				rad = atan((double)(y3 - y2) / (double)(x3 - x2));
				if(x2 < x3){ v = 1; } else{ v = -1; }
				x3 = x3 + kWidth * cos(rad) * v * kKakato;
				y3 = y3 + kWidth * sin(rad) * v * kKakato;
			}
		}
		
		count = 0;
		
		for(tt = 0; tt <= 1000; tt = tt + kRate){
			t = (double)tt / 1000;
			
			//calculating each point
			x = ((1.0 - t) * (1.0 - t) * x1 + 2.0 * t * (1.0 - t) * x2 + t * t * x3);
			y = ((1.0 - t) * (1.0 - t) * y1 + 2.0 * t * (1.0 - t) * y2 + t * t * y3);
			
			//SESSEN NO KATAMUKI NO KEISAN(BIBUN)
			ix = (x1 - 2.0 * x2 + x3) * 2.0 * t + (-2.0 * x1 + 2.0 * x2);
			iy = (y1 - 2.0 * y2 + y3) * 2.0 * t + (-2.0 * y1 + 2.0 * y2);
			
			//SESSEN NI SUICHOKU NA CHOKUSEN NO KEISAN
			if(kShotai == kMincho){ //always false ?
				if(ix != 0 && iy != 0){
					ir = atan(iy / ix * -1.0);
	 				ia = sin(ir) * (double)kMinWidthT;
					ib = cos(ir) * (double)kMinWidthT;
				}
				else if(ix == 0){
					ia = kMinWidthT;
					ib = 0;
				}
				else{
					ia = 0;
					ib = kMinWidthT;
				}
				ia = ia * sqrt(1.0 - t);
				ib = ib * sqrt(1.0 - t);
			}
			else{
				if(ix != 0 && iy != 0){
					ir = atan(iy / ix * -1.0);
					ia = sin(ir) * (double)kWidth;
					ib = cos(ir) * (double)kWidth;
				}
				else if(ix == 0){
					ia = kWidth;
					ib = 0;
				}
				else{
					ia = 0;
					ib = kWidth;
				}
			}

			//reverse if vector is going 2nd/3rd quadrants
			if(ix <= 0){
			  ia = ia * -1;
			  ib = ib * -1;
			}
		
			//save to polygon
			poly[count].X = x - ia;
			poly[count].Y = y - ib;
			poly[(1000 / kRate + 1) * 2 - 1 - count].X = x + ia;
			poly[(1000 / kRate + 1) * 2 - 1 - count].Y = y + ib;
			count += 1;
		}
		
		icPolygon(poly, (1000 / kRate + 1) * 2);
	}
}

void cdDrawLine(double tx1, double ty1, double tx2, double ty2, int ta1, int ta2){
  double rad;
  double v, x1, y1, x2, y2;
  int a1, a2;
  double XX, XY, YX, YY;
  int uroko;
	
	if(kShotai == kMincho){ //mincho
		x1 = tx1;
		y1 = ty1;
		x2 = tx2;
		y2 = ty2;
		a1 = ta1;
		a2 = ta2;
		
		if(x1 == x2){ //if TATE stroke, use y-axis
			switch(a1){
			case 0:
				poly[3].X = x1 - kMinWidthT;
				poly[3].Y = y1 - kMinWidthY / 2;
				poly[0].X = x1 + kMinWidthT;
				poly[0].Y = y1 + kMinWidthY / 2;
				break;
			case 1:
			case 6:
			case 22:
				poly[3].X = x1 - kMinWidthT;
				poly[3].Y = y1;
				poly[0].X = x1 + kMinWidthT;
				poly[0].Y = y1;
				break;
			case 12:
				poly[3].X = x1 - kMinWidthT;
				poly[3].Y = y1 - kMinWidthY - kMinWidthT;
				poly[0].X = x1 + kMinWidthT;
				poly[0].Y = y1 - kMinWidthY;
				break;
			case 32:
				poly[3].X = x1 - kMinWidthT;
				poly[3].Y = y1 - kMinWidthY;
				poly[0].X = x1 + kMinWidthT;
				poly[0].Y = y1 - kMinWidthY;
				break;
			}
			
			switch(a2){
			case 0:
				if(a1 == 6){ //KAGI's tail
					poly[2].X = x2 - kMinWidthT;
					poly[2].Y = y2;
					poly[1].X = x2 + kMinWidthT;
					poly[1].Y = y2;
				}
				else{
					poly[2].X = x2 - kMinWidthT;
					poly[2].Y = y2 + kMinWidthT / 2;
					poly[1].X = x2 + kMinWidthT;
					poly[1].Y = y2 - kMinWidthT / 2;
				}
				break;
			case 1:
				poly[2].X = x2 - kMinWidthT;
				poly[2].Y = y2;
				poly[1].X = x2 + kMinWidthT;
				poly[1].Y = y2;
				break;
			case 13:
				poly[2].X = x2 - kMinWidthT;
				poly[2].Y = y2 + kWidth * kKakato + kMinWidthT;
				poly[1].X = x2 + kMinWidthT;
				poly[1].Y = y2 + kWidth * kKakato;
				break;
			case 23:
				poly[2].X = x2 - kMinWidthT;
				poly[2].Y = y2 + kWidth * kKakato * 0.5 + kMinWidthT;
				poly[1].X = x2 + kMinWidthT;
				poly[1].Y = y2 + kWidth * kKakato * 0.5;
				break;
			case 32:
				poly[2].X = x2 - kMinWidthT;
				poly[2].Y = y2 + kMinWidthY;
				poly[1].X = x2 + kMinWidthT;
				poly[1].Y = y2 + kMinWidthY;
				break;
			}
			
			icPolygon(poly, 4);
			
			if(a1 == 22){ //box's right top corner
				poly3[0].X = x1 - kMinWidthT;
				poly3[0].Y = y1 - kMinWidthY;
				poly3[1].X = x1;
				poly3[1].Y = y1 - kMinWidthY - kWidth;
				poly3[2].X = x1 + kMinWidthT + kWidth;
				poly3[2].Y = y1 + kMinWidthY;
				poly3[3].X = x1 + kMinWidthT;
				poly3[3].Y = y1 + kMinWidthT;
				poly3[4].X = x1 - kMinWidthT;
				poly3[4].Y = y1;
				icPolygon(poly3, 5);
			}
			
			if(a1 == 0){ //beginning of the stroke
				poly2[0].X = x1 + kMinWidthT;
				poly2[0].Y = y1 + kMinWidthY * 0.5;
				poly2[1].X = x1 + kMinWidthT + kMinWidthT * 0.5;
				poly2[1].Y = y1 + kMinWidthY * 0.5 + kMinWidthY;
				poly2[2].X = x1 + kMinWidthT;
				poly2[2].Y = y1 + kMinWidthY * 0.5 + kMinWidthY * 2;
				icPolygon(poly2, 3);
			}
			
			if((a1 == 6 && a2 == 0) || a2 == 1){ //KAGI NO YOKO BOU NO SAIGO NO MARU
				poly3[4].X = x2 - kMinWidthT;
				poly3[4].Y = y2;
				poly3[3].X = x2 - kMinWidthT * 0.6;
				poly3[3].Y = y2 + kMinWidthT * 0.6;
				poly3[2].X = x2;
				poly3[2].Y = y2 + kMinWidthT;
				poly3[1].X = x2 + kMinWidthT * 0.6;
				poly3[1].Y = y2 + kMinWidthT * 0.6;
				poly3[0].X = x2 + kMinWidthT;
				poly3[0].Y = y2;
				icPolygon(poly3, 5);
			}
		}
		else if(y1 == y2){ //if it is YOKO stroke, use x-axis
			if(a1 == 6){ //if it is KAGI's YOKO stroke, get bold
				poly[0].X = x1;
				poly[0].Y = y1 - kMinWidthT;
				poly[1].X = x2;
				poly[1].Y = y2 - kMinWidthT;
				poly[2].X = x2;
				poly[2].Y = y2 + kMinWidthT;
				poly[3].X = x1;
				poly[3].Y = y1 + kMinWidthT;
				icPolygon(poly, 4);
				
				if(a2 == 1 || a2 == 0 || a2 == 5){
					//KAGI NO YOKO BOU NO SAIGO NO MARU
					poly3[0].X = x2;
					poly3[0].Y = y2 - kMinWidthT;
					poly3[1].X = x2 + kMinWidthT * 0.6;
					poly3[1].Y = y2 - kMinWidthT * 0.6;
					poly3[2].X = x2 + kMinWidthT;
					poly3[2].Y = y2;
					poly3[3].X = x2 + kMinWidthT * 0.6;
					poly3[3].Y = y2 + kMinWidthT * 0.6;
					poly3[4].X = x2;
					poly3[4].Y = y2 + kMinWidthT;
					icPolygon(poly3, 5);
				}
				
				if(a2 == 5){
					//KAGI NO YOKO BOU NO HANE
					poly[0].X = x2;
					poly[0].Y = y2 - kMinWidthT + 1;
					poly[1].X = x2 + 2;
					poly[1].Y = y2 - kMinWidthT - kWidth * 5;
					poly[2].X = x2;
					poly[2].Y = y2 - kMinWidthT - kWidth * 5;
					poly[3].X = x2 - kMinWidthT;
					poly[3].Y = y2 - kMinWidthT + 1;
					icPolygon(poly, 4);
				}
			}
			else{
				switch(a1){
				case 0:
					poly[0].X = x1;
					poly[0].Y = y1 - kMinWidthY;
					poly[3].X = x1;
					poly[3].Y = y1 + kMinWidthY;
					break;
				case 2:
					poly[0].X = x1 - kMinWidthT;
					poly[0].Y = y1 - kMinWidthY;
					poly[3].X = x1 - kMinWidthT;
					poly[3].Y = y1 + kMinWidthY;
					break;
				}
				
				switch(a2){
				case 0:
					poly[1].X = x2;
					poly[1].Y = y2 - kMinWidthY;
					poly[2].X = x2;
					poly[2].Y = y2 + kMinWidthY;
					break;
				case 2:
					poly[1].X = x2 + kMinWidthT;
					poly[1].Y = y2 - kMinWidthY;
					poly[2].X = x2 + kMinWidthT;
					poly[2].Y = y2 + kMinWidthY;
				}
				
				icPolygon(poly, 4);
				
				//UROKO
				if(a2 == 0){
                                  uroko = kUroko;
                                  if((x2 - x1 - kWidth) < uroko){
                                    uroko = max((x2 - x1 - kWidth), 4);
                                  }
                                  poly2[0].X = x2;
                                  poly2[0].Y = y2 - kMinWidthY;
                                  poly2[1].X = x2 - uroko;
                                  poly2[1].Y = y2;
                                  poly2[2].X = x2 - uroko / 2;
                                  poly2[2].Y = y2 - uroko / 2;
                                  icPolygon(poly2, 3);
				}
			}
		}
		else{ //for others, use x-axis
			rad = atan((double)(y2 - y1) / (double)(x2 - x1));
			if((abs(y2 - y1) < abs(x2 - x1)) && (a1 != 6) && (a2 != 6) && !(a1 == 22 && a2 == 0)){ //ASAI KAUDO
				switch(a1){ //must be 0 or 2
				case 0:
					poly[0].X = x1 + sin(rad) * kMinWidthY;
					poly[0].Y = y1 - cos(rad) * kMinWidthY;
					poly[3].X = x1 - sin(rad) * kMinWidthY;
					poly[3].Y = y1 + cos(rad) * kMinWidthY;
					break;
				case 2:
					poly[0].X = x1 + sin(rad) * kMinWidthY - kMinWidthT * cos(rad);
					poly[0].Y = y1 - cos(rad) * kMinWidthY - kMinWidthT * sin(rad);
					poly[3].X = x1 - sin(rad) * kMinWidthY - kMinWidthT * cos(rad);
					poly[3].Y = y1 + cos(rad) * kMinWidthY - kMinWidthT * sin(rad);
					break;
				}
				
				switch(a2){ //must be 0 or 2
				case 0:
					poly[1].X = x2 + sin(rad) * kMinWidthY;
					poly[1].Y = y2 - cos(rad) * kMinWidthY;
					poly[2].X = x2 - sin(rad) * kMinWidthY;
					poly[2].Y = y2 + cos(rad) * kMinWidthY;
					break;
				case 2:
					poly[1].X = x2 + sin(rad) * kMinWidthY + kMinWidthT * cos(rad);
					poly[1].Y = y2 - cos(rad) * kMinWidthY + kMinWidthT * sin(rad);
					poly[2].X = x2 - sin(rad) * kMinWidthY + kMinWidthT * cos(rad);
					poly[2].Y = y2 + cos(rad) * kMinWidthY + kMinWidthT * sin(rad);
				}
				
				icPolygon(poly, 4);
				
				//UROKO
				if(a2 == 0){
                                  uroko = kUroko;
                                  if((x2 - x1 - kWidth * cos(rad)) < uroko * cos(rad)){
                                    uroko = max(((x2 - x1) / cos(rad) - kWidth), 4);
                                  }
					poly2[0].X = x2 + sin(rad) * kMinWidthY;
					poly2[0].Y = y2 - cos(rad) * kMinWidthY;
					poly2[1].X = x2 - cos(rad) * uroko;
					poly2[1].Y = y2 - sin(rad) * uroko;
					poly2[2].X = x2 - cos(rad) * uroko / 2 + sin(rad) * uroko / 2;
					poly2[2].Y = y2 - sin(rad) * uroko / 2 - cos(rad) * uroko / 2;
					icPolygon(poly2, 3);
				}
			}
			
			else{ //KAKUDO GA FUKAI or KAGI NO YOKO BOU
				if(x1 > x2){ v = -1; } else{ v = 1; }
				switch(a1){
				case 0:
					poly[0].X = x1 + sin(rad) * kMinWidthT * v + kMinWidthY * cos(rad) * 0.5 * v;
					poly[0].Y = y1 - cos(rad) * kMinWidthT * v + kMinWidthY * sin(rad) * 0.5 * v;
					poly[3].X = x1 - sin(rad) * kMinWidthT * v - kMinWidthY * cos(rad) * 0.5 * v;
					poly[3].Y = y1 + cos(rad) * kMinWidthT * v - kMinWidthY * sin(rad) * 0.5 * v;
					break;
				case 1:
				case 6:
				case 22:
					poly[0].X = x1 + sin(rad) * kMinWidthT * v;
					poly[0].Y = y1 - cos(rad) * kMinWidthT * v;
					poly[3].X = x1 - sin(rad) * kMinWidthT * v;
					poly[3].Y = y1 + cos(rad) * kMinWidthT * v;
					break;
				case 12:
					poly[0].X = x1 + sin(rad) * kMinWidthT * v - kMinWidthY * cos(rad) * v;
					poly[0].Y = y1 - cos(rad) * kMinWidthT * v - kMinWidthY * sin(rad) * v;
					poly[3].X = x1 - sin(rad) * kMinWidthT * v - (kMinWidthT + kMinWidthY) * cos(rad) * v;
					poly[3].Y = y1 + cos(rad) * kMinWidthT * v - (kMinWidthT + kMinWidthY) * sin(rad) * v;
					break;
				case 32:
					poly[0].X = x1 + sin(rad) * kMinWidthT * v - kMinWidthY * cos(rad) * v;
					poly[0].Y = y1 - cos(rad) * kMinWidthT * v - kMinWidthY * sin(rad) * v;
					poly[3].X = x1 - sin(rad) * kMinWidthT * v - kMinWidthY * cos(rad) * v;
					poly[3].Y = y1 + cos(rad) * kMinWidthT * v - kMinWidthY * sin(rad) * v;
					break;
				}
				
				switch(a2){
				case 0:
					if(a1 == 6){
						poly[1].X = x2 + sin(rad) * kMinWidthT * v;
						poly[1].Y = y2 - cos(rad) * kMinWidthT * v;
						poly[2].X = x2 - sin(rad) * kMinWidthT * v;
						poly[2].Y = y2 + cos(rad) * kMinWidthT * v;
					}
					else{
						poly[1].X = x2 + sin(rad) * kMinWidthT * v - kMinWidthT * 0.5 * cos(rad) * v;
						poly[1].Y = y2 - cos(rad) * kMinWidthT * v - kMinWidthT * 0.5 * sin(rad) * v;
						poly[2].X = x2 - sin(rad) * kMinWidthT * v + kMinWidthT * 0.5 * cos(rad) * v;
						poly[2].Y = y2 + cos(rad) * kMinWidthT * v + kMinWidthT * 0.5 * sin(rad) * v;
					}
					break;
				case 1:
				case 5:
					poly[1].X = x2 + sin(rad) * kMinWidthT * v;
					poly[1].Y = y2 - cos(rad) * kMinWidthT * v;
					poly[2].X = x2 - sin(rad) * kMinWidthT * v;
					poly[2].Y = y2 + cos(rad) * kMinWidthT * v;
					break;
				case 13:
					poly[1].X = x2 + sin(rad) * kMinWidthT * v + kWidth * kKakato * cos(rad) * v;
					poly[1].Y = y2 - cos(rad) * kMinWidthT * v + kWidth * kKakato * sin(rad) * v;
					poly[2].X = x2 - sin(rad) * kMinWidthT * v + (kWidth * kKakato + kMinWidthT) * cos(rad) * v;
					poly[2].Y = y2 + cos(rad) * kMinWidthT * v + (kWidth * kKakato + kMinWidthT) * sin(rad) * v;
					break;
				case 23:
					poly[1].X = x2 + sin(rad) * kMinWidthT * v + kWidth * kKakato * 0.5 * cos(rad) * v;
					poly[1].Y = y2 - cos(rad) * kMinWidthT * v + kWidth * kKakato * 0.5 * sin(rad) * v;
					poly[2].X = x2 - sin(rad) * kMinWidthT * v + (kWidth * kKakato * 0.5 + kMinWidthT) * cos(rad) * v;
					poly[2].Y = y2 + cos(rad) * kMinWidthT * v + (kWidth * kKakato * 0.5 + kMinWidthT) * sin(rad) * v;
					break;
				case 32:
					poly[1].X = x2 + sin(rad) * kMinWidthT * v + kMinWidthY * cos(rad) * v;
					poly[1].Y = y2 - cos(rad) * kMinWidthT * v + kMinWidthY * sin(rad) * v;
					poly[2].X = x2 - sin(rad) * kMinWidthT * v + kMinWidthY * cos(rad) * v;
					poly[2].Y = y2 + cos(rad) * kMinWidthT * v + kMinWidthY * sin(rad) * v;
					break;
				}
				
				icPolygon(poly, 4);
				
				if((a1 == 6) && (a2 == 0 || a2 == 5)){ //KAGI NO YOKO BOU NO SAIGO NO MARU
					poly3[0].X = x2 + sin(rad) * kMinWidthT * v;
					poly3[0].Y = y2 - cos(rad) * kMinWidthT * v;
					poly3[1].X = x2 + cos(rad) * kMinWidthT * 0.8 * v + sin(rad) * kMinWidthT * 0.6 * v;
					poly3[1].Y = y2 + sin(rad) * kMinWidthT * 0.8 * v - cos(rad) * kMinWidthT * 0.6 * v;
					poly3[2].X = x2 + cos(rad) * kMinWidthT * v;
					poly3[2].Y = y2 + sin(rad) * kMinWidthT * v;
					poly3[3].X = x2 + cos(rad) * kMinWidthT * 0.8 * v - sin(rad) * kMinWidthT * 0.6 * v;
					poly3[3].Y = y2 + sin(rad) * kMinWidthT * 0.8 * v + cos(rad) * kMinWidthT * 0.6 * v;
					poly3[4].X = x2 - sin(rad) * kMinWidthT * v;
					poly3[4].Y = y2 + cos(rad) * kMinWidthT * v;
					icPolygon(poly3, 5);
				}
				
				if(a1 == 6 && a2 == 5){
					//KAGI NO YOKO BOU NO HANE
					poly[0].X = x2 + (kMinWidthT - 1) * sin(rad) * v;
					poly[0].Y = y2 - (kMinWidthT - 1) * cos(rad) * v;
					poly[1].X = x2 + 2 * cos(rad) * v + (kMinWidthT + kWidth * 5) * sin(rad) * v;
					poly[1].Y = y2 + 2 * sin(rad) * v - (kMinWidthT + kWidth * 5) * cos(rad) * v;
					poly[2].X = x2 + (kMinWidthT + kWidth * 5) * sin(rad) * v;
					poly[2].Y = y2 - (kMinWidthT + kWidth * 5) * cos(rad) * v;
					poly[3].X = x2 + (kMinWidthT - 1) * sin(rad) * v - kMinWidthT * cos(rad) * v;
					poly[3].Y = y2 - (kMinWidthT - 1) * cos(rad) * v - kMinWidthT * sin(rad) * v;
					icPolygon(poly, 4);
				}
				
				if(a1 == 22){ //SHIKAKU MIGIUE UROKO NANAME DEMO MASSUGU MUKI
					poly3[0].X = x1 - kMinWidthT;
					poly3[0].Y = y1 - kMinWidthY;
					poly3[1].X = x1;
					poly3[1].Y = y1 - kMinWidthY - kWidth;
					poly3[2].X = x1 + kMinWidthT + kWidth;
					poly3[2].Y = y1 + kMinWidthY;
					poly3[3].X = x1 + kMinWidthT;
					poly3[3].Y = y1 + kMinWidthT;
					poly3[4].X = x1 - kMinWidthT;
					poly3[4].Y = y1;
					icPolygon(poly3, 5);
				}
				
				XX = sin(rad) * v;
				XY = cos(rad) * v * -1;
				YX = cos(rad) * v;
				YY = sin(rad) * v;
				
				if(a1 == 0){ //beginning of the storke
					poly2[0].X = x1 + kMinWidthT * XX + (kMinWidthY * 0.5) * YX;
					poly2[0].Y = y1 + kMinWidthT * XY + (kMinWidthY * 0.5) * YY;
					poly2[1].X = x1 + (kMinWidthT + kMinWidthT * 0.5) * XX + (kMinWidthY * 0.5 + kMinWidthY) * YX;
					poly2[1].Y = y1 + (kMinWidthT + kMinWidthT * 0.5) * XY + (kMinWidthY * 0.5 + kMinWidthY) * YY;
					poly2[2].X = x1 + kMinWidthT * XX + (kMinWidthY * 0.5 + kMinWidthY * 2) * YX;
					poly2[2].Y = y1 + kMinWidthT * XY + (kMinWidthY * 0.5 + kMinWidthY * 2) * YY;
					icPolygon(poly2, 3);
				}
			}
		}
	}
	else{ //gothic
		if(tx1 == tx2){ //if TATE stroke, use y-axis
			if(ty1 > ty2){
				x1 = tx2;
				y1 = ty2;
				x2 = tx1;
				y2 = ty1;
				a1 = ta2;
				a2 = ta1;
			}
			else{
				x1 = tx1;
				y1 = ty1;
				x2 = tx2;
				y2 = ty2;
				a1 = ta1;
				a2 = ta2;
			}
			
			if(a1 % 10 == 2){ y1 = y1 - kWidth; }
			if(a2 % 10 == 2){ y2 = y2 + kWidth; }
			if(a1 % 10 == 3){ y1 = y1 - kWidth * kKakato; }
			if(a2 % 10 == 3){ y2 = y2 + kWidth * kKakato; }
			
			poly[3].X = x1 - kWidth;
			poly[3].Y = y1;
			poly[2].X = x2 - kWidth;
			poly[2].Y = y2;
			poly[1].X = x2 + kWidth;
			poly[1].Y = y2;
			poly[0].X = x1 + kWidth;
			poly[0].Y = y1;
			
			icPolygon(poly, 4);
		}
		else if(ty1 == ty2){ //if YOKO stroke, use x-axis
			if(tx1 > tx2){
				x1 = tx2;
				y1 = ty2;
				x2 = tx1;
				y2 = ty1;
				a1 = ta2;
				a2 = ta1;
			}
			else{
				x1 = tx1;
				y1 = ty1;
				x2 = tx2;
				y2 = ty2;
				a1 = ta1;
				a2 = ta2;
			}
			if(a1 % 10 == 2){ x1 = x1 - kWidth; }
			if(a2 % 10 == 2){ x2 = x2 + kWidth; }
			if(a1 % 10 == 3){ x1 = x1 - kWidth * kKakato; }
			if(a2 % 10 == 3){ x2 = x2 + kWidth * kKakato; }
			
			poly[0].X = x1;
			poly[0].Y = y1 - kWidth;
			poly[1].X = x2;
			poly[1].Y = y2 - kWidth;
			poly[2].X = x2;
			poly[2].Y = y2 + kWidth;
			poly[3].X = x1;
			poly[3].Y = y1 + kWidth;
			
			icPolygon(poly, 4);
		}
		else{ //for others, use x-axis
			if(tx1 > tx2){
				x1 = tx2;
				y1 = ty2;
				x2 = tx1;
				y2 = ty1;
				a1 = ta2;
				a2 = ta1;
			}
			else{
				x1 = tx1;
				y1 = ty1;
				x2 = tx2;
				y2 = ty2;
				a1 = ta1;
				a2 = ta2;
			}
			rad = atan((double)(y2 - y1) / (double)(x2 - x1));
			if(a1 % 10 == 2){
				x1 = x1 - kWidth * cos(rad);
				y1 = y1 - kWidth * sin(rad);
			}
			if(a2 % 10 == 2){
				x2 = x2 + kWidth * cos(rad);
				y2 = y2 + kWidth * sin(rad);
			}
			if(a1 % 10 == 3){
				x1 = x1 - kWidth * cos(rad) * kKakato;
				y1 = y1 - kWidth * sin(rad) * kKakato;
			}
			if(a2 % 10 == 3){
				x2 = x2 + kWidth * cos(rad) * kKakato;
				y2 = y2 + kWidth * sin(rad) * kKakato;
			}
			
			//SUICHOKU NO ICHI ZURASHI HA sin TO cos NO IREKAE + x-axis MAINASU KA
			poly[0].X = x1 + sin(rad) * kWidth;
			poly[0].Y = y1 - cos(rad) * kWidth;
			poly[1].X = x2 + sin(rad) * kWidth;
			poly[1].Y = y2 - cos(rad) * kWidth;
			poly[2].X = x2 - sin(rad) * kWidth;
			poly[2].Y = y2 + cos(rad) * kWidth;
			poly[3].X = x1 - sin(rad) * kWidth;
			poly[3].Y = y1 + cos(rad) * kWidth;
			
			icPolygon(poly, 4);
		}
	}
}
