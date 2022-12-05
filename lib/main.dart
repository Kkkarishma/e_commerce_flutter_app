
import 'package:ecommerce_int2/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'models/cart_model.dart';
import 'models/popularproduct_model.dart';


Future <void> main() async

{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  
   const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider.value(value: CartItems()),
      ChangeNotifierProvider.value(value: PopularPoductsItems())
      ],
      child: MaterialApp( 
        builder: (context, child) => 
      ResponsiveWrapper.builder(
          child,
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: MediaQuery.of(context).size.width,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],),
          title: 'E Commerce ',
          initialRoute: '/',
         
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            canvasColor: Colors.white,
            primarySwatch: Colors.blue,
            fontFamily: "Montserrat",
            ),
            home:const SplashScreen(),
              ),
    );
  }}


  