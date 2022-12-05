import 'package:ecommerce_int2/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: null,
        child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width / 2 - 29,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width / 2 - 64,
                    height: MediaQuery.of(context).size.width / 2 - 64,
                    child: Image.asset(
                      product.image,
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const Alignment(1, 0.5),
                    child: Container(
                        margin: const EdgeInsets.only(left: 16.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.5),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Text(
                          product.name,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                  ),
                )
              ],
            ),
            ),
            );
  }
}
