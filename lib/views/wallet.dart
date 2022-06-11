import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:heypay/data/fin_card_model.dart';
import 'package:heypay/utils/assets.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/layouts.dart';
import 'package:heypay/views/add_card.dart';
import 'package:heypay/views/home.dart';
import 'package:heypay/widgets/financial_card.dart';
import 'package:heypay/widgets/my_app_bar.dart';

import '../utils/iconly/iconly_bold.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FinCard> cardsList = <FinCard>[
      const FinCard(0, Assets.cardsVisaYellow, 'visa', '\250.00 USD', '05/24'),
      const FinCard(
          1, Assets.cardsMastercard, 'masterCard', '\300.20 USD', '09/25'),
      const FinCard(2, Assets.cardsPaypal, 'paypal', '\145.09 USD', '01/23'),
    ];

    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: ColorManager.bgColor(context),
      appBar:
          myAppBar(title: 'All Cards', implyLeading: false, context: context),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              addNewCardView(context, size),
              const Gap(22),
              cardsListView(cardsList, size)
            ])),
      ),
    );
  }

  ListView cardsListView(List<FinCard> cardsList, size) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: cardsList.length,
      itemBuilder: (context, index) {
        final card = cardsList[index];
        return Column(children: [
          financialCard(size: size, context: context, cardData: card),
          const Gap(10)
        ]);
      },
    );
  }

  Row addNewCardView(BuildContext context, size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (item) => const AddCard())),
          child: Container(
            width: size.width * 0.78,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: ColorManager.accentColor(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.add,
                    color: ColorManager.textColor(context), size: 20),
                const Gap(10),
                Text('ADD NEW CARD',
                    style: TextStyle(color: ColorManager.textColor(context)))
              ],
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorManager.accentColor(context),
          radius: 23,
          child: Icon(IconlyBold.Scan, color: ColorManager.textColor(context)),
        )
      ],
    );
  }
}
