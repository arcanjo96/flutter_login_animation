import 'package:flutter/material.dart';
import 'package:flutter_login_animation/Pages/Home/Widgets/animated_list_view.dart';
import 'package:flutter_login_animation/Pages/Home/Widgets/fade_container.dart';
import 'package:flutter_login_animation/Pages/Home/Widgets/home_top.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController animationController;

  StaggerAnimation({@required this.animationController})
      : containerGrow =
            CurvedAnimation(parent: animationController, curve: Curves.ease),
        listSlidePosition = EdgeInsetsTween(
                begin: EdgeInsets.only(bottom: 0),
                end: EdgeInsets.only(bottom: 80))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: Interval(0.325, 0.8, curve: Curves.decelerate))),
        fadeAnimation = ColorTween(
          begin: Color.fromRGBO(247, 64, 106, 1.0),
          end: Color.fromRGBO(247, 64, 106, 0.0)
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.ease
          )
        );

  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSlidePosition;
  final Animation<Color> fadeAnimation;

  Widget _buildAnimation(context, Widget child) {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            HomeTop(containerGrow: containerGrow),
            AnimatedListView(
              listSlidePosition: listSlidePosition,
            ),
          ],
        ),
        IgnorePointer(child: FadeContainer(fadeAnimation: fadeAnimation,)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: animationController,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}
