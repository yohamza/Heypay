import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heypay/utils/color_manager.dart';
import 'package:heypay/utils/styles.dart';
import 'package:heypay/view_models/view_models.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? callback;
  final Color color;
  final bool? isDarkMode;
  final BuildContext context;

  const CustomListTile(
      {Key? key,
      required this.icon,
      required this.title,
      this.callback,
      required this.color,
      this.isDarkMode,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ViewModel vm = context.watch<ViewModel>();
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 2),
      leading: Container(
        width: 42,
        height: 42,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorManager.accentColor(context),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 18),
      ),
      minLeadingWidth: 50,
      horizontalTitleGap: 13,
      title: Text(title,
          style:
              TextStyle(fontSize: 17, color: ColorManager.textColor(context))),
      trailing: isDarkMode == true
          ? CupertinoSwitch(
              thumbColor: Styles.blueColor,
              activeColor: ColorManager.activeColor(context),
              trackColor: ColorManager.activeColor(context),
              value: vm.isDark,
              onChanged: (v) {
                vm.setPrefBool('isDark', v);
                vm.getPrefBool('isDark');
                vm.setToDark();
              },
            )
          : Icon(CupertinoIcons.arrow_right,
              color: ColorManager.textColor(context)),
      onTap: callback,
    );
  }
}
