import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';

class OnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const OnHover({Key? key, required this.builder}) : super(key: key);

  @override
  _OnHoverState createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    // on hover animation movement matrix translation

    final hovered = Matrix4.identity()..translate(10, 0, 0);
    final transform = isHovered ? hovered : Matrix4.identity();

    // when user enter the mouse pointer onEnter method will work
    // when user exit the mouse pointer from MouseRegion onExit method will work
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        tween: isHovered
            ? Tween(begin: 1.0, end: 1.1)
            : Tween(begin: 1.1, end: 1.0),
        builder: (context, double value, child) => Transform.scale(
          scale: value,
          child: child,
        ),
        child: widget.builder(isHovered),
      ),
    );
  }

  //used to set bool isHovered to true/false
  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
