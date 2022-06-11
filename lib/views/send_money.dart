import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:heypay/utils/assets.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/size_config.dart';
import 'package:heypay/widgets/buttons.dart';
import 'package:heypay/widgets/my_app_bar.dart';
import 'dart:math' as math;

import 'package:heypay/widgets/people_slider.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: ColorManager.bgColor(context),
      appBar:
          myAppBar(title: 'Send Money', implyLeading: false, context: context),
      bottomSheet: Container(
        color: ColorManager.bgColor(context),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: elevatedButton(
          color: ColorManager.selectedItemColor(context),
          context: context,
          callback: () {
            Navigator.pop(context);
          },
          text: 'Send Money',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          sendMoneyMainCard(context),
          const Gap(20),
          const PeopleSlider(),
          const Gap(10),
          sendMoneyAmountCard(context),
        ],
      ),
    );
  }

  Container sendMoneyAmountCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorManager.accentColor2(context),
          border: Border.all(color: ColorManager.accentColor(context))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\160.00',
                    style: TextStyle(
                        color: ColorManager.titleColor(context),
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: ColorManager.dividerColor(context),
                    ),
                    child: Row(
                      children: [
                        Text('USD',
                            style: TextStyle(
                                color: ColorManager.titleColor(context),
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        const Gap(8),
                        Icon(CupertinoIcons.chevron_down,
                            color: ColorManager.titleColor(context), size: 18)
                      ],
                    )),
              ],
            ),
          ),
          Divider(color: ColorManager.dividerColor(context), thickness: 2),
          Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text('Send Money Purpose',
                  style: TextStyle(color: ColorManager.subTextColor(context)))),
          const Gap(10),
        ],
      ),
    );
  }

  Stack sendMoneyMainCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorManager.headerColor2(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.cardsVisaWhite,
                      width: 60, height: 45, fit: BoxFit.cover),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, right: 5),
                    child: Text('\1000.00 DHS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.white)),
                  ),
                ],
              ),
              const Gap(24),
              customColumn(
                  title: 'CARD NUMBER', subtitle: '3829 4820 4629 5025'),
              const Gap(15)
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 70,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(50)),
              color: ColorManager.bgColor(context),
            ),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.headerColor2(context),
              ),
              child: Icon(Icons.keyboard_backspace_rounded,
                  color: Colors.white.withOpacity(0.5), size: 18),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 18,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(50)),
              color: ColorManager.bgColor(context),
            ),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.headerColor2(context),
              ),
              child: Transform.rotate(
                angle: math.pi,
                child: const Icon(Icons.keyboard_backspace_rounded,
                    color: Colors.white, size: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(),
            style:
                TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.5))),
        const Gap(2),
        Text(subtitle,
            style:
                TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8))),
      ],
    );
  }
}
