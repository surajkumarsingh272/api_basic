import 'package:api_first_basic/provider/productprovider.dart';
import 'package:api_first_basic/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (context) => ProductProvider(),)
    ],child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
