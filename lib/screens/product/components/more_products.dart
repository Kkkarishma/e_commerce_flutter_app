import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/components/product_card.dart';
import 'package:flutter/material.dart';

class MoreProducts extends StatelessWidget {
  final List<Product> products = [
   Product('assets/womanshoe_6.png', 'Shoes', 'Beautiful shoes', 2.33, 50,'8'),
    Product('assets/womanshoe_5.png', 'Shoes', 'Beautiful shoes', 10, 60,'9'),
    Product('assets/bag_6.png', 'Bag', 'Bags for you', 20, 50,'NONE'),
    Product('assets/womanshoe_3.png', 'Woman Shoes',
        'Shoes with special discount', 30, 40,'7'),
    Product('assets/bag_10.png', 'Bag Express', 'Bag for your shops', 40, 30,'NONE'),
    Product('assets/bag_9.png', 'Jeans', 'Beautiful Jeans', 102.33, 50,'NONE'),
    Product('assets/ring_1.png', 'Silver Ring', 'Description', 52.33, 40,'NONE'),
    Product('assets/shoeman_7.png', 'Shoes', 'Description', 62.33, 20,'9'),
    Product('assets/bag_7.png', 'Bag Express', 'Description', 72.33, 50,'NONE'),
    Product('assets/womanshoe_4.png', 'Woman Shoes',
        'Shoes with special discount', 72.33, 40,'NONE'),
    Product('assets/shoeman_6.png', 'Shoes', 'Description', 72.33, 40,'6'),
    Product('assets/shoeman_10.png', 'Shoes', 'Description', 72.33, 60,'8'),
    Product('assets/headphone_9.png', 'Headphones', 'Description', 72.33, 50,'NONE'),
    Product('assets/shoeman_1.png', 'Shoes', 'Description', 72.33, 40,'8'),
  ];

  MoreProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 24.0, bottom: 8.0),
          child: Text(
            'More products',
            style: TextStyle(color: Colors.black, shadows: shadow),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          height: 250,
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) {
              return Padding(
                ///calculates the left and right margins
                ///to be even with the screen margin
                  padding: index == 0
                      ? const EdgeInsets.only(left: 24.0, right: 8.0)
                      : index == 4
                      ? const EdgeInsets.only(right: 24.0, left: 8.0)
                      : const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProductCard(products[index]));
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
