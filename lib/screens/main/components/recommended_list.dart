import 'dart:convert';

import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/category/category_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:developer' as dev;
import '../../../widgets/productcard.dart';

class RecommendedList extends StatefulWidget {
  

  const RecommendedList({
    Key? key,
  }) : super(key: key);

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<List<dynamic>>? futureProduct;

  Future<List<dynamic>> fetchProducts() async {
    final baseUrl = 'fakestoreapi.com';
    final _url = '/products';
    var res = await http.get(Uri.https(baseUrl, _url));
    dev.log('Request: ${res.request!.url.toString()}');

    var data = jsonDecode(res.body);
    if (kDebugMode) {
      dev.log('Response: ${data.toString()}');
    }
    return data;
  }

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProducts();
  }
  List<Product> products = [
    Product('assets/shopping.png', 'Girls Top', 'Beautiful Top', 2.33, 50, '8'),
    Product('assets/womanshoe_5.png', 'Shoes', 'Beautiful shoes', 10, 60, '9'),
    Product('assets/shopping2.png', 'Cotton shirts', 'casuals shirts', 20, 50,
        'NONE'),
    Product('assets/womanshoe_3.png', 'Woman Shoes',
        'Shoes with special discount', 30, 40, '7'),
    Product('assets/womanshoe_6.png', 'Bag Express', 'Bag for your shops', 40,
        30, 'NONE'),
    Product('assets/bag_9.png', 'Jeans', 'Beautiful Jeans', 102.33, 50, 'NONE'),
    Product('assets/womenshopping.png', 'Silver Ring', 'Description', 52.33, 40,
        'NONE'),
    Product('assets/shoeman_7.png', 'Shoes', 'Description', 62.33, 20, '9'),
    Product('assets/womanshoe_5.png', 'Bag Express', 'Description', 72.33, 50,
        'NONE'),
    Product('assets/womanshoe_4.png', 'Woman Shoes',
        'Shoes with special discount', 72.33, 40, 'NONE'),
    Product('assets/shoeman_6.png', 'Shoes', 'Description', 72.33, 40, '6'),
    Product('assets/shoeman_10.png', 'Shoes', 'Description', 72.33, 60, '8'),
    Product('assets/headphone_9.png', 'Headphones', 'Description', 72.33, 50,
        'NONE'),
    Product('assets/shoeman_1.png', 'Shoes', 'Description', 72.33, 40, '8'),
  ];

  late Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Popular Products',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CategoryListPage()
                  ),
                ),
                child: const Text(
                  'View More',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: FutureBuilder<List<dynamic>>(
          future: futureProduct,
          builder: (context, data) {
            if (data.hasData) {
              return
               GridView.builder(
               
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? 2
                                          : 3,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      childAspectRatio: 0.75),
                  itemCount: data.data!.length,
                  
                  itemBuilder: (BuildContext context, int i) {
                    return  Productcard(data: data.data![i],
                              
                            );
                  });
                  }
                  else if (data.hasError) {
              return Text("${data.error}");
              }
              return const Center(child: CircularProgressIndicator());
              }
            )
          ),
        ],
      ),
    );
  }
}
                             
                              //       Flexible(
                              //         child:
                              //    Container(
                              //     padding: EdgeInsets.all(2),
                              //     decoration: BoxDecoration(
                              //       color: Colors.black.withOpacity(0.2),
                              //       shape: BoxShape.circle,
                              //     ),
                              //     child: IconButton(
                              //       icon: Icon(
                              //         Icons.shopping_cart,
                              //       ),
                              //       iconSize: 20,
                              //       color: Colors.black,
                              //       onPressed: () {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) => ProductPage(
                              //                 product: products[index]),
                              //           ),
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                                

                             
                        //       Row(
                        //         children: [

                        //          Flexible(
                        //               child: Colorlistmain([
                        //                 Colors.red,
                        //                 Colors.blue,
                        //                 Colors.purple,
                        //                 Colors.green,
                        //                 Colors.yellow
                        //               ]),
                        //             ),

                        //   ],
                        // ),

                 
            
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     horizontal: 5,
              //     vertical: 5,
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(8),
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //           color: Colors.black.withOpacity(0.9),
              //           blurRadius: 4,
              //           offset: Offset(0, 2)),
              //     ],
              //   ),
              //   width: 150,
              //   height: 280,
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: [
              //           Image.asset(
                      
              //         products[index].image,
              //        height: 60,
              //         fit: BoxFit.contain,
              //       ),
              //           IconButton(
              //             icon: Icon(
              //               Icons.favorite,
              //               color: Colors.red,
              //             ),
              //             onPressed: () => Navigator.of(context).push(
              //               MaterialPageRoute(builder: (_) => FavouritePage()),
              //             ),
              //           ),
              //         ],
              //       ),
                    
              //       Text(
              //         products[index].name,
              //         maxLines: 5,
              //           semanticsLabel: '...',
              //           overflow: TextOverflow.ellipsis,
              //         style: TextStyle(
                        
              //           color: Colors.black,
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
                        
              //         ),
              //       ),
              //       Text(
              //         '${products[index].price}',
              //         style: TextStyle(
              //             color: Colors.black45,
              //             fontSize: 13,
              //             fontWeight: FontWeight.bold),
              //       ),
                     
                    // Flexible(
                    //   child: Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: IconButton(
                    //       icon: Icon(
                    //         Icons.shopping_cart,
                    //       ),
                    //       iconSize: 20,
                    //       color: Colors.blue,
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //             builder: (context) =>
                    //                 ProductPage(product: products[index]),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    
              //       Expanded(
              //         child: Row(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.all(2),
              //             ),
              //             Text(
              //               '\$${products[index].price}',
              //               style: TextStyle(
              //                   decoration: TextDecoration.lineThrough,
              //                   color: Colors.black,
              //                   fontSize: 12,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //             SizedBox(
              //               width: 14,
              //             ),
              //             Text(
              //               '${products[index].discount}%OFF',
              //               style: TextStyle(
              //                   fontSize: 12,
              //                   color: Colors.lightBlue,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //           ],
              //         ),
                      
              //       ),
              //       Row(
              //         children: [
          
              //          Flexible(
              //               child: Colorlistmain([
              //                 Colors.red,
              //                 Colors.blue,
              //                 Colors.purple,
              //                 Colors.green,
              //                 Colors.yellow
              //               ]),
              //             ),
                    
              //   ],
              // ),

         
            //  Row(
            //             children: List.generate(
            //                 sizes.length,
            //                 (index) => Padding(
            //                       padding: const EdgeInsets.all(5.0),
            //                       child: Material(
            //                         child: InkWell(
            //                           borderRadius: BorderRadius.circular(3),
            //                           onTap: () => onSizeSelected(sizes[index]),
            //                           child: Ink(
            //                             height: 20,
            //                             width: 20,
            //                             decoration: BoxDecoration(
            //                                 color: selectedSize == sizes[index]
            //                                     ? Color(0xFF667EEA)
            //                                     : Colors.white24,
            //                                 borderRadius:
            //                                     BorderRadius.circular(2)),
            //                             child: Align(
            //                               alignment: Alignment.center,
            //                               child: Text(
            //                                 '${sizes[index].toString()}',
            //                                 style: TextStyle(
            //                                         color: selectedSize ==
            //                                                 sizes[index]
            //                                             ? Colors.blue
            //                                             : Colors.black87),
            //                               ),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     )),
            //           )
                      
     
                
                  
                
              
            
          
        
      
    

