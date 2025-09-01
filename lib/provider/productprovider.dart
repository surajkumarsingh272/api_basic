import 'package:api_first_basic/modal/productmodal.dart';
import 'package:api_first_basic/product_api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier{

   ProductProvider(){
     getProduct();
   }

   var titleController=TextEditingController();
   var priceController=TextEditingController();
   var desController=TextEditingController();
   var categoryController=TextEditingController();
   var imageController=TextEditingController();

  List<ProductModal> productList=[];

  getProduct()async{
    var products=await ProductApiHelper.getAllProductApiData();
    if(products!=null){
       productList.clear();
       productList.addAll(products);
       notifyListeners();
    }
  }

  addProduct(BuildContext context)async{
    var data={
      "title":titleController.text,
      "price":priceController.text,
      "description":desController.text,
      "image":imageController.text,
    };
    var response=await ProductApiHelper.postProductApiData(data);
    if(response!=null){
      // productList.add(response);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data add successfully")));
      // Navigator.pop(context);
      // notifyListeners();
      getProduct();
    }
  }

   updateProduct(BuildContext context,int id)async{
     var data={
       "id":id,
       "title":titleController.text,
       "price":priceController.text,
       "description":desController.text,
       "image":imageController.text,
     };
     var response=await ProductApiHelper.updateProductApiData(data);
     if(response!=null){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data Update successfully")));
       getProduct();
     }
   }

   deleteProduct(BuildContext context,int id)async{
     var response=await ProductApiHelper.deleteProductApiData(id);
     if(response != null){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data deleted successfully")));
       getProduct();
     }
   }

}
