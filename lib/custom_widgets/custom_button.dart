import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final double width;
  final double fontSizes;
  final String btnTitle;
  final Color titleColor;
  final Function onTap;

   const CustomButton({
    Key? key,
    required this.color,
    required this.btnTitle,
    required this.width,
    required this.fontSizes,
    required this.titleColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onTap();
      },
      //hoverColor: hoverColor,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          btnTitle,
          style: TextStyle(
            color: titleColor,
            fontSize: size.width * fontSizes,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
