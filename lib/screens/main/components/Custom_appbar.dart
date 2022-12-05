
import 'package:badges/badges.dart';
import 'package:ecommerce_int2/screens/shop/check_out_page.dart';
import 'package:ecommerce_int2/screens/notifications_page.dart';
import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final String title;
  
  const CustomAppBar( {
    Key? key,
     required this.title,
    
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(excludeHeaderSemantics: true,
      title: Text(title),
      primary: true,
      toolbarHeight: kToolbarHeight,
      backgroundColor: Colors.blueAccent,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
               Badge(
                position: BadgePosition.topEnd(),
                badgeColor: Colors.blueAccent,
                badgeContent: const Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
      child:IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                color: Colors.white,
                iconSize: 30,
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CheckOutPage()),),
              ),),
              Badge(
                position: BadgePosition.topEnd(),
                badgeColor: Colors.blueAccent,
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
      child:IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const NotificationsPage()),),
                icon:  const Icon(Icons.notifications_outlined),
                color: Colors.white,
                iconSize: 30,
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
