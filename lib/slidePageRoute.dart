import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget child;

  SlidePageRoute({required this.child})
      : super(
            pageBuilder: (context, anim, secondAnim) => child,
            transitionDuration: Duration(milliseconds: 700));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondAnim, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}
