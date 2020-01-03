KGtoLB(num k){
return k*2.2046226;
}

LBtoKG(num l){
return l*0.4535923;
}

// 每一個 Dart 程式都必須從 main() 開始執行
main() {
  // 宣告 len 整數變數, 準備設為各字串的長度
  int len;
  // 宣告 var 變數 type, 準備設為各字串最後一個字元, 可能為 C 或 F
  var type;
  // 宣告 var 變數 number, 準備設為各字串中的數字
  var number;
  List temp = ["25K", "30L", "56L", "14K", "68L", "198K"];
  // 利用重複迴圈, 逐一讀出各筆資料
  for (var data in temp) {
    //print(i);
    //print(i[2]);
    // https://api.dartlang.org/stable/2.6.1/dart-core/String/length.html
    len = data.length;
    // 取得各筆資料的最後一個字元
    //print(data[len-1]);
    type = data[len-1];
    number = data.substring(0, len-1);
    number = int.parse(number);
    // https://api.dartlang.org/stable/2.6.1/dart-core/Object/runtimeType.html
    //print("目前 number 變數資料型別為: ${number.runtimeType}");
    
    if (type == "K"){
      //print("C: $type, $number");
      print(" $number 公斤 =  ${KGtoLB(number)} 磅");
    }else{
      //print("F: $type, $number");
      print(" $number 磅 =  ${LBtoKG(number)} 公斤");
    }
      
  } // for
} // main