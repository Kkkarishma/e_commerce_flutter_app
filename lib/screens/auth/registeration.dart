import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_int2/screens/main/main_page.dart';
import 'package:ecommerce_int2/services/firebase.dart';
import 'package:ecommerce_int2/services/global_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

String otpPin = " ";
String countryDial = "";
String verID = " ";

class _RegistrationPageState extends State<RegistrationPage> {

  
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  final GlobalKey<FormState> _formKey = GlobalKey();
String? phonenumber;
     String? password;

  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _phoneController = TextEditingController();
  
@override
  void initState() {
    super.initState();
     
  }

bool _isLoading = false;

bool _isObscure = true;


@override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _phoneController.dispose();
    super.dispose();
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
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              controller: _fullNameController,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Name required"),
                                MinLengthValidator(6,
                                    errorText:
                                        "Name must be at least of 6 chars"),
                              ]),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                labelText: "Name",
                                hintText: "Enter Name",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                labelStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Email required"),
                                EmailValidator(
                                    errorText: "Please insert a valid email")
                              ]),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                labelText: "Email",
                                hintText: "Enter Email ID",
                                hintStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                labelStyle: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              onChanged: (val) => password = val,
                              // assign the the multi validator to the TextFormField validator
                              validator: passwordValidator,
                              obscureText: _isObscure,
                              decoration:  InputDecoration(
                                suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }),
                                prefixIcon: const Icon(Icons.password),
                                contentPadding: const EdgeInsets.all(10),
                                border: const OutlineInputBorder(),
                                labelText: "Password",
                                hintText: "Enter Password",
                                hintStyle: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                                labelStyle: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              controller: _passTextController,
                              // using the match validator to confirm password
                              validator: (val) => MatchValidator(
                                      errorText: 'passwords do not match')
                                  .validateMatch(val!, password??''),
                              obscureText: _isObscure,
                              decoration:  InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    }),
                                prefixIcon: const Icon(Icons.password),
                                contentPadding: const EdgeInsets.all(10),
                                border: const OutlineInputBorder(),
                                labelText: "RE-Password",
                                hintText: "Enter RE-Password",
                                hintStyle: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                                labelStyle: const TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IntlPhoneField(
                      textAlign: TextAlign.justify,
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
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
                          borderRadius: BorderRadius.circular(10),
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
                            'SIGN UP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () {
                             _submitFormOnRegister(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _submitFormOnRegister(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await authInstance.createUserWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passTextController.text.trim());
           
        final User? user = authInstance.currentUser;
        final uid = user!.uid;
        user.updateDisplayName(_fullNameController.text);
        user.reload();
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'id': uid,
          'name': _fullNameController.text.toLowerCase(),
          'email': _emailTextController.text.toLowerCase(),
          'phonenumber':_phoneController.text.toString().trim(),
          'shipping-address': '',
          'userWish': [],
          'userCart': [],
          'createdAt': Timestamp.now(),
        });
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ),
        );
        if (kDebugMode) {
          print('Succefully registered');
        }
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
