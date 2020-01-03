import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 195;
num circle_x = flag_w / 4;
num circle_y = flag_h / 4;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  querySelector("#usa").onClick.listen((e) => drawUSA(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
}

void drawUSA(ctx){
  // 白底
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  
  //紅色條紋
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h / 13);
  
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 30, flag_w, flag_h / 13);
    
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 60, flag_w, flag_h / 13);
  
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 90, flag_w, flag_h / 13);
  
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 120, flag_w, flag_h / 13);
  
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 150, flag_w, flag_h / 13);
  
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 180, flag_w, flag_h / 13);
  
  //畫藍色部分
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flag_w / 2, 105);


}


void clearCanvas(){
  ctx.clearRect(0, 0, flag_w, flag_h);
}
