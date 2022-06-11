import 'package:flutter/material.dart';
import 'package:heypay/utils/styles.dart';
import 'package:provider/provider.dart';

import '../view_models/view_models.dart';

class ColorManager {
  static Color bgColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.primaryColor : Styles.whiteColor;
  }

  static Color cardColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.greenColor : Styles.accentColor;
  }

  static Color finCardLeftSectionColorByCard(
      String? cardType, BuildContext context) {
    switch (cardType) {
      case 'masterCard':
        return Styles.masterCardGreen;
      case 'visa':
        return Styles.greenColor;
      case 'paypal':
        return Styles.paypalOrange;
      default:
        return Styles.greenColor;
    }
  }

  static Color finCardLeftSectionTextColorByCard(
      String? cardType, BuildContext context) {
    switch (cardType) {
      case 'masterCard':
        return Colors.black.withOpacity(0.7);
      case 'visa':
        return Styles.whiteColor;
      case 'paypal':
        return Styles.whiteColor;
      default:
        return Styles.whiteColor;
    }
  }

  static Color finCardRightSectionTextColorByCard(
      String? cardType, BuildContext context) {
    switch (cardType) {
      case 'masterCard':
        return Styles.whiteColor;
      case 'visa':
        return Colors.black.withOpacity(0.7);
      case 'paypal':
        return Colors.black.withOpacity(0.7);
      default:
        return Colors.black.withOpacity(0.7);
    }
  }

  static Color finCardRightShapeColor(String? cardType, BuildContext context) {
    if (cardType != null) {
      if (cardType == 'masterCard') {
        return Styles.whiteColor;
      } else {
        return Styles.greenColor;
      }
    } else {
      return Styles.greenColor;
    }
  }

  static Color finCardRightIconColor(String? cardType, BuildContext context) {
    if (cardType != null) {
      if (cardType == 'masterCard') {
        return Colors.black.withOpacity(0.7);
      } else {
        return Styles.whiteColor;
      }
    } else {
      return Styles.whiteColor;
    }
  }

  static Color finCardRightSectionColorByCard(
      String? cardType, BuildContext context) {
    switch (cardType) {
      case 'masterCard':
        return Styles.greenColor;
      case 'visa':
        return Styles.yellowColor;
      case 'paypal':
        return Styles.yellowColor;
      default:
        return Styles.yellowColor;
    }
  }

  static Color cardColor2(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.accentColor : Styles.greenColor;
  }

  static Color navbarColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true
        ? Styles.primaryWithOpacityColor
        : Styles.whiteColor;
  }

  static Color selectedItemColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.blueColor : Styles.greenColor;
  }

  static Color textColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.whiteColor : Styles.primaryColor;
  }

  static Color fieldColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.whiteColor.withOpacity(0.5) : Colors.grey;
  }

  static Color headerColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.primaryColor : Styles.greenColor;
  }

  static Color dividerColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.primaryColor : Styles.greyColor;
  }

  static Color subTextColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true
        ? Styles.whiteColor.withOpacity(0.7)
        : Styles.primaryColor.withOpacity(0.7);
  }

  static Color iconColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true
        ? Styles.whiteColor.withOpacity(0.2)
        : Styles.greyColor;
  }

  static Color headerColor2(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true
        ? Styles.primaryWithOpacityColor
        : Styles.greenColor;
  }

  static Color accentColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true
        ? Styles.primaryWithOpacityColor
        : Styles.greyColor;
  }

  static Color accentColor2(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true
        ? Styles.primaryWithOpacityColor
        : Colors.transparent;
  }

  static Color notificationColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.whiteColor : Styles.primaryColor;
  }

  static Color thumbColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.blueColor : Styles.greyColor;
  }

  static Color segmentThumbColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.greyColor : Styles.masterCardGreen;
  }

  static Color segmentbgColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.blueColor : Styles.whiteColor;
  }

  static Color activeColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.whiteColor : Styles.greyColor;
  }

  static Color titleColor(BuildContext context) {
    final vm = context.watch<ViewModel>();
    return vm.isDark == true ? Styles.whiteColor : Styles.greenColor;
  }
}
