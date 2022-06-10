import 'package:flutter/material.dart';
import 'package:heypay/utils/styles.dart';
import 'package:heypay/view_models/view_models.dart';
import 'package:heypay/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ViewModel())],
      child: MaterialApp(
        title: 'Heypay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'DmSans',
            primaryColor: Styles.primaryColor,
            backgroundColor: Styles.primaryColor),
        home: const BottomNav(),
      ),
    );
  }
}
