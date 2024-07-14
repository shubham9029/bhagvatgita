import 'package:bhagvatgita/utils/json_helper.dart';
import 'package:bhagvatgita/utils/shared_helper.dart';
import 'package:flutter/material.dart';

import '../model/home_model.dart';

class HomeProvider with ChangeNotifier
{

  JsonHelper helper =JsonHelper();
  List<ChapterModel> l1=[];
  bool isOn=true;
  int index=0;
  List<HomeModel> versesList=[];
  ThemeMode mode=ThemeMode.light;
  bool onTheme=false;
  bool theme=true;
  IconData themeMode=Icons.dark_mode;

  void getJson() async
  {
    l1= await helper.chaptersJson();
    notifyListeners();
    print(l1);
  }
  void changeIndex(int value)
  {
    index=value;
    notifyListeners();
  }

  void getVerses(int id) async
  {
    versesList.clear();
    List<HomeModel> l2=await helper.shlokData();
    for(var i=0;i<l2.length;i++)
      {
        if(l2[i].chapter_number==id)
          {
            versesList.add(l2[i]);
          }
      }
    notifyListeners();
  }

  void setTheme()async
  {
    theme=!theme;
    saveTheme(isTheme: theme);
    onTheme=(await applyTheme())!;
    if(onTheme==true)
      {
        mode=ThemeMode.dark;
        themeMode=Icons.light;
      }
    else if(themeMode==false)
    {
          mode=ThemeMode.light;
          themeMode=Icons.dark_mode;
    }
    else
    {
      mode=ThemeMode.light;
      themeMode=Icons.dark_mode;
    }
    notifyListeners();
  }

  void getTheme()async
  {
   if(await applyTheme()==null){

     onTheme=false;

   }
   else
     {
       onTheme=(await applyTheme())!;
     }
   if(onTheme==true)
     {
       mode=ThemeMode.dark;
       themeMode=Icons.light_mode;
     }
   else if(onTheme==false)
     {
       mode=ThemeMode.light;
       themeMode=Icons.dark_mode;
     }
   else
     {
       mode=ThemeMode.light;
       themeMode=Icons.dark_mode;
     }
    notifyListeners();
  }



}