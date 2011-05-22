//kagecgi.c
//

#include "kage.h"
#include "kagecgi.h"
#include "sysdep.h"

int main(int argc, char *argv[]){
  KGString *tmp1, *tmp2, *test1, *test2, *filename;
  FILE *err;
  char errbuf[errorFileSize];
  char *pos, *cur;
  int dummy;
  int type;
  
  dummy = initDB();
  
  //set default
  kShotai = kMincho;
  //kShotai = kGothic;
  kSize = 200;
  kType = 0; //png
  kInput = 0; //ids or direct
  kResultText = kg_string_new("");
  kMode = 0;
  
  //confirm request
  type = 0;
  //GET request
  if(type == 0){
    tmp1 = kg_string_new((kgchar *)getenv("QUERY_STRING"));
    if(tmp1->len != 0) type = 2;
  }
  //argv(detect after GET request)
  if(type == 0){
    tmp1 = kg_string_new((kgchar *)argv[1]);
    if(tmp1->len != 0) type = 1;
  }
  //redirect
  if(type == 0){
    tmp1 = kg_string_new((kgchar *)getenv("REDIRECT_URL"));
    if(tmp1->len != 0) type = 3;
  }
  //error
  if(type == 0){
    fprintf(stderr, "Request Error.\n");
    return 0;
  }
  pos = tmp1->str;
  
  //separate token
  if(type == 1 || type == 2){ //argv or GET request
    while(1){
      cur = strchr(pos, '&');
      tmp2 = kg_string_new(pos);
      if(cur != NULL) kg_string_set_size(tmp2, cur - pos);
      //got request string
      if(strncmp(tmp2->str, "shotai=mincho", 13) == 0) kShotai = kMincho;
      else if(strncmp(tmp2->str, "shotai=gothic", 13) == 0) kShotai = kGothic;
      else if(strncmp(tmp2->str, "shotai=skeleton", 15) == 0) kShotai = kGothic;
      else if(strncmp(tmp2->str, "type=png", 8) == 0) kType = 0;
      else if(strncmp(tmp2->str, "type=svg", 8) == 0) kType = 1;
      else if(strncmp(tmp2->str, "type=eps", 8) == 0) kType = 2;
      else if(strncmp(tmp2->str, "type=raw", 8) == 0) kType = 3;
      else if(strncmp(tmp2->str, "input=ids", 9) == 0) kInput = 0;
      else if(strncmp(tmp2->str, "input=directwithadjust", 22) == 0) kInput = 2;
      else if(strncmp(tmp2->str, "input=direct", 12) == 0) kInput = 1;
      else if(strncmp(tmp2->str, "size=24", 7) == 0) kSize = 24;
      else if(strncmp(tmp2->str, "size=200", 8) == 0) kSize = 200;
      else test1 = kg_string_new(tmp2->str);
      if(cur == NULL) break;
      pos = cur + 1;
    }
  }
  else{ // redirected request
    kInput = 0;
    while(1){
      cur = strchr(pos, '/');
      tmp2 = kg_string_new(pos);
      if(cur != NULL) kg_string_set_size(tmp2, cur - pos);
      //got request string
      if(strncmp(tmp2->str, "mincho", 6) == 0) kShotai = kMincho;
      else if(strncmp(tmp2->str, "gothic", 6) == 0) kShotai = kGothic;
      else if(strncmp(tmp2->str, "skeleton", 8) == 0) kShotai = kGothic;
      else if(strncmp(tmp2->str, "v0.4", 4) == 0);
      else test1 = kg_string_new(tmp2->str);
      if(cur == NULL) break;
      pos = cur + 1;
    }
    if(strncmp(test1->str + test1->len - 4, ".png", 4) == 0) kType = 0;
    if(strncmp(test1->str + test1->len - 4, ".svg", 4) == 0) kType = 1;
    if(strncmp(test1->str + test1->len - 4, ".eps", 4) == 0) kType = 2;
    if(strncmp(test1->str + test1->len - 4, ".raw", 4) == 0) kType = 3;
    kg_string_set_size(test1, test1->len - 4);
  }
  
  //clear result buffer
  test2 = kg_string_new("");
  if(kType == 1){ //svg
    kg_string_append(kResultText, "<?xml version=\"1.0\"?>\n");
    kg_string_append(kResultText, "<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.0//EN\" \"http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd\">\n");
    kg_string_append(kResultText, "<svg width=\"1024\" height=\"1024\" viewBox=\"0 0 1024 1024\">");
    kg_string_append(kResultText, "<g style=\"fill: black; stroke: black\">");
  }
  else if(kType == 2){ //eps
    kg_string_append(kResultText, "%!PS-Adobe-3.0 EPSF-3.0\n");
    kg_string_append(kResultText, "%%BoundingBox: 0 -208 1024 816\n");
    kg_string_append(kResultText, "%%Pages: 0\n");
    kg_string_append(kResultText, "%%Title: ");
    kg_string_append(kResultText, test1->str);
    kg_string_append(kResultText, "\n");
    kg_string_append(kResultText, "%%Creator: KAGE System\n");
    kg_string_append(kResultText, "%%CreationDate: 00:00 1-1-2004\n");
    kg_string_append(kResultText, "%%EndComments\n");
    kg_string_append(kResultText, "%%EndProlog\n");
    kg_string_append(kResultText, "%%Page \"");
    kg_string_append(kResultText, test1->str);
    kg_string_append(kResultText, "\" 1\n");
    kg_string_append(kResultText, "newpath\n");
  }
  kageCanvas = initPng(canvasWidth, canvasHeight);
  if(kInput == 0) generateGlyph(test1, test2);
  else{
    convert99(test1, test2);
    //	  kg_string_append(test2, test1->str);
  }
  
  if(test2->len != 0) test2 = finalAdjustment(test2);
  
  if(kType == 0){ //png(image)
    if(test2->len != 0){
      if(kInput != 1){ //0 and 2
	test2 = CalcSizes(test2, 1);
      }
      DrawBox();
      drawGlyph(test2, DRAW_GLYPH_MODE_NORMAL);
      //output to file
      filename = kg_string_new(pngFilePath);
      if(kShotai == kMincho) kg_string_append(filename, "mincho/");
      else if(kShotai == kGothic) kg_string_append(filename, "gothic/");//skeleton??
      kg_string_append(filename, test1->str);
      kg_string_append(filename, ".png");
      
      //skip for adjustment mode
      //fp = fopen(filename->str, "w");
      //writePng(pngWidth, pngHeight, kageCanvas, fp);
      //fclose(fp);
      //output to stdout
      if(type != 1) fprintf(stdout, "Content-type: image/png\n\n");
      writePng(pngWidth, pngHeight, kageCanvas, stdout);
      //done
      closePng(pngWidth, pngHeight, kageCanvas);
    }
    else{
      err = fopen(errorFileName, "r");
      fread(errbuf, sizeof(char), errorFileSize, err);
      //printf("An error occurred.\r\n");
      if(type != 1) fprintf(stdout, "Content-type: image/png\n\n");
      fwrite(errbuf, sizeof(char), errorFileSize, stdout);
      fclose(err);
    }
  }
  else if(kType == 1){ //svg(vector graphics)
    if(test2->len != 0){
      test2 = CalcSizes(test2, 1);
      kMode = 1;
      drawGlyph(test2, DRAW_GLYPH_MODE_NORMAL);
      kg_string_append(kResultText, "</g></svg>\n");
      if(type != 1) fprintf(stdout, "Content-type: image/svg-xml\n\n");
      fprintf(stdout, "%s", kResultText->str);
    }
    else{
      if(type != 1) fprintf(stdout, "Content-type: text/plain\n\n");
      fprintf(stdout, "An error occurred.");
    }
  }
  else if(kType == 2){ //eps(vector graphics)
    if(test2->len != 0){
      test2 = CalcSizes(test2, 1);
      kMode = 2;
      drawGlyph(test2, DRAW_GLYPH_MODE_NORMAL);
      kg_string_append(kResultText, "fill\n");
      kg_string_append(kResultText, "%%EOF\n");
      if(type != 1) fprintf(stdout, "Content-type: application/postscript\n\n");
      fprintf(stdout, "%s", kResultText->str);
    }
    else{
      if(type != 1) fprintf(stdout, "Content-type: text/plain\n\n");
      fprintf(stdout, "An error occurred.");
    }
  }
  else{ //raw(text)
    
    if(test2->len != 0){
      test2 = CalcSizes(test2, 1);
      if(type != 1) fprintf(stdout, "Content-type: text/plain\n\n");
      fprintf(stdout, "result=%s", test2->str);
    }
    else{
      if(type != 1) fprintf(stdout, "Content-type: text/plain\n\n");
      fprintf(stdout, "result=nodata");
    }
  }
  dummy = closeDB();
  
  return 0;
}

