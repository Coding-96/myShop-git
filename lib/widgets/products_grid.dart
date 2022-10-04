import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';
import '../providers/product.dart';
import '../providers/products_provider.dart';

class products_grid extends StatelessWidget {
 final  bool isFav;
 products_grid( this.isFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = isFav ? productsData.itemsFavorites : productsData.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: ((ctx, i) => ChangeNotifierProvider.value(
            value: products[i],
            child: ProductItem(
                // id: products[i].id,
                // title: products[i].title,
                // imageUrl: products[i].imageUrl,
                ),
          )),
    );
  }
}
