import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heypay/data/fin_card_model.dart';
import 'package:heypay/utils/assets.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/styles.dart';

Widget financialCard(
    {required dynamic size, required BuildContext context, FinCard? cardData}) {
  return FittedBox(
    child: SizedBox(
      height: size.height * 0.23,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.67,
            padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(15)),
                color: ColorManager.finCardLeftSectionColorByCard(
                    cardData?.cardType, context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                cardData?.cardAssetImage ?? Assets.cardsVisaYellow,
                width: 60,
                height: 50,
                fit: BoxFit.cover,
              ),
              Text(
                cardData?.amountText ?? '\330.00 USD',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: ColorManager.finCardLeftSectionTextColorByCard(
                        cardData?.cardType, context)),
              ),
              const Gap(15),
              Text('CARD NUMBER',
                  style: TextStyle(
                      color: ColorManager.finCardLeftSectionTextColorByCard(
                          cardData?.cardType, context),
                      fontSize: 12)),
              const Gap(5),
              Text('3829 4820 4629 5025',
                  style: TextStyle(
                      color: ColorManager.finCardLeftSectionTextColorByCard(
                          cardData?.cardType, context),
                      fontSize: 15)),
            ]),
          ),
          Container(
            width: size.width * 0.27,
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(15),
              ),
              color: ColorManager.finCardRightSectionColorByCard(
                  cardData?.cardType, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.finCardRightShapeColor(
                          cardData?.cardType, context)),
                  child: Icon(
                    Icons.swipe_rounded,
                    color: ColorManager.finCardRightIconColor(
                        cardData?.cardType, context),
                    size: 20,
                  ),
                ),
                const Spacer(),
                Text('VALID',
                    style: TextStyle(
                        fontSize: 12,
                        color: ColorManager.finCardRightSectionTextColorByCard(
                            cardData?.cardType, context))),
                const Gap(5),
                Text(cardData?.validThrough ?? '05/22',
                    style: TextStyle(
                        fontSize: 15,
                        color: ColorManager.finCardRightSectionTextColorByCard(
                            cardData?.cardType, context))),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
