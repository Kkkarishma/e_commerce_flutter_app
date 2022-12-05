import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/notifications_page.dart';
import 'package:ecommerce_int2/screens/product/components/rating_bottomSheet.dart';
import 'package:ecommerce_int2/screens/shop/check_out_page.dart';
import 'package:flutter/material.dart';
import 'components/color_list.dart';
import 'components/more_products.dart';
import 'components/product_options.dart';

class ViewProductPage extends StatefulWidget {
  final Product product;

  const ViewProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int active = 0;

  ///list of product colors
  List<Widget> colors() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(
        InkWell(
          onTap: () {
            setState(() {
              active = i;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Transform.scale(
              scale: active == i ? 1.2 : 1,
              child: Card(
                elevation: 3,
                color: Colors.primaries[i],
                child: const SizedBox(
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Widget description = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        widget.product.description,
        maxLines: 5,
        semanticsLabel: '...',
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.black),
      ),
    );

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,
          centerTitle: true,
          title: const Text('Products Details'),
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
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                ProductOption(
                  _scaffoldKey,
                  product: widget.product,
                ),
                description,
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    const Flexible(
                      child: ColorList([
                        Colors.red,
                        Colors.blue,
                        Colors.purple,
                        Colors.green,
                        Colors.yellow
                      ]),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const RatingBottomSheet();
                          },
                          elevation: 0,
                          backgroundColor: Colors.transparent
                        );
                      },
                      constraints:
                          const BoxConstraints(minWidth: 45, minHeight: 45),
                      elevation: 0.0,
                      shape: const CircleBorder(),
                      fillColor: Colors.white60,
                      child: const Icon(Icons.favorite,
                          color: Colors.redAccent),
                    ),
                  ]),
                ),
                MoreProducts()
              ],
            ),
          ),
        ));
  }
}
