import 'package:ecommerce_int2/screens/auth/registeration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
   final String? phone;
   
  const OtpPage({
    Key? key,  this.phone,
  }) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}
GlobalKey<FormState> _formKey = GlobalKey();
String? _verificationCode;
String otpPin = " ";
String countryDial = "";
String verID = " ";

int screenState = 0;
TextEditingController textEditingController = TextEditingController();

TextEditingController phoneController = TextEditingController();

class _OtpPageState extends State<OtpPage> {
   
final List <TextEditingController> myController =  [];

 Future _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationPage()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (kDebugMode) {
            print(e.message);
          }
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
  
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
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
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/firstScreen.png'),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      RichText(
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 1,
                        textScaleFactor: 1.5,
                        text: const TextSpan(
                          text: 'Verify with OTP',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Enter OTP',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const Divider(),
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        onChanged: (value) {
                          setState(() {
                            otpPin = value;
                          });
                        },
                        pastedTextStyle: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),

                        obscureText: true,
                        obscuringCharacter: '*',
                        obscuringWidget: const FlutterLogo(
                          size: 10,
                        ),
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Enter The OTP";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 30,
                          fieldWidth: 30,
                          activeFillColor: Colors.white,
                          activeColor: Colors.blue,
                          selectedColor: Colors.blue,
                          inactiveColor: Colors.black26,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: false,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        // boxShadows: const [
                        //   BoxShadow(
                        //     offset: Offset(0, 0),
                        //     color: Colors.black12,
                        //     blurRadius: 10,
                        //   )
                        // ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text('Resend OTP',
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                      ],),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '01:56',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            style: const ButtonStyle(),
                            child: const Text(
                              'VERIFY',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              }
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (context) => const RegistrationPage()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}