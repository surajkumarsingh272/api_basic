import 'package:api_first_basic/provider/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ProductProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Screen"),
        backgroundColor:Colors.blue,
      ),

      body: Column(
        children: [
          TextField(controller: provider.titleController,decoration: InputDecoration(hintText: "Enter Title",border: OutlineInputBorder()),),
          TextField(controller: provider.priceController,decoration: InputDecoration(hintText: "Enter price",border: OutlineInputBorder()),),
          TextField(controller: provider.desController,decoration: InputDecoration(hintText: "Enter description",border: OutlineInputBorder()),),
          TextField(controller: provider.categoryController,decoration: InputDecoration(hintText: "Enter category",border: OutlineInputBorder()),),
          TextField(controller: provider.imageController,decoration: InputDecoration(hintText: "Enter Image",border: OutlineInputBorder()),),

          ElevatedButton(onPressed: () {
            provider.addProduct(context);
          }, child: Text("add Now"))
        ],
      ),
    );
  }
}
