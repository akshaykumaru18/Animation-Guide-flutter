import 'package:flutter/material.dart';

class TransformationAnimation extends StatefulWidget {
  @override
  _TransformationAnimationState createState() => _TransformationAnimationState();
}

class _TransformationAnimationState extends State<TransformationAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation, transformAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    animation = Tween(begin: 10.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
      
      transformAnimation = BorderRadiusTween(
        begin: BorderRadius.circular(125.0),
        end: BorderRadius.circular(0.0)
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeIn 
          )
      );

   

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
   

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: animation.value,
                    height: animation.value,
                    decoration: BoxDecoration(
                      borderRadius: transformAnimation.value,
                      color: Colors.blueAccent
                    ),
                  )
                ),
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: animation.value,
                    height: animation.value,
                    decoration: BoxDecoration(
                      borderRadius: transformAnimation.value,
                      color: Colors.redAccent
                    ),
                  )
                ),
                Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: animation.value,
                    height: animation.value,
                    decoration: BoxDecoration(
                      borderRadius: transformAnimation.value,
                      color: Colors.pinkAccent
                    ),
                  )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
