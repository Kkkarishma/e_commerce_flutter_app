import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/main/components/Custom_appbar.dart';
import 'package:ecommerce_int2/screens/payments/payments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {

  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {

  SwiperController swiperController = SwiperController();

  List<Product> products = [
    Product('assets/shopping.png', 'kurties', 'woman shopping', 52.33, 40, 'NONE'),
    
  ];
int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "MY CART",
      ),
      body:ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          products[index].description,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\u20B9 ${products[index].price}",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
          
          Container(
              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey, width: 1),
              // boxShadow: const [
              //   BoxShadow(
              //   color: Color.fromARGB(255, 212, 212, 212),
              //   blurRadius: 10,spreadRadius: 3),],
             
              shape: BoxShape.rectangle,
              color: Colors.white,),
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              GestureDetector(
              onTap: () {
                setState(() {
                  if (_count > 1) {
                    _count--;
                  }
                });
              },
              child: const Center(
                child: Icon(CupertinoIcons.minus_rectangle,size: 20,),
                // Icon(
                //   Icons.minimize,
                //   size: 20,
                // ),
              ),
              ),
              Text(
              _count.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
              GestureDetector(
              onTap: () {
                setState(() {
                  _count++;
                });
              },
              child: const Center(
                child: Icon(CupertinoIcons.plus_rectangle,size: 20,),
                // Icon(
                //   Icons.add,
                //   size: 20,
                // ),
              ),
              ),
                    ],
                  ),
              ),
          
          
                        // Container(
                        //      width: 40,
                        //      height: 80,
                        //      padding: const EdgeInsets.only(top: 20),
                        //      child: Center(
                        //        child: ListWheelScrollView.useDelegate(
                        //        magnification: 1.1,
                        //        squeeze: 1,
                        //        perspective: 0.01,
                        //        useMagnifier: true,
                        //          itemExtent: 40,
                                
                        //          onSelectedItemChanged: (i) {
                        //            if (kDebugMode) {
                        //              print(i);
                        //            }
                        //          },
                        //          physics: const BouncingScrollPhysics(),
                        //          childDelegate: ListWheelChildListDelegate(
                        //              children: [0, 1, 2, 3, 4, 5, 6, 7]
                        //                  .map((i) => Text(
                        //                        '$i',
                        //                        style:
                        //                            const TextStyle(fontSize: 13,
                        //                            color:Colors.black,
                        //                            fontWeight: FontWeight.bold),
                        //                      ))
                        //                  .toList()),
                        //        ),
                        //      ),
                        //    ),
                          ],
                          ),
                    ),
                    leading: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              products[index].image,
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    // trailing: const Icon(
                    //   Icons.chevron_right,
                    //   color: Colors.black,
                    //   size: 30,
                    // ),
                    // onTap: () => Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (_) => const OrderPage())),
                  ),
                  Container(
                    
                    padding: const EdgeInsets.all(5),
                   decoration: const BoxDecoration(
                border: Border(
                          top: BorderSide(width: 1, color: Colors.grey),
                          right: BorderSide(width: 1, color: Colors.grey),
                          bottom: BorderSide(width: 1, color: Colors.grey),
                          left: BorderSide(width: 1, color: Colors.grey)),),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontStyle: FontStyle.normal),),
                          child: const Text(
                            'REMOVE',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const CheckOutPage()));
                          },
                        ),
                        
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontStyle: FontStyle.normal),),
                          child: const Text(
                            'MOVE TO WISHLIST',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const PaymentsPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                   
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                    ),
                    child: 
                       Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [Text('Price Details',
                              style: TextStyle(fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),),],),
                            const ListTile(
                              leading:
                            Text(
                              'Product Price (1 item)',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                              '\u20B9 7200',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ),
                            const ListTile(
                              leading:
                            Text(
                                'Discount',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                              '\u20B9 2000',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ),
                            const ListTile(
                              leading:
                              Text(
                                'Delivery Charges',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            trailing:Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ),
                              const Divider(height:10,thickness: 3,
                              indent: 0.2,color: Colors.black26,),
                            const ListTile(
                              leading:Text(
                                'Total Amount',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black38,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                              '\u20B9 5200',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ),
                          ],
                    ),
                  ),
                  Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:  [
                       Row(mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [Text('Deliver To:',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),],),
                         Container(
                          margin: const EdgeInsets.only(top: 8,bottom: 8),
                          padding: const EdgeInsets.only(top: 8,bottom: 8),
                     decoration:  BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                       shape: BoxShape.rectangle,
                       color: Colors.white,
                     ),
          
       child: Column(
      children: [RadioListTile(
 title: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 crossAxisAlignment:CrossAxisAlignment.start,
   children: const [
    Text('Abhishek Jaiswal'),
   Text('Shop No.5, A/29,\nBhatt Building,\nOld Nagardas'),
   Text('Andheri (west),Mumbai-400059'),
   ],
 ),
                    value: "", 
              groupValue: '', 
               onChanged: (String? value) {  },
                     ),
                           ],),
                         ),
                           const Chip(
                             shape: ContinuousRectangleBorder(side: BorderSide()),
                             //StadiumBorder(side: BorderSide()),
                             
                             elevation: 20,
                           padding: EdgeInsets.all(8),
                           shadowColor: Colors.blue,
                     label: Text('Add Address'),
                     avatar: Icon(
                       Icons.add,
                       color: Colors.blue,
                     ),
                     backgroundColor: Colors.white,
                   ),
                     ],
                     ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const PaymentsPage()
                          ),
                        
                      );
                    },
                    child: const Text(
                      "PROCEED TO CHECKOUT",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                    ),
                  ),
              ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
 
    LinearGradient grT = const LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = const LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = const Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    
    return false;
  }
}
