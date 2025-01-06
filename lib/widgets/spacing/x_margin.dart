import 'package:flutter/cupertino.dart';

class XMargin extends StatelessWidget {
  final double x;
  const XMargin(this.x);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: x,
    );
  }
}
