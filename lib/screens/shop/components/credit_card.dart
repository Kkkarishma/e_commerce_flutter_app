import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  
  const CreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      width: 250,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.deepPurple[700],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Text(
            'CREDIT CARD',
            style: TextStyle(color: Colors.white),
          ),
          Container(
            height: 25,
            width: 40,
            color: Colors.white,
          ),
          const Text(
            'xxxx - xxxx - xxxx - 4951',
            style: TextStyle(color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Name',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'Karishma',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
