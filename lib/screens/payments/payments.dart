import 'package:ecommerce_int2/screens/auth/registeration.dart';
import 'package:ecommerce_int2/screens/main/components/Custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card_new/flutter_credit_card.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
bool? check3 = false;
  bool _expanded = false;
    void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(
        title: "Payments",
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ExpansionPanelList(
                  dividerColor: Colors.grey,
                  expansionCallback: (panelIndex, isExpanded) {
                    _expanded = !_expanded;
                    setState(() {});
                  },
                  animationDuration: const Duration(milliseconds: 1000),
                  elevation: 0,
              children: [
                 ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                         title: Text('Cash On Delivery (Cash/Card/UPI)'),
                         leading: Icon(Icons.money),
                      );
                    },
                    body: const ListTile(
                    ),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                       title: Text('(Credit Card/Debit Card)'),
                      leading: Icon(Icons.credit_card),
                      );
                    },
                    body: Column(
                      children: [
                        CreditCardForm(
                         textStyle: const TextStyle(color: Colors.black),
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          cardNumberDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder',
                          ),  onCreditCardModelChange: onCreditCardModelChange, 
                         
                        ),
                       CheckboxListTile(
                            value: check3,
                            controlAffinity: ListTileControlAffinity
                                .leading, //checkbox at left
                            onChanged: (bool? value) {
                              setState(() {
                                check3 = value;
                              });
                            },
                            title: const Text("Save This card for Payments"),
                          )
                      ],
                    ),
                    isExpanded: true,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text('PhonePay/GooglePay/BHIM UPI'),
                        leading: Icon(Icons.money),
                      );
                    },
                    body: const ListTile(),
                    isExpanded: false,
                  ),
                   ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text('Paytm/PayZap/Amazon Wallet'),
                        leading: Icon(Icons.money),
                      );
                    },
                    body: const ListTile(),
                    isExpanded: false,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return const ListTile(
                        title: Text('Net Banking'),
                        leading: Icon(Icons.money),
                      );
                    },
                    body: const ListTile(),
                    isExpanded: false,
                  ),
                  ],),
                  const ListTile(
                title: Text('Gift Card'),
                leading: Icon(Icons.card_giftcard),
                trailing: InkWell(child: Text('APPLY',style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blueAccent),),),
              ),
               const ListTile(
                title: Text('Bank Offer'),
                leading: Icon(Icons.wallet_giftcard),
                subtitle: Text('5% Extra cash back on Axis Bank Credit card. Terms and Conditions Apply')
              ),
Row(mainAxisAlignment: MainAxisAlignment.start,
  children: const [
        InkWell(child: Text('SHOW MORE',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent),),
          ),
  ],
),
Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
                  Row(
                    children: const [
                      Text(
                        '\u20B9 4150',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        '(View Detail)',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () { showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Column(children: [
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/firstScreen.png'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              maxLines: 3,
                              textScaleFactor: 1.0,
                              text: const TextSpan(
                                text: 'Your Order is Confirmed',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            RichText(
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.justify,
                              softWrap: true,
                              maxLines: 3,
                              textScaleFactor: 0.5,
                              text: const TextSpan(
                                text: 'Your Order No: 201564235895 is Processed,you can find update to your order',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
ElevatedButton(
   style: const ButtonStyle(),
                                child: const Text(
                                  'Continue With Shopping',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegistrationPage()));
                                },
                              ),
                          ]),
                          content: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              InkWell(
                                child: Text(
                                  'View My Orders',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                ),
              );
            },
           
                    child: const Text(
                      "PAY NOW",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                    ),
                  ),

],),
              ],
              ),
              ),
              ),
);
  }
}

                // ExpansionPanel(
                //   headerBuilder: (context, isExpanded) {
                //     return const ListTile(
                //       title: Text('Cash On Delivery (Cash/Card/UPI)'),
                //       leading: Icon(Icons.money),
                //     );
                //   },
                //   body: const Text('data'),
                // ),
              
            
            // ExpansionPanelList(
            //   dividerColor: Colors.grey,
            //   expansionCallback: (panelIndex, isExpanded) {
            //     _expanded = !_expanded;
            //     setState(() {});
            //   },
            //   animationDuration: const Duration(milliseconds: 1000),
            //   elevation: 0,
            //   children: [
            //     ExpansionPanel(
            //       isExpanded: _expanded,
            //       canTapOnHeader: true,
            //       headerBuilder: (context, isExpanded) {
            //         return const ListTile(
            //           title: Text('(Credit Card/Debit Card)'),
            //           leading: Icon(Icons.credit_card),
            //         );
            //       },
            //       body: 
            // Container(
            //         child: Column(
            //           children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: const [
                        //     Flexible(
                        //       child: Padding(
                        //         padding: EdgeInsets.all(10.0),
                        //         child: TextField(
                        //           keyboardType: TextInputType.number,
                        //           decoration: InputDecoration(
                        //             suffixIcon: Icon(Icons.credit_card),
                        //             contentPadding: EdgeInsets.all(10),
                        //             border: OutlineInputBorder(),
                        //             labelText: "Card Number",
                        //             hintText: "Enter Card Number",
                        //             hintStyle: TextStyle(
                        //                 fontSize: 12, color: Colors.black),
                        //             labelStyle: TextStyle(
                        //                 fontSize: 12, color: Colors.black),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: const [
                        //     Flexible(
                        //       child: Padding(
                        //         padding: EdgeInsets.all(10.0),
                        //         child: TextField(
                        //           keyboardType: TextInputType.number,
                        //           decoration: InputDecoration(
                        //             contentPadding: EdgeInsets.all(10),
                        //             border: OutlineInputBorder(),
                        //             labelText: "Name On Card",
                        //             hintText: "Enter Name",
                        //             hintStyle: TextStyle(
                        //                 fontSize: 12, color: Colors.black),
                        //             labelStyle: TextStyle(
                        //                 fontSize: 12, color: Colors.black),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                       
              //   CreditCardWidget(
              //   height: 1,
              //   cardNumber: cardNumber,
              //   expiryDate: expiryDate,
              //   cardHolderName: cardHolderName,
              //   cvvCode: cvvCode,
              //   showBackView: isCvvFocused,
              //   obscureCardNumber: true,
              //   obscureCardCvv: true, 
              //   onCreditCardWidgetChange: (CreditCardBrand ) {  },
              // ),
              // Expanded(
              //   child: Column(
              //     children: <Widget>[
                    // CreditCardForm(
                    //  textStyle: const TextStyle(color: Colors.black),
                    //   formKey: formKey,
                    //   obscureCvv: true,
                    //   obscureNumber: true,
                    //   cardNumber: cardNumber,
                    //   cvvCode: cvvCode,
                    //   cardHolderName: cardHolderName,
                    //   expiryDate: expiryDate,
                    //   themeColor: Colors.blue,
                    //   cardNumberDecoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Number',
                    //     hintText: 'XXXX XXXX XXXX XXXX',
                    //   ),
                    //   expiryDateDecoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Expired Date',
                    //     hintText: 'XX/XX',
                    //   ),
                    //   cvvCodeDecoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'CVV',
                    //     hintText: 'XXX',
                    //   ),
                    //   cardHolderDecoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Card Holder',
                    //   ),  onCreditCardModelChange: onCreditCardModelChange, 
                     
                    // ),
               
      
    
