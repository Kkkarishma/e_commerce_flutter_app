import 'package:ecommerce_int2/widgets/popularcard.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/screens/notifications_page.dart';
import 'package:ecommerce_int2/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/popularproduct_model.dart';

class ProductPage extends StatefulWidget {
  
 
     const ProductPage({
    Key? key, 
    
  }) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 

 
  _ProductPageState();

  @override
  Widget build(BuildContext context) {
   final popularpod = Provider.of<PopularPoductsItems>(context);
    final SwiperController swiperController = SwiperController();
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: const Text('Popular Products'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CheckOutPage()),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const NotificationsPage()),
                  ),
                  icon: const Icon(Icons.notifications_outlined),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ],
            ),
          ),
        ],
      ),
      body: GridView.builder(
        
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 2 / 3, ),
          itemCount:popularpod.items.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int i) { 
            return Popularcard(
              id: popularpod.items.values.toList()[i].id!,
              productId: popularpod.items.keys.toList()[i],
              price: popularpod.items.values.toList()[i].price!,
              quantity: popularpod.items.values.toList()[i].quantity!,
              name: popularpod.items.values.toList()[i].name!,
              category: popularpod.items.values.toList()[i].category!,
              image: popularpod.items.values.toList()[i].image!,
            );
            }
            
      ),
    );
  }
}
