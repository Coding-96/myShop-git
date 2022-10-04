import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum FliterOptions {
  onlyFavorties,
  showAll,
}

class ProductsOverveiwScreen extends StatefulWidget {
  @override
  State<ProductsOverveiwScreen> createState() => _ProductsOverveiwScreenState();
}

class _ProductsOverveiwScreenState extends State<ProductsOverveiwScreen> {
  var _showOnlyFavortie = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FliterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FliterOptions.onlyFavorties) {
                    _showOnlyFavortie = true;
                  } else {
                    _showOnlyFavortie = false;
                  }
                });
              },
              itemBuilder: ((_) => [
                    PopupMenuItem(
                      child: Text("only Favorites"),
                      value: FliterOptions.onlyFavorties,
                    ),
                    PopupMenuItem(
                        child: Text("ShowAll"), value: FliterOptions.showAll),
                  ])),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              value: cart.itemsCount.toString(),
            ),
            child: Icon(Icons.shopping_cart),
          ),
        ],
        title: Text("MyShop"),
      ),
      body: products_grid(_showOnlyFavortie),
    );
  }
}
