import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:heypay/data/shortcuts_list.dart';
import 'package:heypay/data/transactions.dart';
import 'package:heypay/utils/assets.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/iconly/iconly_bold.dart';
import 'package:heypay/utils/layouts.dart';
import 'package:heypay/utils/size_config.dart';
import 'package:heypay/utils/styles.dart';
import 'package:heypay/widgets/financial_card.dart';
import 'package:heypay/widgets/transactions_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final size = Layouts.getSize(context);

    return Material(
      color: ColorManager.bgColor(context),
      elevation: 0,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Gap(getProportionateScreenHeight(50.0)),
                  greetingBar(context),
                  const Gap(25.0),
                  financialCard(size: size, context: context),
                  const Gap(15.0),
                  shortcutView(context),
                ],
              )
            ],
          ),
          const Gap(20.0),
          transactionListingView(context)
        ],
      ),
    );
  }

  Container shortcutView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorManager.accentColor(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: shortcutList.map<Widget>((item) {
          return InkWell(
            onTap: () => item['route'] == null
                ? null
                : Navigator.push(
                    context, MaterialPageRoute(builder: (c) => item['route'])),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: item['color'].withOpacity(0.15),
              ),
              child: Icon(item['icon'], color: item['color']),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget greetingBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi HAMZA',
              style: TextStyle(
                  color: ColorManager.textColor(context), fontSize: 16.0),
            ),
            Text(
              'Welcome Back',
              style: TextStyle(
                  color: ColorManager.textColor(context),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Styles.primaryColor),
            child: Icon(
              IconlyBold.Notification,
              color: Styles.whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
