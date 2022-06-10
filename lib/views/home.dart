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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final size = Layouts.getSize(context);

    return Material(
        color: ColorManager.bgColor(context),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(getProportionateScreenHeight(50.0)),
                greetingBar(context),
                const Gap(25.0),
                mainCard(size, context),
                const Gap(15.0),
                shortcutView(context),
                const Gap(20.0),
                transactionsHeaderView(context),
                transactionsListView(context)
              ],
            ),
          ),
        ));
  }

  MediaQuery transactionsListView(BuildContext context) {
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
            ? Icon(transaction['icon'],
                color: const Color(0xFFFF736C), size: 20)
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

Widget mainCard(dynamic size, BuildContext context) {
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
                color: ColorManager.cardColor(context)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                Assets.cardsVisaYellow,
                width: 60,
                height: 50,
                fit: BoxFit.cover,
              ),
              const Text(
                '\330.00 USD',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.white),
              ),
              const Gap(20),
              Text('CARD NUMBER',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 12)),
              const Gap(5),
              const Text('3829 4820 4629 5025',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ]),
          ),
          Container(
            width: size.width * 0.27,
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(15),
              ),
              color: Styles.yellowColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Styles.greenColor,
                  ),
                  child: const Icon(
                    Icons.swipe_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const Spacer(),
                const Text('VALID', style: TextStyle(fontSize: 12)),
                const Gap(5),
                const Text('05/22', style: TextStyle(fontSize: 15)),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
