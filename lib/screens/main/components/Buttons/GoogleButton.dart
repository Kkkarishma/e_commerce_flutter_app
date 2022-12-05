import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_int2/screens/main/main_page.dart';
import 'package:ecommerce_int2/services/firebase.dart';
import 'package:ecommerce_int2/services/global_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  Future<void> _googleSignIn(context) async {
    
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          final authResult = await authInstance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken),
          );

          if (authResult.additionalUserInfo!.isNewUser) {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(authResult.user!.uid)
                .set({
              'id': authResult.user!.uid,
              'name': authResult.user!.displayName,
              'email': authResult.user!.email,
              'shipping-address': '',
              'phone-number':authResult.user!.phoneNumber,
              'userWish': [],
              'userCart': [],
              'createdAt': Timestamp.now(),
            });
          }
           Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
          );
        } on FirebaseException catch (error) {
           GlobalMethods.errorDialog(
              subtitle: '${error.message}', context: context);
        } catch (error) {
          
          GlobalMethods.errorDialog(subtitle: '$error', context: context);
        } finally {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SignInButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        Buttons.Google,
                        onPressed: ()  {
     _googleSignIn( Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),));
      });
  
    
                   
  }
}
