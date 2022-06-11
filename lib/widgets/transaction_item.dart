import 'package:flutter/material.dart';
import 'package:heypay/utils/color_manager.dart';

ListTile transactionItem(
    BuildContext context, int index, Map<String, dynamic> transaction) {
  return ListTile(
    isThreeLine: true,
    minLeadingWidth: 10,
    minVerticalPadding: 20,
    contentPadding: const EdgeInsets.all(0),
    leading: Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorManager.accentColor(context),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.white.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
        image: index == 0
            ? null
            : DecorationImage(
                image: AssetImage(transaction['avatar']),
                fit: BoxFit.cover,
              ),
        shape: BoxShape.circle,
      ),
      child: index == 0
          ? Icon(transaction['icon'], color: const Color(0xFFFF736C), size: 20)
          : const SizedBox(),
    ),
    title: Text(transaction['name'],
        style: TextStyle(
            color: ColorManager.textColor(context),
            fontWeight: FontWeight.w500)),
    subtitle: Text(transaction['date'],
        style: TextStyle(color: ColorManager.subTextColor(context))),
    trailing: Text(transaction['amount'],
        style: const TextStyle(fontSize: 17, color: Colors.white)),
  );
}
