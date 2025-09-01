import 'package:api_first_basic/modal/productmodal.dart';
import 'package:api_first_basic/provider/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProductScreen extends StatelessWidget {
  final ProductModal data;
  const UpdateProductScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ProductProvider>(context,listen: false);
    provider.titleController.text = data.title ?? "";
    provider.priceController.text = data.price ?? "";
    provider.desController.text = data.description ?? "";
    provider.categoryController.text = data.category ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(controller: provider.titleController,decoration: InputDecoration(hintText: "Enter Title",border: OutlineInputBorder()),),
          TextField(controller: provider.priceController,decoration: InputDecoration(hintText: "Enter price",border: OutlineInputBorder()),),
          TextField(controller: provider.desController,decoration: InputDecoration(hintText: "Enter description",border: OutlineInputBorder()),),
          TextField(controller: provider.categoryController,decoration: InputDecoration(hintText: "Enter category",border: OutlineInputBorder()),),
          TextField(controller: provider.imageController,decoration: InputDecoration(hintText: "Enter Image",border: OutlineInputBorder()),),

          ElevatedButton(onPressed: () {
            provider.updateProduct(context,data.id??0);
          }, child: Text("update Now"))
        ],
      ),
    );
  }
}
