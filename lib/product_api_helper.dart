import 'dart:convert';
import 'package:api_first_basic/modal/productmodal.dart';
import 'package:http/http.dart' as http;

class ProductApiHelper{

  static Future<List<ProductModal>?> getAllProductApiData ()async{
     var response=await http.get(Uri.parse("https://fakestoreapi.com/products"));
     if(response.statusCode==200){
        var resBody=response.body;
        List<dynamic> jsonBody=jsonDecode(resBody);
        var convertToModal=jsonBody.map((e) => ProductModal.jsonModal(e),).toList();
        return convertToModal;
     }
     return null;
   }

   static Future<ProductModal?> postProductApiData(Map<String,dynamic> data)async{
     var response=await http.post(Uri.parse("https://fakestoreapi.com/products"),body: data);
     // print(response.body);
     if(response.statusCode==201){
     var body=response.body;
      dynamic jsonBody=jsonDecode(body);
      var convertToModal=ProductModal.jsonModal(jsonBody);
      return convertToModal;
     }
     return null;
   }



   static Future<ProductModal?> updateProductApiData(Map<String,dynamic> data)async{
      var response=await http.put(Uri.parse("https://fakestoreapi.com/products/${data["id"]}"),body: jsonEncode(data));
      if(response.statusCode==200){
        var body=response.body;
        dynamic jsonBody=jsonDecode(body);
        var convertToModal=ProductModal.jsonModal(jsonBody);
        return convertToModal;
      }
      return null;
   }

   static Future<String?> deleteProductApiData(int id)async{
       var response=await http.delete(Uri.parse("https://fakestoreapi.com/products/$id"));
       if(response.statusCode==200){
         return "success";
       }
       return null;
   }

}


