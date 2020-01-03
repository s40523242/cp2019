import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 195;
num circle_x = flag_w / 4;
num circle_y = flag_h / 4;


 fivePointStar(x, y, r, solid, theta, color) {
  List outerPoints = [];
  List innerPoints = [];
  var degree = Math.pi / 180;
  var innerR = r * Math.cos(72 * degree) / Math.cos(36 * degree);
  print("準備畫一個位於 ($x, $y), 半徑 $r, 實心為 $solid, 顏色為 $color 的五芒星");
  ctx.beginPath();
  for (int i = 0; i <= 5; i++) {
    outerPoints.add([
      x + r * Math.sin(72 * degree * i + theta * degree),
      y - r * Math.cos(72 * degree * i + theta * degree)
    ]);
    innerPoints.add([
      x +
          innerR *
              Math.sin(72 * degree * i +
                  theta * degree -
                  36 * degree),
      y -
          innerR *
              Math.cos(72 * degree * i +
                  theta * degree -
                  36 * degree)
    ]);
  }
  print(outerPoints);
  ctx.moveTo(outerPoints[0][0], outerPoints[0][1]);
  for (int i = 1; i < 5; i++) {
    ctx.lineTo(innerPoints[i][0], innerPoints[i][1]);
    ctx.lineTo(outerPoints[i][0], outerPoints[i][1]);
    ctx.lineTo(innerPoints[i + 1][0], innerPoints[i + 1][1]);
  }
  ctx.closePath();
  if (solid == false) {
    ctx.strokeStyle = color;
    ctx.stroke();
  } else {
    ctx.fillStyle = color;
    ctx.fill();
  }
}


