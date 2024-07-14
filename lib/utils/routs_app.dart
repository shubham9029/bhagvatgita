import 'package:bhagvatgita/screen/detail/view/detail_screen.dart';
import 'package:bhagvatgita/screen/home/view/home_screen.dart';
import 'package:bhagvatgita/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder>routs_app={
  '/':(context)=>SplashScreen(),
  'home':(context)=>HomeScreen(),
  'detail':(context)=>DetailScreen(),
};