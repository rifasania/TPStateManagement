import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_statemanagement/provider/product_provider.dart';
import 'package:tp_statemanagement/screen/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: const MaterialApp(
        home: ProductPage(),
      ),
    );
  }
}