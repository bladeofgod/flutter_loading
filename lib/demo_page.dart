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
  void dispose() {
    outerController?.dispose();
    innerController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    outerController = AnimationController(vsync: this,duration: Duration(milliseconds:3000));
    innerController = AnimationController(vsync: this,duration: Duration(milliseconds: 2000));

    outerAnim = Tween(begin: 0.0,end: 2.0).animate(outerController);
    innerAnim = Tween(begin: 1.0,end: 0.0).animate(innerController);
    innerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("completed");
        innerController.reset();
        innerController.forward();
      } else if (status == AnimationStatus.dismissed) {
        print("dismissed");
        innerController.forward();
      } else if (status == AnimationStatus.forward) {
        print("forward");
      } else if (status == AnimationStatus.reverse) {
        print("reverse");
      }
    });
    outerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print("completed");
        outerController.reset();
        outerController.forward();
      } else if (status == AnimationStatus.dismissed) {
        print("dismissed");
        outerController.forward();
      } else if (status == AnimationStatus.forward) {
        print("forward");
      } else if (status == AnimationStatus.reverse) {
        print("reverse");
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    if(!outerController.isAnimating)outerController.forward();
    if(!innerController.isAnimating)innerController.forward();
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              RotationTransition(
                turns:outerAnim ,
                child: Container(
                  width: 100,
                  height: 100,
                  child: CustomPaint(
                    painter: OuterPainter(),
                  ),
                ),
              ),
              RotationTransition(
                turns: innerAnim,
                child: Container(
                  width: 86,
                  height: 86,
                  child: CustomPaint(
                    painter: InnerPainter(),
                  ),
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
    paint.color = Color.fromRGBO(51, 51, 51, 1);
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
    paint.color = Color.fromRGBO(186, 56, 44, 1);
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



















