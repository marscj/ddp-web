import 'package:flutter/material.dart';

class HoverTextButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final Widget child;

  HoverTextButton({
    Key? key,
    required this.child,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  State<HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<HoverTextButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: widget.child,
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: _hover
              ? MaterialStateProperty.all(Colors.blue)
              : MaterialStateProperty.all(widget.color ?? Colors.black87)),
      onHover: (value) {
        setState(() {
          _hover = value;
        });
      },
    );
  }
}
