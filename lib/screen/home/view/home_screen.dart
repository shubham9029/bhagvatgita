import 'package:bhagvatgita/screen/home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getJson();
  }
  @override
  Widget build(BuildContext context) {
    providerR=context.read<HomeProvider>();
    providerW=context.watch<HomeProvider>();
    return Scaffold(
            appBar: AppBar(

        title: Text("अध्याय",
          style: TextStyle(
            color: providerR!.theme==true?Colors.white:Colors.black
          ),
        ),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {
                  providerR!.setTheme();

                }, icon: Icon(providerW!.theme==true?Icons.light_mode:Icons.dark_mode))
              ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/image/gita-101.jpg",fit: BoxFit.cover,),
          ListView.builder(
            itemCount: providerW!.l1.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  providerR!.getVerses(providerR!.l1[index].chapter_number!);
                  Navigator.pushNamed(context, "detail");
                  providerR!.changeIndex(index);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: providerR!.theme==true?Colors.black.withOpacity(0.50):Colors.grey.withOpacity(0.50)
                  ),child: Row(
                    children: [
                      Text("  ${providerR!.l1[index].chapter_number} . ",
                          style:TextStyle(
                              fontSize: 25
                          )),
                      Text("${providerR!.l1[index].name}",
                      style:TextStyle(
                        fontSize: 30,
                        color: providerR!.theme==true?Colors.white:Colors.black
                      )
                                    ),
                    ],
                  ),
                ),
              );

          },)
        ],
      ),

    );
  }
}
