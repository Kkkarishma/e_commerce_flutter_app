import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/main/components/Custom_appbar.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_model.dart';
import '../../widgets/cart_card_tile.dart';

class FavouritePage extends StatefulWidget {

  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage>with TickerProviderStateMixin {
  List<Product> products = [
    Product('assets/womanshoe_6.png', 'Shoes', 'Beautiful shoes', 2.33, 50, '8'),
    Product('assets/womanshoe_5.png', 'Shoes', 'Beautiful shoes', 10, 60, '9'),
    Product('assets/bag_6.png', 'Bag', 'Bags for you', 20, 50, 'NONE'),
    Product('assets/womanshoe_3.png', 'Woman Shoes','Shoes with special discount', 30, 40, '7'),
    Product('assets/bag_10.png', 'Bag Express', 'Bag for your shops', 40, 30,'NONE'),
    Product('assets/bag_9.png', 'Jeans', 'Beautiful Jeans', 102.33, 50, 'NONE'),
    Product('assets/ring_1.png', 'Silver Ring', 'Description', 52.33, 40, 'NONE'),
    Product('assets/shoeman_7.png', 'Shoes', 'Description', 62.33, 20, '9'),
    Product('assets/bag_7.png', 'Bag Express', 'Description', 72.33, 50, 'NONE'),
    Product('assets/womanshoe_4.png', 'Woman Shoes','Shoes with special discount', 72.33, 40, 'NONE'),
    Product('assets/shoeman_6.png', 'Shoes', 'Description', 72.33, 40, '6'),
    Product('assets/shoeman_10.png', 'Shoes', 'Description', 72.33, 60, '8'),
    Product('assets/headphone_9.png', 'Headphones', 'Description', 72.33, 50,'NONE'),
    Product('assets/shoeman_1.png', 'Shoes', 'Description', 72.33, 40, '8'),
  ];

  late final Product product;

  late TabController bottomTabController =TabController(length: 5, vsync: this);

   

  @override
  Widget build(BuildContext context) {
     final cart = Provider.of<CartItems>(context);
     
   return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar:const CustomAppBar(
        title: "Favourites",),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).orientation== Orientation.portrait ? 2 : 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                  childAspectRatio: 0.75),
              itemCount: cart.items.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context,  i) {
                return CartCardTile(
                id: cart.items.values.toList()[i].id!,
                productId: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price!,
                quantity: cart.items.values.toList()[i].quantity!,
                name: cart.items.values.toList()[i].name!,
                category: cart.items.values.toList()[i].category!,
                image: cart.items.values.toList()[i].image!,
              );
            }),
        ),
    );
  }
}






