import 'package:flutter/material.dart';
import 'package:myshop/widgets/product_item.dart';
import '../providers/product.dart';
import '../widgets/products_grid.dart';

class ProductsOverveiwScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyShop")),
      body: products_grid(),
    );
  }
}
