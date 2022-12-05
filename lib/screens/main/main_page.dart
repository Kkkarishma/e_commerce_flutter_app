import 'package:ecommerce_int2/models/category.dart';
import 'package:ecommerce_int2/screens/main/components/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with TickerProviderStateMixin<MainPage> {


 
  late final Category category;

  @override
  void initState() {
    super.initState();
  }
//final PersistentTabController _controller =PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(resizeToAvoidBottomInset: true,
      //   backgroundColor: Colors.white,
      //   appBar: const CustomAppBar(
      //     title: "",
      //   ),
 
        //   AppBar(
        //     toolbarHeight: kToolbarHeight,
        //   backgroundColor: Colors.blueAccent,
        //   elevation: 0.0,
        //   centerTitle: true,
        //   actions: [ Padding(
        //   padding: const EdgeInsets.all(5.0),
        //     child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //       children: <Widget>[
        //         IconButton(
        //         icon: Icon(Icons.shopping_cart_outlined),color: Colors.white,iconSize: 30,
        //         onPressed: () => Navigator.of(context)
        //                 .push(MaterialPageRoute(builder: (_) => CheckOutPage()),),
        //       ),
        //      IconButton(
        //               onPressed: () => Navigator.of(context)
        //                   .push(MaterialPageRoute(builder: (_) => NotificationsPage()),),
        //               icon: Icon(Icons.notifications_outlined),
        //               color: Colors.white,iconSize: 30,),
        //   ],
        //   ),
        //   ),
        // ],
        // ),
 bottomNavigationBar: CustomBottomBar( ),
        // body: 
        // NestedScrollView(
        //   physics: const BouncingScrollPhysics(),
        //  headerSliverBuilder:
        //           (BuildContext context, bool innerBoxIsScrolled) {
        //         return <Widget>[
        //           SliverToBoxAdapter(
        //             child: Column(
        //               children: <Widget>[
        //                 Container(
        //                   height: kToolbarHeight * 1.3,
        //                   color: Colors.blueAccent,
        //                   child: Padding(
        //                     padding: const EdgeInsets.symmetric(
        //                       horizontal: 10,
        //                       vertical: 10,
        //                     ),
        //                     child: TextField(
        //                       textAlign: TextAlign.left,
        //                       decoration: InputDecoration(
        //                           border: const OutlineInputBorder(
        //                             borderRadius: BorderRadius.all(
        //                                 Radius.circular(10.0)),
        //                             borderSide: BorderSide(
        //                               style: BorderStyle.solid,
        //                             ),
        //                           ),
        //                           filled: true,
        //                           suffixIcon: IconButton(
        //                             icon: const Icon(Icons.search),
        //                             onPressed: () {
        //                               Navigator.of(context).push(MaterialPageRoute(builder: (_) =>const SearchPage()),);
        //                             },
        //                           ),
        //                           fillColor: const Color(0xFFF2F4F5),
        //                           hintStyle:
        //                               TextStyle(color: Colors.grey[600]),
        //                           hintText: "Search For Products",
        //                           alignLabelWithHint: true),
        //                       autofocus: false,
        //                     ),
        //                   ),
        //                 ),
                       
        //               ],
        //             ),
        //           ),
                  
        //         ];
        //       },
        //       body: Center(
        //         child: TabView(),
        //       ),
        //     ),
        ),
      );
  }
}
