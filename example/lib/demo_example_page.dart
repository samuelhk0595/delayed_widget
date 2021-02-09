import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

class ComparisonExample extends StatelessWidget {
  ComparisonExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DelayedWidget Demo'),
      ),
      body: PageView(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Demo',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.77),
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 40,
                color: Colors.blue,
              )
            ],
          )),
          demo1(),
          demo2(),
          demo3(),
          demo4(),
          demo5(),
          demo6(),
          demo7()
        ],
      ),
    );
  }

  Center demo7() {
    return Center(
        child: Column(
      children: [
        DelayedWidget(
          animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
          delayDuration: Duration(milliseconds: 500),
          animationDuration: Duration(seconds: 3),
          child: demoContainer(
              child: Align(
            alignment: Alignment.centerRight,
          )),
        ),
        SizedBox(height: 20),
        Text(
          'Animation Duration: 3 seconds',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.77),
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    ));
  }

  Center demo6() {
    return Center(
        child: Column(
      children: [
        DelayedWidget(
          animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
          delayDuration: Duration(seconds: 2),
          child: demoContainer(
              child: Align(
            alignment: Alignment.centerRight,
          )),
        ),
        SizedBox(height: 20),
        Text(
          'DelayDuration: 2 seconds',
          style: TextStyle(
            color: Colors.black.withOpacity(0.77),
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
      mainAxisSize: MainAxisSize.min,
    ));
  }

  Center demo5() {
    return Center(
        child: DelayedWidget(
      animation: DelayedAnimations.SLIDE_FROM_RIGHT,
      delayDuration: Duration(milliseconds: 500),
      child: Column(
        children: [
          demoContainer(
              child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 35,
            ),
          )),
          SizedBox(height: 20),
          Text(
            'Slide From Right',
            style: TextStyle(
              color: Colors.black.withOpacity(0.77),
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    ));
  }

  Center demo4() {
    return Center(
        child: DelayedWidget(
      animation: DelayedAnimations.SLIDE_FROM_LEFT,
      delayDuration: Duration(milliseconds: 500),
      child: Column(
        children: [
          demoContainer(
              child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 35,
            ),
          )),
          SizedBox(height: 20),
          Text(
            'Slide From Left',
            style: TextStyle(
              color: Colors.black.withOpacity(0.77),
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    ));
  }

  Center demo3() {
    return Center(
        child: DelayedWidget(
      animation: DelayedAnimations.SLIDE_FROM_TOP,
      delayDuration: Duration(milliseconds: 500),
      child: Column(
        children: [
          demoContainer(
              child: Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.arrow_downward,
              color: Colors.white,
              size: 35,
            ),
          )),
          SizedBox(height: 20),
          Text(
            'Slide From Top',
            style: TextStyle(
              color: Colors.black.withOpacity(0.77),
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    ));
  }

  Center demo2() {
    return Center(
        child: DelayedWidget(
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      delayDuration: Duration(milliseconds: 500),
      child: Column(
        children: [
          demoContainer(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Icon(
              Icons.arrow_upward,
              color: Colors.white,
              size: 35,
            ),
          )),
          SizedBox(height: 20),
          Text(
            'Slide From Bottom',
            style: TextStyle(
              color: Colors.black.withOpacity(0.77),
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    ));
  }

  Center demo1() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DelayedWidget(
              delayDuration: Duration(seconds: 1), // Not required
              animationDuration: Duration(seconds: 1), // Not required
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
              child: demoContainer(
                child: Text(
                  'ON',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              )),
          demoContainer(
            child: Text(
              'OFF',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget demoContainer({Widget child}) {
    return Container(
        width: 200,
        height: 200,
        color: Colors.red,
        alignment: Alignment.center,
        child: child);
  }
}
