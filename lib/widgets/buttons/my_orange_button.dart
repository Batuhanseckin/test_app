import 'package:flutter/material.dart';

class MyOrangeButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function onPress;

  const MyOrangeButton({
    Key key,
    this.text,
    this.onPress,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          primary: Color(0xFFFE5301),
        ),
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }
}
