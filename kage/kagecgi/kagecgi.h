//kagecgi.h
//

#include "kage.h"
#include "sysdep.h"

#ifndef _KAGECGI_H_
#define _KAGECGI_H_

// define for localhost environment
#define errorFileSize 3992
#define errorFileName "error.png"
#define pngFilePath "/var/www/v0.4/"
#define partsdbFileName "/var/www/kagedb/partsdb"
#define idsdbFileName "/var/www/kagedb/idsdb"
#define aliasdbFileName "/var/www/kagedb/aliasdb"

#define kBaseline 188
#define pngWidth 200
#define pngHeight 200
#define canvasWidth 400
#define canvasHeight 400

#define min(x1,x2) (((x1) > (x2))? (x2):(x1))
#define max(x1,x2) (((x1) > (x2))? (x1):(x2))

DB *kPartsdbDatabase;
DB *kIdsdbDatabase;
DB *kAliasdbDatabase;

FILE *debug;

png_bytepp kageCanvas;

int kDesign;
int kSize;
int kType;
int kInput;
KGString *kResultText;
int kMode;

void generateGlyph(const KGString *in, KGString *out);
void searchPartsData(const KGString *in, KGString *out);
void searchAliasData(const KGString *in, KGString *out);
void searchCacheData(const KGString *in, KGString *out);
void doCombine(const KGString *in, KGString *out);
void drawGlyph(const KGString *in, const int mode);
KGString* finalAdjustment(const KGString *in);

int isIDS(const KGString *in);
void divideInto2(const KGString *in, KGString *partIDS1, KGString *partIDS3);
void divideInto3(const KGString *in, KGString *partIDS1, KGString *partIDS2, KGString *partIDS3);
void addStrokeWithTransform(const KGString *stroke, const int num, const int *tf, KGString *out, int mode);
void convertArray(int *buf, KGString *out, int size, int mode);
int * convertStroke(const char *in, int *a, int *size);
void convert99(const KGString *in, KGString *out);
void convert99calc(const char *in, KGString *out);

void DotsWidth(int *dlx, int *drx);
void DotsHeight(int *dly, int *dry);
void PartsWidth(const KGString *in, int *lx, int *rx);
void PartsHeight(const KGString *in, int *ly, int *ry);
KGString * CalcSizes(const KGString *in, int mode);
void DrawBox();
void CalcOptions(const KGString *in, int *mitsudo, int *flag, double *yoko, double *tate);
void DoDrawParts(const KGString *in, const int lx1, const double rf1, const int ly1, const double rfy1);
void DoDrawMixFont(const KGString *in1, const int lx1, const double rf1, const KGString *in2, const int lx2, const double rf2, const int ly1, const double rfy1, const int ly2, const double rfy2);

void combineYoko2(const KGString *parts1, const KGString *parts3, int *result);
void combineYoko3(const KGString *parts1, const KGString *parts2, const KGString *parts3, int *result);
void combineTate2(const KGString *parts1, const KGString *parts3, int *result);
void combineTate3(const KGString *parts1, const KGString *parts2, const KGString *parts3, int *result);
void combineHame2(KGString *parts1, KGString *parts3, int *result, int surround);
//void combineHame2(const KGString *parts1, const KGString *parts3, int *result, int surround);

int initDB();
int closeDB();
void searchPartsData(const KGString *in, KGString *out);
void searchAliasData(const KGString *in, KGString *out);

png_bytepp initPng(int width, int height);
int closePng(int width, int height, png_bytepp canvas);
int writePng(int width, int height, png_bytepp image, FILE *fp);

void fillPolygon(kPoint *p, int number, int col, unsigned char **image);

#endif
