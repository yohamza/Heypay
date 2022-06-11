import 'package:flutter/material.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/styles.dart';

inputDecoration(
    {String? text,
    IconData? prefixIcon,
    Widget? suffixIcon,
    required BuildContext context}) {
  return InputDecoration(
    hintText: text,
    hintStyle: TextStyle(color: ColorManager.fieldColor(context)),
    prefixIcon: prefixIcon == null
        ? null
        : Icon(
            prefixIcon,
            color: Styles.primaryColor,
          ),
    suffixIcon: suffixIcon,
    contentPadding: prefixIcon == null
        ? const EdgeInsets.only(top: 15, left: 15)
        : const EdgeInsets.only(top: 0),
    focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.fieldColor(context), width: 1.6),
        borderRadius: BorderRadius.circular(10)),
    border: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.fieldColor(context), width: 1.6),
        borderRadius: BorderRadius.circular(10)),
    enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.fieldColor(context), width: 1.6),
        borderRadius: BorderRadius.circular(10)),
  );
}
