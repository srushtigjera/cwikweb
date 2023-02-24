import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {

  String? hint;
  Function? checkFieldEmpty;
  Function? onChange;
  double? textwidth;
  double? textheight;
  Widget? suffixIcon;
  bool obscureTexts;
  TextInputType? keyboardtype;
  final TextEditingController cntrollers;
  List<TextInputFormatter>? number;

  CustomTextField({Key? key,this.hint, this.checkFieldEmpty,this.onChange,this.textwidth,this.textheight,required this.cntrollers, this.suffixIcon, this.obscureTexts = false,this.keyboardtype,this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * textwidth!,
      height: Get.height * textheight!,
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only( left:Get.height * 0.025, top: Get.height * 0.005 ),
        child: TextFormField(
          inputFormatters: number,
          keyboardType: keyboardtype,
          controller: cntrollers,
          obscureText: obscureTexts,
          decoration: InputDecoration(
           hintText: hint,
           hintStyle: TextStyle(color: AppColors.blackWithOp.withOpacity(0.5)),
           border:InputBorder.none,
           suffixIcon:  suffixIcon
          ),
          validator: (value) => checkFieldEmpty!(value),
          onChanged: (value) => onChange!(value),

    ),
    ),
    );
  }
}



