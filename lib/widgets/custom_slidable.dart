import 'package:flutter/material.dart';

class CustomSlidable extends StatefulWidget {
  final Widget foreground;
  final Widget background;
  final double actionWidth;
  final double borderRadius;

  const CustomSlidable({
    Key? key,
    required this.foreground,
    required this.background,
    required this.borderRadius,
    this.actionWidth = 100,
  }) : super(key: key);

  @override
  _CustomSlidableState createState() => _CustomSlidableState();
}

class _CustomSlidableState extends State<CustomSlidable> {
  double _slideOffset = 0;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _slideOffset += details.primaryDelta!;
      _slideOffset = _slideOffset.clamp(-widget.actionWidth, 0);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      _slideOffset = (_slideOffset.abs() > widget.actionWidth / 2)
          ? -widget.actionWidth
          : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: GestureDetector(
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: Stack(
          children: [
            // Background
            widget.background,

            // Foreground with translation
            Transform.translate(
              offset: Offset(_slideOffset, 0),
              child: widget.foreground,
            ),
          ],
        ),
      ),
    );
  }
}


