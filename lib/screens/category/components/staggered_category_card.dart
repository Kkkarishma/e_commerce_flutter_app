import 'package:ecommerce_int2/models/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  
  final Category category;

   const CategoryCard({Key? key, 
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipOval(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
          margin: const EdgeInsets.all(10),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(category.image,),
            fit: BoxFit.fill
            ),
                ),
              ),
            ),
             Padding(
                padding: const EdgeInsets.only(top:5.0,bottom: 5,left: 10,right: 10),
                child: Text(
                  category.category,
                  textAlign: TextAlign.center,
                  style: const TextStyle(overflow: TextOverflow.visible,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
