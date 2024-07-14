import 'dart:convert';
import 'dart:math';

import 'package:bhagvatgita/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper
{

  Future<List<HomeModel>> shlokData() async
  {
    String jsonString = await rootBundle.loadString("assets/json/verses.json");
    List jsonList =jsonDecode(jsonString);
    List<HomeModel> list=
        jsonList.map((e)=> HomeModel.mapToModel(e)).toList();
    return list;
  }

  Future<List<ChapterModel>> chaptersJson()async
  {

    var jsonString = await rootBundle.loadString("assets/json/chapters.json");
    List json = jsonDecode(jsonString);
    List<ChapterModel> chapterList=json.map((e) => ChapterModel.mapToModel(e),).toList();
    return chapterList;
  }


}