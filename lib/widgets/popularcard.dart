
import 'package:card_swiper/card_swiper.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';

import '../screens/favouritepage/favourite.dart';
import '../screens/notifications_page.dart';
import '../screens/product/components/color_list.dart';
import '../screens/rating/rating_page.dart';
import '../screens/shop/check_out_page.dart';

class Popularcard extends StatefulWidget {
   final String? id;
  final String? productId;
  final double? price;
  final int? quantity;
  final String? name;
  final String? image;
  final String? category;

  const Popularcard({
    Key? key,
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.name,
    this.image,
    this.category,
  }) : super(key: key);

  @override
  State<Popularcard> createState() => _PopularcardState();
}

class _PopularcardState extends State<Popularcard> {
  List<ImageProvider> imageList = <ImageProvider>[];
  bool autoRotate = true;
  int rotationCount = 10;
  int swipeSensitivity = 1;
  bool allowSwipeToRotate = true;
  RotationDirection rotationDirection = RotationDirection.anticlockwise;
  Duration frameChangeDuration = Duration(milliseconds: 80);
  bool imagePrecached = false;
   @override
  void initState() {
    //* To load images from assets after first frame build up.
    WidgetsBinding.instance
        .addPostFrameCallback((_) => updateImageList(context));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

 
    Size size = MediaQuery.of(context).size;
    final SwiperController swiperController = SwiperController();
    final totalPrice = ((widget.price! * widget.quantity!).round());
    final discount=(widget.price!/2).round();
    
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Center(
      child: Container(
        height: MediaQuery.of(context).size.width/2.5,
        width: MediaQuery.of(context).size.width / 4,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          shape: BoxShape.rectangle,
          color: Colors.white,
          boxShadow: [
               BoxShadow(
                color: Colors.lightBlueAccent,
                blurRadius: 0.0,
                 spreadRadius: 0,
                offset: Offset.infinite,
               ),
             ],
                   ),
      //   decoration: BoxDecoration(
      // image: DecorationImage(
      //     image: NetworkImage(
      //        widget.image!,
      //     ),
      //     fit: BoxFit.fill),
      //   ),
        child: (imagePrecached == true)
                    ? ImageView360(
                        key: UniqueKey(),
                        imageList: imageList,
                        autoRotate: autoRotate,
                        rotationCount: rotationCount,
                        rotationDirection: RotationDirection.anticlockwise,
                        frameChangeDuration: Duration(milliseconds: 30),
                        swipeSensitivity: swipeSensitivity,
                        allowSwipeToRotate: allowSwipeToRotate,
                        onImageIndexChanged: (currentImageIndex) {
                          if (kDebugMode) {
                            print("currentImageIndex: $currentImageIndex");
                          }
                        },
                      )
                    : Text("Pre-Caching images..."),
      ),),
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
      widget.category!,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
        ),
        Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: FavoriteButton(
          iconSize: 20,
          isFavorite: false,
          iconDisabledColor: Colors.grey,
          valueChanged: (isFavorite) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const FavouritePage()));
          }),
        ),
        //   child: IconButton(
        //     iconSize: 30,
        //     icon: const Icon(
        //       Icons.favorite,
        //       color: Colors.red,
        //     ),
        //     onPressed: () => Navigator.of(context).push(
        //       MaterialPageRoute(builder: (_) => const FavouritePage()),
        //     ),
        //   ),
        // ),
        IconButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const NotificationsPage()),
      ),
      icon: const Icon(
        Icons.share,
        size: 20,
        color: Colors.grey,
      ),
        ),
      ],
      ),
      FittedBox(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
        maxLines: 5,
        semanticsLabel: '...',
        overflow: TextOverflow.ellipsis,
        widget.name!,
        style: const TextStyle(
            color: Colors.black45,
            fontSize: 14,
            fontWeight: FontWeight.bold),
          ),
        ],
        ),
      ),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
      '\u20B9${widget.price!}',
      style: const TextStyle(
          fontSize: 20,
          decoration: TextDecoration.lineThrough,
          color: Colors.black38,
          fontWeight: FontWeight.bold),
        ),
        Text(
      '\u20B9${totalPrice.toString()}',
      style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold),
        ),
        Text(
      '${discount.round()}% OFF',
      style: const TextStyle(
          fontSize: 16,
          color: Colors.blue,
          fontWeight: FontWeight.bold),
        ),
        Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: StarButton(
        iconSize: 20,
        isStarred: false,
        iconDisabledColor: Colors.grey,
        valueChanged: (isStarred) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const RatingPage()));
        },
      ),
       
        ),
        const Text(
      '4.0(256)',
      style: TextStyle(
          color: Colors.black26,
          fontSize: 16,
          fontWeight: FontWeight.bold),
        ),
      ],
      ),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        Flexible(
      child: ColorList([
        Colors.red,
        Colors.blue,
        Colors.purple,
        Colors.green,
        Colors.yellow
      ]),
        ),
      ],
      ),
       
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[
        Text(
      'Size',
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
        ),
      ],
      ),
       
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
      'UK/India',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black38,
        fontWeight: FontWeight.bold,
      ),
        ),
        for (int i = 6; i < 11; i++)
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 0.8,
                  color: Colors.grey.withOpacity(0.1)),
            ]),
        child: Center(child: Text(i.toString())),
      ),
      ],
      ),
    
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Color',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Black',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Outer material',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Mesh',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Model Name',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Air shoes for',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Ideal For',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'WOMAN',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Occasion',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Party',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Care Instruction',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Gentle wash',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
        ],
      ),
      
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) => ViewProductPage(
        //       product: product,
        //     ),
        //   ),
        // );
      },
      child: const Text(
        "Add to Cart",
        style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
      ),
        ),
        OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: Colors.blue,
      ),
      child: const Text(
        'Buy Now',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () async {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const CheckOutPage()));
      },
        ),
      ],
      ),
        ],),
    );
  }
   void updateImageList(BuildContext context) async {
    for (int i = 1; i <= 20; i++) {
      imageList.add(
        NetworkImage(
          widget.image!,scale: 0.75
        ), 
      );
      //* To precache images so that when required they are loaded faster.
      await precacheImage(NetworkImage(
             widget.image!, scale: 0.75
          ), context);
    }
    setState(() {
      imagePrecached = true;
    });
  }
}
