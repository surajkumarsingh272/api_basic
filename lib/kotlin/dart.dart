// import 'dart:convert';
//
// void main() {
//   String jsonString = '{"id":1,"name":"Suraj"}';
//
//   var dartObject = jsonDecode(jsonString);
//
//   print(dartObject);
//   print(dartObject["name"]); // Suraj
// }

// import 'dart:convert';
//
// void main() {
//   String jsonStr = '{"id":1,"name":"Suraj"}';   // JSON string
//   var obj = jsonDecode(jsonStr);               // Dart object
//   print(obj["name"]); // Suraj
//
//   var backToJson = jsonEncode(obj);            // Dart object → JSON string
//   print(backToJson); // {"id":1,"name":"Suraj"}
// }

 void main(){
   var numbers = [1, 2, 3];
   var doubled = numbers.map((n) => n * 2).toList();

   print(doubled);
 }


 // suraj kumar singh