import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/main/components/Custom_appbar.dart';
import 'package:ecommerce_int2/screens/tracking_page.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}


class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {

  List<Product> products = [
    Product('assets/womanshoe_6.png', 'Shoes', 'Beautiful shoes', 2.33, 50, '8'),
   
  ];
   List<Product> products1 = [
   
    Product('assets/shoeman_1.png', 'Shoes', 'Description', 72.33, 40, '8'),
    Product('assets/bag_6.png', 'Bag', 'Bags for you', 20, 50, 'NONE'),
    Product('assets/womanshoe_3.png', 'Woman Shoes','Shoes with special discount', 30, 40, '7'),
    Product('assets/womanshoe_4.png', 'Woman Shoes','Shoes with special discount', 30, 40, '7'),
  ];
   List<Product> products2 = [
   
    Product('assets/womanshoe_3.png', 'Woman Shoes',
        'Shoes with special discount', 30, 40, '7'),
    Product('assets/womanshoe_4.png', 'Woman Shoes',
        'Shoes with special discount', 30, 40, '7'),
  ];
List<String> track=['Pending','Cancelled','Delivered'];
  late final Product product;

  late TabController bottomTabController = TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "My Orders",),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.builder(
                physics: const ScrollPhysics(),
                 shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,),),
                            Text(
                              products[index].description,
                              style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,),),
                            Text(
                              'Size : ${products[index].sizee}',
                              style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,),),
                            Text("\u20B9 ${products[index].price}"),
                          ],
                        ),
                        leading: ClipRRect(
                          child: Container(
                            height: 80,
                            width:80,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                              products[index].image,),
                              fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: 30,),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const TrackingPage()),),
                      ),
                      const Divider(height: 10,thickness: 2,color: Colors.grey,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Delivery on Monday'),
                          Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            elevation: 0,
                            padding: EdgeInsets.all(5),
                            shadowColor: Colors.blue,
                            label: Text('Pending'),
                            
                            backgroundColor: Colors.yellow,
                          ),
                          // ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //     primary: Colors.green,
                          //     textStyle: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 15,
                          //     fontStyle: FontStyle.normal),
                          //     shape: const ContinuousRectangleBorder(side: BorderSide()),),
                          //   child: const Text('Pending',
                          //   style: TextStyle(
                          //   color: Colors.white,
                          //   fontWeight: FontWeight.bold,),),
                          //   onPressed: () async {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (_) => const PaymentsPage()));
                          //   },
                          // ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              ListView.builder(
               physics: const ScrollPhysics(),
                 shrinkWrap: true,
                itemCount: products2.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products2[index].name,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              products2[index].description,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                            Text(
                              'Size : ${products2[index].sizee}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                            Text("\u20B9 ${products2[index].price}"),
                          ],
                        ),
                        leading: ClipRRect(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                    products2[index].image,
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: 30,
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const TrackingPage()),
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Delivery on Monday'),
                          Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            //ContinuousRectangleBorder(side: BorderSide()),
                           
      
                            elevation: 0,
                            padding: EdgeInsets.all(5),
                            shadowColor: Colors.blue,
                            label: Text('Delivered'),
      
                            backgroundColor: Colors.green,
                          ),
                         
                        ],
                      ),
                    ],
                  );
                },
              ),
              ListView.builder(
               physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: products1.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products1[index].name,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              products1[index].description,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                            Text(
                              'Size : ${products1[index].sizee}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                            ),
                            Text("\u20B9 ${products1[index].price}"),
                          ],
                        ),
                        leading: ClipRRect(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                    products1[index].image,
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                          size: 30,
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const TrackingPage()),
                        ),
                      ),
                      const Divider(
                        height: 10,
                        thickness: 2,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Delivery on Monday'),
                          Chip(
                            shape:
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                         
                            elevation: 0,
                            padding: EdgeInsets.all(5),
                            shadowColor: Colors.blue,
                            label: Text('Cancelled'),
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
