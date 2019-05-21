import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_animation/ValueChangeAnimation.dart';

import 'ParentingAnimation.dart';
import 'TransformationAnimation.dart';

void main() {
  runApp(MaterialApp(
    title: "animation",
    home: ValueChangeAnimation(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Container(
            child: ListView(
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 80.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(hintText: 'Email id'),
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: 'Password'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.red,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
