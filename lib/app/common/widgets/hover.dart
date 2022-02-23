import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const Hover({Key? key, required this.builder}) : super(key: key);

  @override
  _HoverState createState() => _HoverState();
}

class _HoverState extends State<Hover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    // final hovered = Matrix4.identity()..translate(10, 0, 0);
    // final transform = isHovered ? hovered : Matrix4.identity();

    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: widget.builder(isHovered),
      // TweenAnimationBuilder(
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.easeInOut,
      //   tween: isHovered
      //       ? Tween(begin: 1.0, end: 1.1)
      //       : Tween(begin: 1.1, end: 1.0),
      //   builder: (context, double value, child) => Transform.scale(
      //     scale: value,
      //     child: child,
      //   ),
      //   child: widget.builder(isHovered),
      // ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
