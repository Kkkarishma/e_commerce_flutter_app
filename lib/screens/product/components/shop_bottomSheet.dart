import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';

import 'shop_product.dart';

class ShopBottomSheet extends StatefulWidget {
  const ShopBottomSheet({Key? key}) : super(key: key);

  @override
  _ShopBottomSheetState createState() => _ShopBottomSheetState();
}

class _ShopBottomSheetState extends State<ShopBottomSheet> {
  List<Product> products = [
  Product(
        'assets/womanshoe_6.png', 'Shoes', 'Beautiful shoes', 2.33, 50, '8'),
    Product('assets/womanshoe_5.png', 'Shoes', 'Beautiful shoes', 10, 60, '9'),
    Product('assets/bag_6.png', 'Bag', 'Bags for you', 20, 50, 'NONE'),
    Product('assets/womanshoe_3.png', 'Woman Shoes',
        'Shoes with special discount', 30, 40, '7'),
    Product('assets/bag_10.png', 'Bag Express', 'Bag for your shops', 40, 30,
        'NONE'),
    Product('assets/bag_9.png', 'Jeans', 'Beautiful Jeans', 102.33, 50, 'NONE'),
    Product(
        'assets/ring_1.png', 'Silver Ring', 'Description', 52.33, 40, 'NONE'),
    Product('assets/shoeman_7.png', 'Shoes', 'Description', 62.33, 20, '9'),
    Product(
        'assets/bag_7.png', 'Bag Express', 'Description', 72.33, 50, 'NONE'),
    Product('assets/womanshoe_4.png', 'Woman Shoes',
        'Shoes with special discount', 72.33, 40, 'NONE'),
    Product('assets/shoeman_6.png', 'Shoes', 'Description', 72.33, 40, '6'),
    Product('assets/shoeman_10.png', 'Shoes', 'Description', 72.33, 60, '8'),
    Product('assets/headphone_9.png', 'Headphones', 'Description', 72.33, 50,
        'NONE'),
    Product('assets/shoeman_1.png', 'Shoes', 'Description', 72.33, 40, '8'),
  ];

  @override
  Widget build(BuildContext context) {
    Widget confirmButton = InkWell(
      onTap: () async {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const CheckOutPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom == 0
                ? 20
                : MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: const Center(
            child: Text("Confirm",
                style: TextStyle(
                    color: Color(0xfffefefe),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0))),
      ),
    );

    return Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.9),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Align(
            //   alignment: Alignment.topRight,
            //   child: IconButton(
            //     // icon: Image.asset(
            //     //   'assets/box.png',
            //     //   height: 24,
            //     //   width: 24.0,
            //     //   fit: BoxFit.cover,
            //     // ),
            //     onPressed: () {},
            //     iconSize: 48,
            //   ),
            // ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    return Row(
                      children: <Widget>[
                        ShopProduct(products[index],onRemove: (){
                          setState(() {
                            products.remove(products[index]);
                          });
                        },),
                        index == 4
                            ? const SizedBox()
                            : Container(
                                width: 2,
                                height: 200,
                                color: Colors.grey)
                      ],
                    );
                  }),
            ),
            confirmButton
          ],
        ));
  }
}
