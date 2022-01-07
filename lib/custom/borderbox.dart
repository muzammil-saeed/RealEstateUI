import 'package:flutter/material.dart';
import 'package:realestateapp/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? width, heigth;

  const BorderBox(
      {Key? key, this.padding, this.width, this.heigth, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GREY.withAlpha(40), width: 2),
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}
