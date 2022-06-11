import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heypay/data/transactions.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/widgets/transaction_item.dart';

Widget transactionListingView(BuildContext context) {
  return Column(
    children: [transactionsHeaderView(context), transactionsList(context)],
  );
}

MediaQuery transactionsList(BuildContext context) {
  return MediaQuery.removePadding(
    removeTop: true,
    context: context,
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return transactionItem(context, index, transaction);
      },
    ),
  );
}

Row transactionsHeaderView(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Transactions',
        style: TextStyle(
            color: ColorManager.textColor(context),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      Row(
        children: [
          Text('Today',
              style: TextStyle(
                  color: ColorManager.subTextColor(context), fontSize: 16)),
          const Gap(3),
          Icon(CupertinoIcons.chevron_down,
              color: ColorManager.subTextColor(context), size: 17)
        ],
      )
    ],
  );
}
