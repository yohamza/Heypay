import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/iconly/iconly_light.dart';

AppBar myAppBar(
    {required String title,
    String? stringColor,
    required bool implyLeading,
    required BuildContext context,
    bool? hasAction}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: ColorManager.textColor(context), fontSize: 18),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: implyLeading == true
        ? Transform.scale(
            scale: 0.7,
            child: IconButton(
              icon: Icon(Icons.keyboard_backspace_rounded,
                  size: 33, color: ColorManager.textColor(context)),
              onPressed: () => Navigator.pop(context),
            ))
        : const SizedBox(),
    actions:
        hasAction == true ? const [Icon(IconlyBroken.Search), Gap(15)] : null,
  );
}
