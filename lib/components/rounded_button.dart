import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final double borderRadius;
  final double horizontalPadding;
  final void Function()? onPress;
  final String text;
  final Color textColor;
  const RoundedButton({Key? key, this.color = Colors.green, this.borderRadius = 18, this.horizontalPadding = 18, required this.onPress, required this.text, this.textColor = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: MaterialButton(
        onPressed: onPress,
        color: color,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge?.apply(color: textColor),),),
    );
  }
}
