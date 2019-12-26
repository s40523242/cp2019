import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 200;
num circle_x = flag_w / 4;
num circle_y = flag_h / 4;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');
  drawPoly(ctx);

  //drawROC(ctx);
  querySelector("#roc").onClick.listen((e) => drawROC(ctx));
  querySelector("#usa").onClick.listen((e) => drawUSA(ctx));
  querySelector("#poly").onClick.listen((e) => drawPoly(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
  
}

// Defines a path for any regular polygon with the specified number of sides and radius,
// centered on the provide x and y coordinates.
// optional parameters: startAngle and anticlockwise

polygon(ctx, x, y, radius, sides, startAngle, anticlockwise) {
  // 宣告 output 變數資料型別為 List 且起始值為空數列
  // https://api.dartlang.org/stable/2.7.0/dart-core/List-class.html
  // 因為所設定的 output 為 growable list, 因此必須利用 new List() 或 [] 給定起始值
  List output = [];
  if (sides < 3) return;
  var a = (Math.pi * 2) / sides;
  a = anticlockwise ? -a : a;
  // 儲存目前的繪圖狀態
  // https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/save
  ctx.save();
  // 以下開始進入新的繪圖座標系統
  // 平移至圓心
  ctx.translate(x, y);
  // 轉至 startAngle, 原始座標系 x 向右為正, y 向下為正, 因此 z 軸指向電腦螢幕為正
  ctx.rotate(startAngle);
  // 將畫筆移動到 x=radius, y=0 的位置
  ctx.moveTo(radius, 0);
  // 此時將繪圖起點座標數列存入 output 數列
  output.add([radius, 0]);
  for (var i = 1; i < sides; i++) {
    ctx.lineTo(radius * Math.cos(a * i), radius * Math.sin(a * i));
    output.add([radius * Math.cos(a * i), radius * Math.sin(a * i)]);
  }
  print(output);
  print("");
  ctx.closePath();
  ctx.restore();
}


drawPoly(ctx){
  ctx.beginPath();
  // 大五角形
  int bigR = 90;
  polygon(ctx, 150, 100, bigR, 5, -Math.pi / 2, false);
  // 中間小五角形
  // deg 用於將角度轉為徑度
  num deg = Math.pi/180;
  // 利用 Solvespace 繪圖輔助計算中間五邊形的各點位置
  int smallR = (bigR * Math.cos(72*deg) / Math.cos(36*deg)).toInt();
  polygon(ctx, 150, 100, smallR, 5, Math.pi / 2, false);
  //ctx.fillStyle = "rgba(227,11,93,0.75)";
  //ctx.fill();
  ctx.strokeStyle = 'rgb(255, 0, 0)';
  ctx.stroke();
}

void drawUSA(ctx) {
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

void drawROC(ctx) {
  // 先畫滿地紅
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  // 再畫青天
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flag_w / 2, flag_h / 2);
  // 畫十二道光芒白日
  ctx.beginPath();
  num star_radius = flag_w / 8;
  num angle = 0;
  for (int i = 0; i < 25; i++) {
    angle += 5 * Math.pi * 2 / 12;
    num toX = circle_x + Math.cos(angle) * star_radius;
    num toY = circle_y + Math.sin(angle) * star_radius;
    // 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
    if (i != 0)
      ctx.lineTo(toX, toY);
    else
      ctx.moveTo(toX, toY);
  }
  ctx.closePath();
  // 將填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 白日:藍圈
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w * 17 / 240, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為藍色
  ctx.fillStyle = 'rgb(0, 0, 149)';
  ctx.fill();
  // 白日:白心
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, flag_w / 16, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
}

void clearCanvas() {
  ctx.clearRect(0, 0, flag_w, flag_h);
}
