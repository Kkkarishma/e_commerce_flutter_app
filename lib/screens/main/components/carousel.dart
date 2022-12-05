import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_int2/models/category.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/product_page.dart';
import 'package:flutter/material.dart';

class CarouselDemo extends StatelessWidget {

  CarouselDemo({Key? key, required this.products}) : super(key: key);
  
  
  late final Category category;
  late List<Product> products;

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 5.0;
    double cardWidth = MediaQuery.of(context).size.width/1.2;
    return CarouselSlider.builder(
      itemCount: products.length,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 7),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1.0,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (context, index, realIdx) {
        return ProductCard(
            height: cardHeight, width: cardWidth, product: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final double height;
  final double width;

   const ProductCard({Key? key, 
    required this.product,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(15),
            height: height,
            width: width,
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15),),
            color: Colors.white,),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Men\'s',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          const Text(
                            'Footwear',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          const Text(
                            'UP TO 60 % OFF',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),), 
                                    backgroundColor: Colors.black,
                                    textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,),),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          ProductPage(),),
                                  );
                                },
                                child: const Text('Shop Now'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
       Align(
         alignment: Alignment.centerRight,
         child:
        Hero(
          tag: product.image,
          child: Image.asset(
          product.image,
          height: height / 1.5,
          width: width / 1.2,
          fit: BoxFit.contain,
                  ),
                ),
       ),
      ],
    );
  }
}


// Hero(
//                     tag: product.image,
//                     child: Image.asset(
//                       product.image,
//                       height: height / 1.7,
//                       width: width / 1.4,
//                       fit: BoxFit.contain,
//                     ),
//                   ),