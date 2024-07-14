import 'package:bhagvatgita/screen/home/provider/home_provider.dart';
import 'package:bhagvatgita/utils/routs_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider.value(value: HomeProvider())],
    child: Consumer<HomeProvider>(builder: (context, value, child) {
      value.getTheme();

      value.theme = value.onTheme;
      value.isOn == value.theme;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routs_app,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: value.mode,
      );
    }),
  ));
}