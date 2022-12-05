import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/main/components/Custom_appbar.dart';
import 'package:ecommerce_int2/screens/main/components/recommended_list.dart';
import 'package:ecommerce_int2/screens/main/components/tab_view.dart';
import 'package:ecommerce_int2/screens/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Product> products = [
  Product('assets/shoeman_6.png', 'Men\'s Footwear UP TO 60 % OFF ',
      'Lorem ipsum dolor sit amet, ', 102.99, 50, '9'),
  Product('assets/womanshoe_4.png', 'Footwear UP TO 60 % OFF ',
      'Lorem ipsum dolor sit amet, ', 55.99, 50, '9'),
  Product('assets/womanshoe_6.png', 'Footwear UP TO 60 % OFF ',
      'Lorem ipsum dolor sit amet,', 152.99, 40, '8'),
];

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 
//     DraggableHome(
//       headerExpandedHeight: 0.35,
//       stretchMaxHeight: 0.9,
//       title: const CustomAppBar(
//         title: "",
//       ),

//       headerWidget: Column(
//         children: [
//           Container(
//             height: kToolbarHeight * 1.3,
//             color: Colors.blueAccent,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 10,
//               ),
//               child: TextField(
//                 textAlign: TextAlign.left,
//                 decoration: InputDecoration(
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                     filled: true,
//                     suffixIcon: IconButton(
//                       icon: const Icon(Icons.search),
//                       onPressed: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(builder: (_) => const SearchPage()),
//                         );
//                       },
//                     ),
//                     fillColor: const Color(0xFFF2F4F5),
//                     hintStyle: TextStyle(color: Colors.grey[600]),
//                     hintText: "Search For Products",
//                     alignLabelWithHint: true),
//                 autofocus: false,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: const [],
//       fullyStretchable: true,
//       expandedBody: NestedScrollView(
//         physics: const NeverScrollableScrollPhysics(),
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[];
//         },
//         body: Center(
//           child: TabView(),
//         ),
//       ),

//       backgroundColor: Colors.white,
      
//     );
//   }
// }


      Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "",
      ),
       body: NestedScrollView(
         physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder:(BuildContext context, bool innerBoxIsScrolled) {
               return <Widget>[
                 SliverToBoxAdapter(
                   child: Column(
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
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(10.0)),
                                   borderSide: BorderSide(
                                     style: BorderStyle.solid,
                                   ),
                                 ),
                                 filled: true,
                                 suffixIcon: IconButton(
                                   icon: const Icon(Icons.search),
                                   onPressed: () {
                                     Navigator.of(context).push(MaterialPageRoute(builder: (_) =>const SearchPage()),);
                                   },
                                 ),
                                 fillColor: const Color(0xFFF2F4F5),
                                 hintStyle:
                                     TextStyle(color: Colors.grey[600]),
                                 hintText: "Search For Products",
                                 alignLabelWithHint: true),
                             autofocus: false,
                           ),
                         ),
                       ),
                  TabView(),
                     ],
                   ),
                 ),
      
               ];
             },
             body:
             RecommendedList(),
           ),
      );
  }
}

//  Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: const CustomAppBar(title: ''),
// body: SingleChildScrollView(
//   child:
//  Column(
//                      children: <Widget>[
//                        Container(
//                          height: kToolbarHeight * 1.3,
//                          color: Colors.blueAccent,
//                          child: Padding(
//                            padding: const EdgeInsets.symmetric(
//                              horizontal: 10,
//                              vertical: 10,
//                            ),
//                            child: TextField(
//                              textAlign: TextAlign.left,
//                              decoration: InputDecoration(
//                                  border: const OutlineInputBorder(
//                                    borderRadius: BorderRadius.all(
//                                        Radius.circular(10.0)),
//                                    borderSide: BorderSide(
//                                      style: BorderStyle.solid,
//                                    ),
//                                  ),
//                                  filled: true,
//                                  suffixIcon: IconButton(
//                                    icon: const Icon(Icons.search),
//                                    onPressed: () {
//                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) =>const SearchPage()),);
//                                    },
//                                  ),
//                                  fillColor: const Color(0xFFF2F4F5),
//                                  hintStyle:
//                                      TextStyle(color: Colors.grey[600]),
//                                  hintText: "Search For Products",
//                                  alignLabelWithHint: true),
//                              autofocus: false,
//                            ),
//                          ),
//                        ),
// TabView()
//                      ]),

// ),
// );
// }}


//       Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const CustomAppBar(
//         title: "",
//       ),
//        body: NestedScrollView(
        
//          physics: const ScrollPhysics(),
//         headerSliverBuilder:
//                  (BuildContext context, bool innerBoxIsScrolled) {
//                return <Widget>[
//                 SliverOverlapAbsorber(
//             handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//              sliver: SliverToBoxAdapter(
//                    child: Column(
//                      children: <Widget>[
//                        Container(
//                          height: kToolbarHeight * 1.3,
//                          color: Colors.blueAccent,
//                          child: Padding(
//                            padding: const EdgeInsets.symmetric(
//                              horizontal: 10,
//                              vertical: 10,
//                            ),
//                            child: TextField(
//                              textAlign: TextAlign.left,
//                              decoration: InputDecoration(
//                                  border: const OutlineInputBorder(
//                                    borderRadius: BorderRadius.all(
//                                        Radius.circular(10.0)),
//                                    borderSide: BorderSide(
//                                      style: BorderStyle.solid,
//                                    ),
//                                  ),
//                                  filled: true,
//                                  suffixIcon: IconButton(
//                                    icon: const Icon(Icons.search),
//                                    onPressed: () {
//                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) =>const SearchPage()),);
//                                    },
//                                  ),
//                                  fillColor: const Color(0xFFF2F4F5),
//                                  hintStyle:
//                                      TextStyle(color: Colors.grey[600]),
//                                  hintText: "Search For Products",
//                                  alignLabelWithHint: true),
//                              autofocus: false,
//                            ),
//                          ),
//                        ),
                     
//         ]),
//         ))];
//       },
//       body: Builder(
//         builder: (BuildContext context) {
//           return CustomScrollView(
//             // The "controller" and "primary" members should be left
//             // unset, so that the NestedScrollView can control this
//             // inner scroll view.
//             // If the "controller" property is set, then this scroll
//             // view will not be associated with the NestedScrollView.
//             slivers: <Widget>[
//                SliverToBoxAdapter(
//                    child:TabView()),
              
//             ],
//           );
//         }
//       )
//     )
//   );
// }
//     }