import 'package:flutter/material.dart';

class ValueChangeAnimation extends StatefulWidget {
  @override
  _ValueChangeAnimationState createState() => _ValueChangeAnimationState();
}

class _ValueChangeAnimationState extends State<ValueChangeAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  int count = 0;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);

    animation = IntTween(begin: count, end: count+10).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Loading....'),
                  Text(animation.value.toString(), style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold) ),
                  RaisedButton(
                    child: Text('Play Again',style: TextStyle(fontSize: 20.0)),
                    onPressed: (){
                      animationController.reverse();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
