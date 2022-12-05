import 'package:ecommerce_int2/screens/auth/login.dart';
import 'package:ecommerce_int2/services/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

late AnimationController _lottieAnimation;
  var expanded = false;
  final double _bigFontSize =  80;
  final transitionDuration = const Duration(seconds: 2);

  // late Animation<double> opacity;
  // late AnimationController controller;


  
  @override
  void initState() {

final User? user = authInstance.currentUser;

_lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    Future.delayed(const Duration(seconds: 2))
        .then((value) async=> setState(() => expanded = true))
        .then((value) async=> const Duration(seconds: 2))
        .then(
          (value)async => Future.delayed(const Duration(seconds: 2)).then(
   (value) async=> _lottieAnimation.forward().then(
        (value) async=> Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>   const LoginPage()), (route) => false),
                ),
                
          ),
        );

    super.initState();
    // controller = AnimationController(
    //   lowerBound: 50,
    //   upperBound: 100,
    //   reverseDuration: const Duration(seconds: 2),
    //     duration: const Duration(seconds: 2), vsync: this);
    // opacity = Tween<double>(begin: 1.0, end: 1.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {});
    //   });
    // controller.forward().then((_) {
    //   navigationPage();
    // });
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) =>   const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                color: Colors.blue,
                fontSize: !expanded ? _bigFontSize : 40,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
              child: const Text(
                "E",
              ),
            ),
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Commerce",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        LottieBuilder.asset(
          'assets/shopping.json',
          onLoaded: (composition) {
            _lottieAnimation.duration = composition.duration;
          },
          frameRate: FrameRate.max,
          repeat: false,
          animate: false,
          height: 100,
          width: 100,
          controller: _lottieAnimation,
        )
      ],
    );
  }
}
    //Scaffold(
      // body: Stack(
      //   fit: StackFit.passthrough,
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.all(10),
      //       decoration: const BoxDecoration(color: Colors.white),
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Expanded(
      //           flex: 2,
      //           child: Center(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: const [
      //                 CircleAvatar(
      //                   backgroundColor: Colors.white,
      //                   radius: 50.0,
      //                   child: Icon(
      //                     Icons.local_grocery_store,
      //                     color: Colors.blue,
      //                     size: 50.0,
      //                   ),
      //                 ),
      //                 Padding(padding: EdgeInsets.all(10.0)),
      //                 Text(
      //                   "ShoppingKart",
      //                   style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 24.0,
      //                       color: Colors.black),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    //);
   // }
    //}
//     Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Container(
//           height: 400,
//           width: 200,
//           margin: EdgeInsets.only(top: controller.value),
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                   'assets/logo.png',
//                 ),
//                 fit: BoxFit.fill),
//           ),
//         ),
//       ),
//       );
//   }
// }


