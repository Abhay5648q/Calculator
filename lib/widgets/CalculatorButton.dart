import 'package:flutter/material.dart';

class Calculatorbutton extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;
  final Color? color;
  final Icon? icon;
 final Color? textcolor;
  const Calculatorbutton({
    super.key,
    this.text,
    required this.onTap,
    this.color,
    this.icon,
    this.textcolor,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        splashColor: Colors.grey[300],
        child: Center(
          child:
              icon ??
              Text(
              
                text ?? "",
                style: TextStyle(
                  color: textcolor ?? Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}
