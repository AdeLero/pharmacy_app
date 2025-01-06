import 'package:flutter/cupertino.dart';

class YMargin extends StatelessWidget {
  final double y;
  const YMargin(this.y);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}
