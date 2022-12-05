import 'package:ecommerce_int2/models/category.dart';
import 'package:ecommerce_int2/screens/category/category_list_page.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  final Category category;

  CategoryCard({Key? key, 
    required this.category,
  }) : super(key: key);


  List<Category> categories = [
    // Category(
    //   const Color(0xffFCE183),
    //   const Color(0xffF68D7F),
    //   'Men',
    //   'assets/ring_5.png',
    // ),
    // Category(
    //   const Color(0xffF749A2),
    //   const Color(0xffFF7375),
    //   'Women',
    //   'assets/clothes.png',
    // ),
    // Category(
    //   const Color(0xff00E9DA),
    //   const Color(0xff5189EA),
    //   'Beauty',
    //   'assets/fashion.png',
    // ),
    // Category(
    //   const Color(0xffAF2D68),
    //   const Color(0xff632376),
    //   'Watch',
    //   'assets/homedecor.png',
    // ),
    // Category(
    //   const Color(0xff36E892),
    //   const Color(0xff33B2B9),
    //   'Footwear',
    //   'assets/beauty.png',
    // ),
    // Category(
    //   const Color(0xffF123C4),
    //   const Color(0xff668CEA),
    //   'Jewellary',
    //   'assets/appliances.png',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CategoryListPage()));
    },
          
      child: Container(
        color: Colors.blueAccent,
        child: ClipOval(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width*0.8,
                  width: MediaQuery.of(context).size.width/5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepOrangeAccent,
                    border: Border.all(
                    width: 1,
                    color: Colors.white,
                    style: BorderStyle.solid),),
                   child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipOval(
                    child: Image.asset(
                    category.image,
                    // height: 80.0,
                    // width: 80.0,
                    fit: BoxFit.contain,
                    ),
                      ),
                      ), 
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                category.category,
                textAlign: TextAlign.center,
                style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
