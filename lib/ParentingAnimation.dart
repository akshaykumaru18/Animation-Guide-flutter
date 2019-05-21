import 'package:flutter/material.dart';

class ParentAnimation extends StatefulWidget {
  @override
  _ParentAnimationState createState() => _ParentAnimationState();
}

class _ParentAnimationState extends State<ParentAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation, childAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 10), vsync: this);

    animation = Tween(begin: -0.25, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    childAnimation = Tween(begin: 25.0, end: 125.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

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
                    child: AnimatedBuilder(
                        animation: childAnimation,
                        builder: (BuildContext context, Widget child) {
                          return Center(
                            child: Container(
                              width: childAnimation.value * 2,
                              height: childAnimation.value * 2,
                              margin: const EdgeInsets.only(top: 80.0),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration:
                                          InputDecoration(hintText: 'Email id'),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      decoration:
                                          InputDecoration(hintText: 'Password'),
                                    ),
                                  ),
                                  Expanded(
                                    child: RaisedButton(
                                      color: Colors.red,
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
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
