import 'package:ecommerce_int2/models/category.dart';
import 'package:ecommerce_int2/screens/category/components/staggered_category_card.dart';
import 'package:ecommerce_int2/screens/main/components/Custom_appbar.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatefulWidget {
  
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> 
with SingleTickerProviderStateMixin {

  

  List<Category> categories = [
    Category(
      const Color(0xffFCE183),
      const Color(0xffF68D7F),
      'Westernwear',
      'assets/shopping.png',
    ),
    Category(
      const Color(0xffF749A2),
      const Color(0xffFF7375),
      'kurties',
      'assets/womanshoe_8.png',
    ),
    Category(
      const Color(0xff00E9DA),
      const Color(0xff5189EA),
      'shirts',
      'assets/ring_8.png',
    ),
    Category(
      const Color(0xffAF2D68),
      const Color(0xff632376),
      'beauty',
      'assets/homedecor.png',
    ),
    Category(
      const Color(0xff36E892),
      const Color(0xff33B2B9),
      'fashion',
      'assets/ring_10.png',
    ),
    Category(
      const Color(0xffF123C4),
      const Color(0xff668CEA),
      'footwear',
      'assets/headphones_3.png',
    ),
    Category(
      const Color(0xffFCE183),
      const Color(0xffF68D7F),
      'Westernwear',
      'assets/jeans_5.png',
    ),
    Category(
      const Color(0xffF749A2),
      const Color(0xffFF7375),
      'kurties',
      'assets/womanshoe_8.png',
    ),
    Category(
      const Color(0xff00E9DA),
      const Color(0xff5189EA),
      'shirts',
      'assets/ring_8.png',
    ),
    Category(
      const Color(0xffAF2D68),
      const Color(0xff632376),
      'beauty',
      'assets/homedecor.png',
    ),
    Category(
      const Color(0xff36E892),
      const Color(0xff33B2B9),
      'fashion',
      'assets/ring_10.png',
    ),
    Category(
      const Color(0xffF123C4),
      const Color(0xff668CEA),
      'footwear',
      'assets/headphones_3.png',
    ),
  ];
  List<Category> categories2 = [
    Category(
      const Color(0xffFCE183),
      const Color(0xffF68D7F),
      'Westernwear',
      'assets/jeans_5.png',
    ),
    Category(
      const Color(0xffF749A2),
      const Color(0xffFF7375),
      'kurties',
      'assets/womanshoe_8.png',
    ),
    
   
  ];
  List<Category> categories3 = [
    
    Category(
      const Color(0xff36E892),
      const Color(0xff33B2B9),
      'fashion',
      'assets/ring_10.png',
    ),
    Category(
      const Color(0xffF123C4),
      const Color(0xff668CEA),
      'footwear',
      'assets/headphones_3.png',
    ),
    Category(
      const Color(0xffFCE183),
      const Color(0xffF68D7F),
      'Westernwear',
      'assets/jeans_5.png',
    ),
    Category(
      const Color(0xffF749A2),
      const Color(0xffFF7375),
      'kurties',
      'assets/womanshoe_8.png',
    ),
    Category(
      const Color(0xff00E9DA),
      const Color(0xff5189EA),
      'shirts',
      'assets/ring_8.png',
    ),
    
  ];

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          title: "Category",
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: kToolbarHeight * 1.3,
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      filled: true,
                      suffixIcon: const Icon(Icons.search),
                      fillColor: const Color(0xFFF2F4F5),
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Search For Products",
                      alignLabelWithHint: true),
                  autofocus: false,
                ),
              ),
            ),  
           
            Container(
              color: Colors.blue,
              child: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: TabBar(
                  indicatorPadding: const EdgeInsets.all(5),
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue,
                  ),
                   indicatorWeight: 10,
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor:
                      Colors.black,
                       unselectedLabelColor: Colors.white,
                       labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 16,),
                        unselectedLabelStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                  ),
                        overlayColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue;
                    }
                    if (states.contains(MaterialState.focused)) {
                      return Colors.orange;
                    } else if (states.contains(MaterialState.hovered)) {
                      return Colors.pinkAccent;
                    }

                    return Colors.transparent;
                  }),
                  tabs: const [
                    Tab(
                      text: 'Women',
                    ),
                    Tab(
                      text: 'Men',
                    ),
                    Tab(
                      text: 'Kids',
                    ),
                  ], 
                ),
              ),
            ),
            
            SizedBox(
              height: 10,
              child: Container(
                color: const Color(0xFFf5f6f7),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.white,
                    child: GridView.builder(
                      
                      padding: const EdgeInsets.all(5,),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      
                      itemCount: categories3.length,
                      itemBuilder: (_, index) => CategoryCard(
                        category: categories3[index],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(5,),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      
                      itemCount: categories.length,
                      itemBuilder: (_, index) => CategoryCard(
                        category: categories[index],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(5,),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      
                      itemCount: categories2.length,
                      itemBuilder: (_, index) => CategoryCard(
                        category: categories2[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
