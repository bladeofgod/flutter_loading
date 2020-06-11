/*
* Author : LiJiqqi
* Date : 2020/6/10
*/

import 'dart:math';

import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return DemoPageState();
  }
  
}

class DemoPageState extends State<DemoPage> with TickerProviderStateMixin {

  AnimationController outerController,innerController;
  Animation outerAnim,innerAnim;

  @override
  void initState() {
    super.initState();
    outerController = AnimationController(vsync: this,duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: OuterPainter(),
                ),
              ),
              Container(
                width: 86,
                height: 86,
                child: CustomPaint(
                  painter: InnerPainter(),
                ),
              ),

            ],
          ),

//          SizedBox(height: 100,width: 1,),


        ],
      ),
    );
  }
}


class OuterPainter extends CustomPainter{


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.blue;
    paint.strokeWidth = 6;
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;

    Rect rect = Rect.fromCircle(center: Offset(size.width/2,size.height/2),radius: size.width/2);
    canvas.drawArc(rect, 0.0, pi/2, false, paint);
    canvas.drawArc(rect, pi, pi/2, false, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

class InnerPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 6;
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;

    Rect rect = Rect.fromCircle(center: Offset(size.width/2,size.height/2),radius: size.width/2);
    canvas.drawArc(rect, 3*pi/2, pi/2, false, paint);
    canvas.drawArc(rect, pi/2, pi/2, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}



















