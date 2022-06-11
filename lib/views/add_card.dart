import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:heypay/utils/assets.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/layouts.dart';
import 'package:heypay/utils/size_config.dart';
import 'package:heypay/utils/styles.dart';
import 'package:heypay/widgets/buttons.dart';
import 'package:heypay/widgets/default_text_field.dart';
import 'package:heypay/widgets/my_app_bar.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _cardHolderName = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  List paymentCardsList = [
    Assets.cardsVisa,
    Assets.cardsMastercard,
    Assets.cardsPaypal,
    Assets.cardsPaionner
  ];

  int selectedCard = 0;

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    final cardSize = size.height * 0.23;
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: ColorManager.bgColor(context),
      appBar: myAppBar(title: 'Add Card', implyLeading: true, context: context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          cardDisplay(cardSize),
          const Gap(20),
          cardSelectView(context),
          const Gap(30),
          DefaultTextField(
              controller: _cardHolderName, title: 'Card Holder Name'),
          DefaultTextField(
              controller: _cardNumber,
              title: 'Card Number',
              label: '5632-1587-536-256'),
          Row(
            children: const [
              Flexible(
                child: DefaultTextField(title: 'Expiry date', label: '05/2022'),
              ),
              Gap(10),
              Flexible(
                child: DefaultTextField(
                    title: 'CVC/CVV', label: '******', obscure: true),
              ),
            ],
          ),
          const Gap(10),
          elevatedButton(
              color: ColorManager.selectedItemColor(context),
              context: context,
              callback: () {
                Navigator.pop(context);
              },
              text: 'Add Card'),
          const Gap(30),
        ],
      ),
    );
  }

  Row cardSelectView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: paymentCardsList.map<Widget>((paymentCard) {
        return MaterialButton(
          elevation: 0,
          color: ColorManager.accentColor(context),
          minWidth: 70,
          height: 100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(paymentCard), fit: BoxFit.contain),
                ),
              ),
              const Gap(20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: Icon(
                  selectedCard == paymentCardsList.indexOf(paymentCard)
                      ? Icons.check_circle
                      : Icons.circle_outlined,
                  color: selectedCard == paymentCardsList.indexOf(paymentCard)
                      ? ColorManager.selectedItemColor(context)
                      : Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              selectedCard = paymentCardsList.indexOf(paymentCard);
            });
          },
        );
      }).toList(),
    );
  }

  SizedBox cardDisplay(cardSize) {
    return SizedBox(
      width: double.infinity,
      height: cardSize,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 20, 20),
            height: cardSize * 0.35,
            decoration: BoxDecoration(
              color: Styles.greenColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Assets.cardsVisaYellow,
                  width: 65,
                  height: 45,
                  fit: BoxFit.cover,
                ),
                const Text('\$00.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 0, 20),
            width: double.infinity,
            height: cardSize * 0.65,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(15)),
                color: Styles.yellowColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userDataColumn(
                    title: 'CARD NUMBER', subtitle: '**** **** **** ****'),
                const Spacer(),
                Row(
                  children: [
                    userDataColumn(title: 'CARD HOLDER NAME', subtitle: 'N/A'),
                    const Gap(40),
                    userDataColumn(title: 'VALID', subtitle: 'N/A')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget userDataColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: const TextStyle(fontSize: 12)),
        const Gap(2),
        Text(subtitle, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
