import 'package:ecommerce_int2/screens/auth/otppage.dart';
import 'package:ecommerce_int2/screens/auth/registeration.dart';
import 'package:ecommerce_int2/screens/main/components/Buttons/GoogleButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../main/main_page.dart';


class LoginPage extends StatefulWidget {

   const LoginPage({Key? key,}) : super(key: key);
    
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}
GlobalKey<FormState> _formKey = GlobalKey();
class _LoginPageState extends State<LoginPage> {

Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

 String otpPin = " ";
  String countryDial = "+1";
  String verID = " ";

  int screenState = 0;

 
  final TextEditingController controller = TextEditingController();


TextEditingController phoneController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 150,width: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/firstScreen.png'), fit: BoxFit.fill)),
                        ),
                        ),
                   RichText(overflow: TextOverflow.ellipsis,
                   textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 1,
                textScaleFactor: 1.5,
                text: const TextSpan(
                  text: 'Login',
                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),
                ),
                    ),
                    Row(
                      children: const [
                Text('Enter Mobile Number'),
                    ],),
                   const Divider(),
                   IntlPhoneField(
                      textAlign: TextAlign.justify,
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      showCountryFlag: false,
                      showDropdownIcon: false,
                      initialValue: countryDial,
                      onCountryChanged: (country) {
                        setState(() {
                          countryDial = "+${country.dialCode}";
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Phone number required"),
                        PatternValidator(r'^(?:[+0][1-9])?[0-9]{10,12}$',
                            errorText: 'Invalid Number'),
                      ]),
                    ),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ElevatedButton(
                                style: const ButtonStyle(),
                                child: const Text(
                                  'LOG IN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const OtpPage()));
                            }
                                  
                                },
                              ),
                      ],
                    ),
                  const Divider(height:5,thickness: 1,color: Colors.white,),
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Divider(),
                   const Center(
                    child: GoogleButton(),),
                  const Divider(),
                  Center(
                    child: SignInButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      Buttons.Facebook,
                      onPressed: () {
                        signInWithFacebook();
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                              });
                      },
                    ),
                  ),
                ],
                  ),
                 const Divider(),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  InkWell(
              onTap: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const RegistrationPage()));
                          },
              child: RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              softWrap: true,
              maxLines: 1,
              textScaleFactor: 1,
              text: const TextSpan(
                  text: 'Don’t have an account?  ',
                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Signup', style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                  ],
              ),
              ),
                  ),
                 ],),
                  ],
                  ),
              ),
            ),
          ),
        ),
              ),
    );
    
  }
}
