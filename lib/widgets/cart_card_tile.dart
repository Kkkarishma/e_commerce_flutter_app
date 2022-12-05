

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';

class CartCardTile extends StatelessWidget {
  final String? id;
  final String? productId;
  final double? price;
  final int? quantity;
  final String? name;
  final String? image;
  final String? category;
  const CartCardTile({
    Key? key,
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.name,
    this.image,
    this.category,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final totalPrice = (price! * quantity!);
   
    final cart = Provider.of<CartItems>(context);
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        //shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: [
          //    BoxShadow(
          //     color: Colors.lightBlueAccent,
          //     blurRadius: 10.0,
          //      spreadRadius: 30,
          //     offset: Offset(20,20,),
          //    ),
          //  ],
          //        ),
          // BoxShadow(
          //   color: Colors.black12,
          //   spreadRadius: 5,
          //   blurRadius: 5,
          //   offset: Offset(0, 5),
          // ),
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(5, 5)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 170,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  //borderRadius:const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                        image!,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: FavoriteButton(
                      iconSize: 30,
                      isFavorite: false,
                      iconDisabledColor: Colors.grey,
                      valueChanged: (isFavorite) {
                        final ScaffoldMessengerState addToCartMsg =
                            ScaffoldMessenger.of(context);
                        addToCartMsg.showSnackBar(
                           const SnackBar(
                            dismissDirection: DismissDirection.down,
                            elevation: 4,
                             duration: Duration(seconds: 5),  
                              content: Text('Product added successfully')),
                        );
                        
                      }),
                  // child: IconButton(
                  //   iconSize: 15,
                  //   icon: const Icon(
                  //     Icons.favorite,
                  //     color: Colors.red,
                  //   ),
                  //   onPressed: () => Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //         builder: (_) =>
                  //             const FavouritePage()),
                  //   ),
                  // ),
                ),
              ),
            ],
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                   name!,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  semanticsLabel: '...',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.5,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // FittedBox(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         maxLines: 5,
          //         semanticsLabel: '...',
          //         overflow: TextOverflow.fade,
          //         //textAlign: TextAlign.start,
          //         products[index].description,
          //         style: const TextStyle(
          //             color: Colors.black45,
          //             fontSize: 13,
          //              height: 1.5,
          //             fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          // ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  '\u20B9${totalPrice.toString()}',
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  maxLines: 5,
                  semanticsLabel: '...',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  '\u20B9${totalPrice.toString()}',
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  textAlign: TextAlign.start,
                  '${totalPrice.toString().trim()}%OFF',
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
