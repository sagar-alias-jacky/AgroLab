import 'package:flutter/material.dart';

class RBITB extends StatelessWidget {
  RBITB(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.size,
      required this.text,
      this.icon})
      : super(key: key);

  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  IconData? icon;
  double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class Neu_RBTI extends StatelessWidget {
  Neu_RBTI(
      {Key? key,
      required this.textColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.onTap,
      required this.isButtonPressed,
      this.icon,
      required this.size})
      : super(key: key);

  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final onTap;
  bool isButtonPressed;
  IconData? icon;
  double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isButtonPressed ? Colors.grey.shade300 : backgroundColor,
          ),
          boxShadow: isButtonPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-6, -6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
        duration: Duration(milliseconds: 200),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: size / 2,
                color: isButtonPressed ? Colors.red[200] : Colors.red,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: size / 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
