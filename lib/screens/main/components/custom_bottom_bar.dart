import 'package:badges/badges.dart';
import 'package:ecommerce_int2/screens/category/category_list_page.dart';
import 'package:ecommerce_int2/screens/favouritepage/favourite.dart';
import 'package:ecommerce_int2/screens/main/components/homepage.dart';
import 'package:ecommerce_int2/screens/orderspage/orderpage.dart';
import 'package:ecommerce_int2/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../../models/cart_model.dart';


class CustomBottomBar extends StatefulWidget {
  

  const CustomBottomBar( {Key? key,}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}


class _CustomBottomBarState extends State<CustomBottomBar> {
  final PersistentTabController _controller =PersistentTabController(initialIndex: 0);
  
  List<Widget> _NavScreens() {
    return [
      const HomePage(),
      const CategoryListPage(),
      const OrderPage(),
      const FavouritePage(),
      const ProfilePage(),
     
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home_outlined,
        ),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.dashboard_outlined,
        ),
        title: ("Category"),
        activeColorPrimary: CupertinoColors.systemIndigo,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.shopping_bag_outlined,
        ),
        title: ("Orders"),
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:  Badge(
                position: BadgePosition.bottomEnd(),
                badgeColor: Colors.blueAccent,
                badgeContent: const Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
      child: const Icon(
          Icons.favorite_outline,
        ),),
        title: ("Favourite"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.account_circle_outlined,
        ),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.systemYellow,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }


  @override
Widget build(BuildContext context) {
   final cart = Provider.of<CartItems>(context);
    return Center(
      child:  PersistentTabView(
        navBarHeight:kBottomNavigationBarHeight,
        context,
        controller: _controller,
        screens: _NavScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.bounceInOut,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 200),
        ),
        stateManagement: true, 
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}




//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//         body: _pages[_selectedPage],
//         bottomNavigationBar:
//       BottomNavigationBar(
        
//         onTap: (index) {
//           setState(() {
//             _selectedPage = index;
//             // _pageController.animateToPage(_selectedPage,
//             //     duration: Duration(milliseconds: 300), curve: Curves.linear);
//           });
//         },
//       currentIndex: _selectedPage,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white.withOpacity(0.2),
//         elevation: 0,
//         iconSize: 30,
//         showSelectedLabels:true,
//         showUnselectedLabels:true,
//         selectedFontSize: 14,
//         unselectedFontSize : 12.0,
//         unselectedItemColor:Colors.black,
//         selectedItemColor: Colors.blue,
//         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),
        
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined,),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard_outlined,),
//             label: 'Category',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined,),
//             label: 'Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_outline,),
//             label: 'Favourite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_outlined,),
//             label: 'Profile',
//           ),
//         ],
        
//       ),
//     );
//   }
// }

    
    
//     BottomAppBar(
//       color: Colors.white.withOpacity(0.2),
//       elevation: 0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           IconButton(tooltip: "Home",
//           focusColor:Colors.blue,
//             icon: const Icon(Icons.home_outlined,color: Colors.black54,size: 30,semanticLabel: 'Home',),
//             onPressed: () {
//               widget.controller.animateTo(0);
//             },
//           ),
//           IconButton(tooltip: "Category",
//             icon: const Icon(Icons.apps,color: Colors.black54,size: 30,),
//             onPressed: () {
//               widget.controller.animateTo(1);
//             },
//           ),
//           IconButton(tooltip: "Orders",
//              icon: const Icon(Icons.shopping_bag_outlined,color: Colors.black54,size: 30,),
//             onPressed: () {
//               widget.controller.animateTo(2);
//             },
//           ),
//           IconButton(tooltip: "Favourites",
//             icon: const Icon(
//               Icons.favorite_outline, color: Colors.black54,size: 30,),
//             onPressed: () {
//               widget.controller.animateTo(3);
//             },
//           ),
//           IconButton(tooltip: "Profile",
//             icon: const Icon(Icons.account_circle_outlined, color: Colors.black54,size: 30,),
//             onPressed: () {
//               widget.controller.animateTo(4);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
