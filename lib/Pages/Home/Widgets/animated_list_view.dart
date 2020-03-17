import 'package:flutter/material.dart';
import 'package:flutter_login_animation/Pages/Home/Widgets/list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  const AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Estudar Flutter 3",
          subtitle: "Animações!",
          image: AssetImage("assets/images/profile.jpeg"),
          margin: listSlidePosition.value * 3,
        ),
        ListData(
          title: "Estudar Flutter",
          subtitle: "Animações!",
          image: AssetImage("assets/images/profile.jpeg"),
          margin: listSlidePosition.value * 2,
        ),
        ListData(
          title: "Estudar Flutter 2",
          subtitle: "Animações!",
          image: AssetImage("assets/images/profile.jpeg"),
          margin: listSlidePosition.value * 1,
        ),
        ListData(
          title: "Estudar Flutter 3",
          subtitle: "Animações!",
          image: AssetImage("assets/images/profile.jpeg"),
          margin: listSlidePosition.value * 0,
        ),
      ],
    );
  }
}