void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  drawCUBA(ctx);
  querySelector("#roc").onClick.listen((e) => drawROC(ctx));
  querySelector("#cuba").onClick.listen((e) => drawCUBA(ctx));
  querySelector("#china").onClick.listen((e) => drawCHINA(ctx));
  querySelector("#kna").onClick.listen((e) => drawKNA(ctx));
  querySelector("#usa").onClick.listen((e) => drawUSA(ctx));
  querySelector("#uk").onClick.listen((e) => drawUK(ctx));
  querySelector("#canada").onClick.listen((e) => drawCANADA(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
}

  drawStar(cx, cy, spikes, outerRadius, innerRadius) {
    var rot = Math.pi / 2 * 3;
    var x = cx;
    var y = cy;
    var step = Math.pi / spikes;

    ctx.fillStyle = '#fff';
    ctx.beginPath();
    ctx.moveTo(cx, cy - outerRadius);
    for (int i = 0; i < spikes; i++) {
        x = cx + Math.cos(rot) * outerRadius;
        y = cy + Math.sin(rot) * outerRadius;
        ctx.lineTo(x, y);
        rot += step;

        x = cx + Math.cos(rot) * innerRadius;
        y = cy + Math.sin(rot) * innerRadius;
        ctx.lineTo(x, y);
        rot += step;
    }
    ctx.lineTo(cx, cy - outerRadius);
    ctx.closePath();
    ctx.lineWidth=5;
    ctx.strokeStyle='white';
    ctx.stroke();
    ctx.fillStyle='white';
    ctx.fill();

}
  drawStarY(cx, cy, spikes, outerRadius, innerRadius) {
    var rot = Math.pi / 2 * 3;
    var x = cx;
    var y = cy;
    var step = Math.pi / spikes;

    ctx.fillStyle = '#rgb(260,180,0)';
    ctx.beginPath();
    ctx.moveTo(cx, cy - outerRadius);
    for (int i = 0; i < spikes; i++) {
        x = cx + Math.cos(rot) * outerRadius;
        y = cy + Math.sin(rot) * outerRadius;
        ctx.lineTo(x, y);
        rot += step;

        x = cx + Math.cos(rot) * innerRadius;
        y = cy + Math.sin(rot) * innerRadius;
        ctx.lineTo(x, y);
        rot += step;
    }
    ctx.lineTo(cx, cy - outerRadius);
    ctx.closePath();
    ctx.lineWidth=5;
    ctx.strokeStyle='yellow';
    ctx.stroke();
    ctx.fillStyle='yellow';
    ctx.fill();

}

  drawStarYT(cx, cy, spikes, outerRadius, innerRadius) {
    var rot = Math.pi / 8 *1 ;
    var x = cx;
    var y = cy;
    var step = Math.pi / spikes;

    ctx.fillStyle = '#rgb(260,180,0)';
    ctx.beginPath();
    ctx.moveTo(cx, cy - outerRadius);
    for (int i = 0; i < spikes; i++) {
        x = cx + Math.cos(rot) * outerRadius;
        y = cy + Math.sin(rot) * outerRadius;
        ctx.lineTo(x, y);
        rot += step;

        x = cx + Math.cos(rot) * innerRadius;
        y = cy + Math.sin(rot) * innerRadius;
        ctx.lineTo(x, y);
        rot += step;
    }
    ctx.lineTo(cx, cy - outerRadius);
    ctx.closePath();
    ctx.lineWidth=5;
    ctx.strokeStyle='yellow';
    ctx.stroke();
    ctx.fillStyle='yellow';
    ctx.fill();

}

 drawStarYT1(cx, cy, spikes, outerRadius, innerRadius) {
    var rot = Math.pi / 4 *1 ;
    var x = cx;
    var y = cy;
    var step = Math.pi / spikes;

    ctx.fillStyle = '#rgb(260,180,0)';
    ctx.beginPath();
    ctx.moveTo(cx, cy - outerRadius);
    for (int i = 0; i < spikes; i++) {
        x = cx + Math.cos(rot) * outerRadius;
        y = cy + Math.sin(rot) * outerRadius;
        ctx.lineTo(x, y);
        rot += step;

        x = cx + Math.cos(rot) * innerRadius;
        y = cy + Math.sin(rot) * innerRadius;
        ctx.lineTo(x, y);
        rot += step;
    }
    ctx.lineTo(cx, cy - outerRadius);
    ctx.closePath();
    ctx.lineWidth=5;
    ctx.strokeStyle='yellow';
    ctx.stroke();
    ctx.fillStyle='yellow';
    ctx.fill();

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
//星星
  num b = flag_h/18;
  ctx.font = "10px Arial";
  ctx.strokeStyle = 'rgb(255, 255, 255)';
  ctx.strokeText("✮      ✮      ✮      ✮      ✮      ✮", flag_w / 36,12);
  ctx.strokeText("✮      ✮      ✮      ✮      ✮", flag_w / 14, b*2);
  ctx.strokeText("✮      ✮      ✮      ✮      ✮      ✮", flag_w / 36, b*3);
  ctx.strokeText("✮      ✮      ✮      ✮      ✮", flag_w / 14, b*4);
  ctx.strokeText("✮      ✮      ✮      ✮      ✮      ✮", flag_w / 36, b*5);
  ctx.strokeText("✮      ✮      ✮      ✮      ✮", flag_w / 14, b*6);
  ctx.strokeText("✮      ✮      ✮      ✮      ✮      ✮", flag_w / 36, b*7);
   ctx.strokeText("✮      ✮      ✮      ✮      ✮", flag_w / 14, b*8);
   ctx.strokeText("✮      ✮      ✮      ✮      ✮      ✮", flag_w / 36, b*9);
}


}

void drawROC(ctx){
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

void drawCUBA(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(0, 0, 140)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0, 40, flag_w, flag_h/5);  
  ctx.fillRect(0, 120, flag_w, flag_h/5);  
  ctx.strokeStyle="rgb(255, 0, 0)";
  ctx.stroke();  
  ctx.moveTo(0,0);
  ctx.lineTo(140,100);
  ctx.lineTo(0,200);
  ctx.fillStyle="rgb(255, 0, 0)";
  ctx.fill();  
  drawStar(50, 100, 5, 20, 10);
  
}


void clearCanvas(){
  ctx.clearRect(0, 0, flag_w, flag_h);
}
