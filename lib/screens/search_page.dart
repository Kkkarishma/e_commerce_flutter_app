import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/view_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rubber/rubber.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  String selectedPeriod = "";
  String selectedCategory = "";
  String selectedPrice = "";

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

  List<String> timeFilter = [
    'Brand',
    'New',
    'Latest',
    'Trending',
    'Discount',
  ];

  List<String> categoryFilter = [
    'Skull Candy',
    'Boat',
    'JBL',
    'Micromax',
    'Seg',
  ];

  List<String> priceFilter = [
    '\u20B9 50-200',
    '\u20B9 200-400',
    '\u20B9 400-800',
    '\u20B9 800-1000',
  ];

  List<Product> searchResults = [];

  TextEditingController searchController = TextEditingController();

  late RubberAnimationController _controller;

  @override
  void initState() {
    _controller = RubberAnimationController(
        vsync: this,
        halfBoundValue: AnimationControllerValue(percentage: 0.4),
        upperBoundValue: AnimationControllerValue(percentage: 0.4),
        lowerBoundValue: AnimationControllerValue(pixel: 50),
        duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Widget _getLowerLayer() {
    return Container(
      margin: const EdgeInsets.only(top: kToolbarHeight),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text(
                  'Search',
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CloseButton()
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
                border:
                    Border(
                      bottom: BorderSide(
                        color: Colors.orange, 
                        width: 1))),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  List<Product> tempList = [];
                  for (var product in products) {
                    if (product.name.toLowerCase().contains(value)) {
                      tempList.add(product);
                    }
                  }
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(tempList);
                  });
                  return;
                } else {
                  setState(() {
                    searchResults.clear();
                    searchResults.addAll(products);
                  });
                }
              },
              cursorColor: darkGrey,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                prefixIcon: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  fit: BoxFit.scaleDown,
                ),
                suffix: ElevatedButton(
                  onPressed: () {
                    searchController.clear();
                    searchResults.clear();
                  },
                  child: const Text(
                    'Clear',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.orange[50],
              child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ViewProductPage(
                                      product: searchResults[index],
                                    ))),
                        title: Text(searchResults[index].name),
                      ))),
            ),
          )
        ],
      ),
    );
  }

  Widget _getUpperLayer() {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, -3),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          color: Colors.white),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
         
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Filters',
                style: TextStyle(color: Colors.grey[300]),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
              child: Text(
                'Sort By',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPeriod = timeFilter[index];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20.0),
                        decoration: selectedPeriod == timeFilter[index]
                            ? const BoxDecoration(
                                color: Color(0xffFDB846),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)))
                            : const BoxDecoration(),
                        child: Text(
                          timeFilter[index],
                          style: const TextStyle(fontSize: 16.0),
                        ))),
              )),
              itemCount: timeFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = categoryFilter[index];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20.0),
                        decoration: selectedCategory == categoryFilter[index]
                            ? const BoxDecoration(
                                color: Color(0xffFDB846),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)))
                            : const BoxDecoration(),
                        child: Text(
                          categoryFilter[index],
                          style: const TextStyle(fontSize: 16.0),
                        ))),
              )),
              itemCount: categoryFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemBuilder: (_, index) => Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedPrice = priceFilter[index];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 20.0),
                        decoration: selectedPrice == priceFilter[index]
                            ? const BoxDecoration(
                                color: Color(0xffFDB846),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45)))
                            : const BoxDecoration(),
                        child: Text(
                          priceFilter[index],
                          style: const TextStyle(fontSize: 16.0),
                        ))),
              )),
              itemCount: priceFilter.length,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
         bottomSheet: ClipRRect(
           borderRadius: const BorderRadius.only(
               topRight: Radius.circular(25), 
               topLeft: Radius.circular(25)),
           child: BottomSheet(
               onClosing: () {},
               builder: (_) => Container(
                     padding: const EdgeInsets.all(16.0),
                     color: Colors.white,
                     width: MediaQuery.of(context).size.height,
                     child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const <Widget>[Text('Filters')]),
                   )),
         ),
            body: RubberBottomSheet(
          lowerLayer: _getLowerLayer(), 
          upperLayer: _getUpperLayer(),
          animationController: _controller, 
        )),
      ),
    );
  }
}
