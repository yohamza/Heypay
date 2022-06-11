import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:heypay/data/shortcuts_list.dart';
import 'package:heypay/utils/assets.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/iconly/iconly_bold.dart';
import 'package:heypay/utils/styles.dart';
import 'package:heypay/widgets/custom_list_title.dart';

import '../widgets/my_app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgColor(context),
      appBar: myAppBar(title: 'Profile', implyLeading: false, context: context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Gap(30),
          profileCard(context),
          const Gap(35),
          CustomListTile(
              icon: IconlyBold.Profile,
              color: const Color(0xFFC76CD9),
              title: 'Information',
              context: context),
          CustomListTile(
              icon: IconlyBold.Shield_Done,
              color: const Color(0xFF229e76),
              title: 'Security',
              context: context),
          CustomListTile(
              icon: IconlyBold.Message,
              color: const Color(0xFFe17a0a),
              title: 'Contact us',
              context: context),
          CustomListTile(
              icon: IconlyBold.Document,
              color: const Color(0xFF064c6d),
              title: 'Support',
              context: context),
          CustomListTile(
              icon: Icons.dark_mode,
              color: const Color(0xFF0536e8),
              title: 'Dark Mode',
              isDarkMode: true,
              context: context),
        ],
      ),
    );
  }

  Stack profileCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.accentColor(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(60),
                Center(
                    child: Text('AMEER HAMZA',
                        style: TextStyle(
                            color: ColorManager.textColor(context),
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
                const Gap(10),
                Text('hamza.io@hotmail.com',
                    style:
                        TextStyle(color: ColorManager.subTextColor(context))),
                const Gap(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: profilesShortcutList.map<Widget>((e) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.all(13),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(e['icon'], color: e['color']),
                    );
                  }).toList(),
                ),
                const Gap(25)
              ],
            ),
          ),
        ),
        Positioned(
          left: 30,
          right: 30,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Styles.blueColor,
            ),
            child: Transform.scale(
              scale: 0.55,
              child: Image.asset(Assets.memoji7),
            ),
          ),
        )
      ],
    );
  }
}
