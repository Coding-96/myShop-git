import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const rotueName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    label: Text(
                      "\$${cartData.totalAmount}",
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('ORDER NOW'),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.itemsCount,
              itemBuilder: (cxt, i) => ci.CartItem(
                  cartData.items.values.toList()[i].id,
                  cartData.items.keys.toList()[i],
                  cartData.items.values.toList()[i].price,
                  cartData.items.values.toList()[i].title,
                  cartData.items.values.toList()[i].quantity),
            ),
          ),
        ],
      ),
    );
  }
}
