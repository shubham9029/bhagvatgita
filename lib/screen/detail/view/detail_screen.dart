import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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

    return Scaffold( appBar: AppBar(
      title: Text("${providerW!.l1[providerR!.index].name}",
        style: TextStyle(
            color: providerR!.theme==true?Colors.white:Colors.black
        ),
      ),
      centerTitle: true,
    ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/image/gita-101.jpg",fit: BoxFit.cover,
          opacity: AlwaysStoppedAnimation(0.5),),
         Padding(
           padding: const EdgeInsets.all(15),
           child: Column(
             children: [
               Image.asset("assets/image/bhh.jpeg",),
               SizedBox(
                 height: 10,
               ),
               Expanded(
                 child: ListView.builder(
                   itemCount: providerR!.versesList.length,
                   itemBuilder: (context, index) {
                     return Container(
                       child: Text(
                           "... "  " ${providerR!.versesList[index].text}",
                         style: TextStyle(
                             fontSize: 20
                         ),
                       ),
                     );
                   },

                 ),
               ),

             ],
           ),
         )

        ],
      ),


    );
  }
}
