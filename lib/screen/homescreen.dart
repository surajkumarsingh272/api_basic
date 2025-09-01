import 'package:api_first_basic/provider/productprovider.dart';
import 'package:api_first_basic/screen/add_product_screen.dart';
import 'package:api_first_basic/screen/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage",style: TextStyle(fontSize: 20,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<ProductProvider>(builder: (context, value, child) {
        if(value.productList.isEmpty){
          return Center(child: CircularProgressIndicator(),);
        }
        else{
          return ListView.builder(
            itemCount: value.productList.length,
            itemBuilder: (context, index) {
              var product=value.productList[index];
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: Image.network(product.image ?? "", width: 60, height: 60, fit: BoxFit.cover),
                 title: Text("${product.title}"),
                 subtitle: Text("${product.description}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProductScreen(data: product),));
                    }, icon: Icon(Icons.edit,color: Colors.green,)),

                    IconButton(onPressed: () {
                      value.deleteProduct(context, product.id??0);
                    }, icon: Icon(Icons.delete,color: Colors.red,)),

                  ],
                ),
              ),
            );
          },);
        }
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(),),);
      },backgroundColor: Colors.green,child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}
