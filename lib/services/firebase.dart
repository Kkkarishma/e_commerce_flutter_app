import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth authInstance = FirebaseAuth.instance;
//  final User? user = authInstance.currentUser;
//  final uid = user!.uid;


 

















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn googleSignIn = GoogleSignIn();

// String? name;
// String? email;
// String? imageUrl;

// Future<String> signInWithGoogle() async {
 
//        final GoogleSignIn googleSignIn = GoogleSignIn();
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount!.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//         final  authResult = await _auth.signInWithCredential(credential);
//       final  user = authResult.user;

//       assert(user!.email != null);
//   assert(user!.displayName != null);
//   assert(user!.photoURL != null);

//   name = user!.displayName;
//   email = user.email;
//   imageUrl = user.photoURL;

//   if (name!.contains(" ")) {
//     name = name!.substring(0, name!.indexOf(" "));
//   }

//   assert(!user.isAnonymous);
//    assert(await user.getIdToken() != null);


//   final  currentUser = _auth.currentUser!;
//   assert(user.uid == currentUser.uid);

//   return 'Successfully loggedin: $user';
// }



  

// void signOutGoogle() async {
//   await googleSignIn.signOut();
// }































// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class FirebaseService {
  
//    final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
  
//    Future<User?> signInwithGoogle({required BuildContext context}) async {
//     User? user;
//     try {
//        final GoogleSignIn googleSignIn = GoogleSignIn();
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount!.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//         final  authResult = await _auth.signInWithCredential(credential);
//       final  user = authResult.user;

//       assert(!user!.isAnonymous);

//       final  currentUser = _auth.currentUser!;
//       assert(user!.uid == currentUser.uid);
//       await _auth.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       if (kDebugMode) {
//         print(e.message);
//       }
//       rethrow;
//     }
//     return null;
//   }

//   Future<void> signOutFromGoogle() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//   }
// }


  
  