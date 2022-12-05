import 'package:ecommerce_int2/models/category.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/main/components/carousel.dart';
import 'package:flutter/material.dart';
import 'category_card.dart';

class TabView extends StatelessWidget {

  late final Category category;
  
  TabView({Key? key,}) : super(key: key);


  List<Category> categories = [
    Category(
      const Color(0xffFCE183),
      const Color(0xffF68D7F),
      'Men',
      'assets/shoeman_4.png',
    ),
    Category(
      const Color(0xffF749A2),
      const Color(0xffFF7375),
      'Women',
      'assets/bag_6.png',
    ),
    Category(
      const Color(0xff00E9DA),
      const Color(0xff5189EA),
      'Footwear',
      'assets/womanshoe_3.png',
    ),
    Category(
      const Color(0xffAF2D68),
      const Color(0xff632376),
      'Watch',
      'assets/ring_8.png',
    ),
    Category(
      const Color(0xff36E892),
      const Color(0xff33B2B9),
      'Beauty',
      'assets/ring_9.png',
    ),
    Category(
      const Color(0xffF123C4),
      const Color(0xff668CEA),
      'Fashion',
      'assets/womanshoe_6.png',
    ),
  ];
  List<Product> products = [
  Product(
      'assets/shoeman_6.png',
      'Men\'s Footwear UP TO 60 % OFF ',
      'Lorem ipsum dolor sit amet, ',
      102.99,50,'9'),
  Product(
      'assets/womanshoe_4.png',
      'Footwear UP TO 60 % OFF ',
      'Lorem ipsum dolor sit amet, ',
      55.99,50,'9'),
  Product(
      'assets/womanshoe_6.png',
      'Footwear UP TO 60 % OFF ',
      'Lorem ipsum dolor sit amet,',
      152.99,40,'8'),
];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (_, index) => CategoryCard(
              category: categories[index],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),),),
          width: double.infinity,

     child: CarouselDemo(products: products),),

   // Flexible(child: RecommendedList()),

      ],
    );
  }
}
