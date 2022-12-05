import 'package:flutter/material.dart';

class Colorlistmain extends StatefulWidget {

   final List<Color> colorListt;

  const Colorlistmain(this.colorListt, {Key? key}) : super(key: key);

  

  @override
  State<Colorlistmain> createState() => _ColorlistmainState();


   }

class _ColorlistmainState extends State<Colorlistmain> {

  int active = 0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text('Color',
            style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,),),
          ),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.colorListt.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  setState(() {
                    active = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 4.0, vertical: 8.0),
                  child: Transform.scale(
                    scale: active == index ? 2.0 : 1,
                    child: ColorOptionn(widget.colorListt[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorOptionn extends StatelessWidget {
  final Color color;

 const ColorOptionn(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 10,height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle, 
        color: color),
    );
  }
}
