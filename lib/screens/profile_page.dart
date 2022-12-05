import 'package:ecommerce_int2/screens/faq_page.dart';
import 'package:ecommerce_int2/screens/intro_page.dart';
import 'package:ecommerce_int2/screens/main/components/Custom_appbar.dart';
import 'package:ecommerce_int2/screens/notifications_page.dart';
import 'package:ecommerce_int2/screens/payments/payments.dart';
import 'package:ecommerce_int2/screens/product/view_product_page.dart';
import 'package:ecommerce_int2/screens/settings/settings_page.dart';
import 'package:ecommerce_int2/screens/tracking_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 
  TextEditingController dateinput = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
final _phoneController = TextEditingController();
  bool _expanded = false;
String otpPin = " ";
  String countryDial = "";
  String verID = " ";



  @override
  void initState() {
    dateinput.text = "";
    username.text = ""; 
    password.text = "";
    super.initState();
  }
String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(
        title: "My Profile",
      ),
      backgroundColor: Colors.white,
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right: 8,),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
               
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/background.jpg'
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text:const TextSpan(
                        text: 'Karishma K',
                        style: TextStyle(
                        fontWeight:FontWeight.bold,
                        color: Colors.white),),),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text:const TextSpan(
                        text:'+ 91 0000000000',
                        style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.white),
                      ),),
                    ),
                  ],
                ),
              ),
              
              ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 1000),
                elevation: 0,
                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: const Text('Personal Information'),
                        subtitle: const Text('Privacy and logout'),
                        leading: Image.asset(
                          'assets/icons/wallet.png',
                          fit: BoxFit.scaleDown,
                          width: 30,
                          height: 30,
                        ),
                      );
                    },
                    body: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextField(
                                  controller: username,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    labelText: "First Name",
                                    hintText: "Enter your first name",
                                    hintStyle: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                    labelStyle: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextField(
                                  controller: password,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    labelText: "Last Name",
                                    hintText: "Enter your last name",
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
                                padding: const EdgeInsets.all(10.0),
                                child: TextField(
                                  controller: password,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    labelText: "Email",
                                    hintText: "Enter your email",
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
   SizedBox(
    width: MediaQuery.of(context).size.width ,
   child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
     const Text("Gender", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Expanded(
            child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Radio(value: 'male', groupValue: gender,onChanged: (value) {
    setState(() { gender = value.toString();});},),
                const Expanded(
                  child: Text('Male'),
                )
              ],
            ),
          ),
          Expanded(
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(value: 'Female', groupValue: gender,onChanged: (value) {
    setState(() { gender = value.toString();});},),
                const Expanded(
                  child: Text('Female'),
                )
              ],
            ),),
     Expanded(
       child: SizedBox(
       height: 70,
      width: 180,
   child: Center(
   child: TextField(
      controller:dateinput, 
      decoration: const InputDecoration(
      border: OutlineInputBorder(),
    suffixIcon: Icon(Icons.calendar_today), 
    labelText: "Date of Birth"),
    readOnly: true,
onTap: () async {DateTime? pickedDate =await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2101));
  if (pickedDate != null) {
    if (kDebugMode) {print(pickedDate);}
    String formattedDate =DateFormat('yyyy-MM-dd').format(pickedDate);
    if (kDebugMode) {print(formattedDate);}
    setState(() {
    dateinput.text =formattedDate;});} 
    else {
      if (kDebugMode) {
      print("Date is not selected"); }}},
      )),
                                ),
     ),
                                    ],
                                  ),
          ],),
    ],
    ),
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
                            RequiredValidator(
                                errorText: "Phone number required"),
                            PatternValidator(r'^(?:[+0][1-9])?[0-9]{10,12}$',
                                errorText: 'Invalid Number'),
                          ]),
                        ),
                      ],
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                dividerColor: Colors.grey,
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ),

              // ListTile(
              //   title: const Text('Pensonal Information'),
              //   subtitle: const Text('Privacy and logout'),
              //   leading: Image.asset(
              //     'assets/icons/wallet.png',
              //     fit: BoxFit.scaleDown,
              //     width: 30,
              //     height: 30,
              //   ),
              //   trailing: const Icon(Icons.arrow_drop_down_outlined,
              //       color: Colors.blue),
              //   onTap: () => Navigator.of(context).push(
              //     MaterialPageRoute(builder: (_) => const WalletPage()),
              //   ),
              // ),
              ListTile(
                title: const Text('Address'),
                subtitle: const Text('Privacy and logout'),
                leading: Image.asset(
                  'assets/icons/wallet.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: const Icon(Icons.arrow_drop_down_outlined,
                    color: Colors.blue),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const PaymentsPage()),
                ),
              ),
              ListTile(
                title: const Text('Wallet'),
                subtitle: const Text('Privacy and logout'),
                leading: Image.asset(
                  'assets/icons/wallet.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => NotificationsPage()),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Shipped'),
                subtitle: const Text('Privacy and logout'),
                leading: Image.asset(
                  'assets/icons/delivery-truck.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const TrackingPage())),
              ),
              const Divider(),
              ListTile(
                title: const Text('Payment'),
                subtitle: const Text('Privacy and logout'),
                leading: Image.asset(
                  'assets/icons/card.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PaymentsPage())),
              ),
              const Divider(),
              ListTile(
                title: const Text('Settings'),
                subtitle: const Text('Privacy and logout'),
                leading: Image.asset(
                  'assets/icons/settings_icon.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const SettingsPage())),
              ),
              const Divider(),
              ListTile(
                title: const Text('Help & Support'),
                subtitle: const Text('Help center and legal support'),
                leading: Image.asset(
                  'assets/icons/support.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.blue,
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('FAQ'),
                subtitle: const Text('Questions and Answer'),
                leading: Image.asset(
                  'assets/icons/faq.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.blue),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const FaqPage())),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
