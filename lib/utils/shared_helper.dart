import 'package:shared_preferences/shared_preferences.dart';

void saveTheme({required bool isTheme})
async{
  SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  sharedPreferences.setBool("theme", isTheme);
}

Future<bool?> applyTheme() async
{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool("theme");
}