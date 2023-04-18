import 'package:flutter/material.dart';
import 'package:gestion_hotel/start/home_page.dart';
import 'package:gestion_hotel/start/subtitleText.dart';
import 'package:gestion_hotel/start/titleText.dart';
import 'package:gestion_hotel/user/welcomeUser.dart';

import '../admin/modals/accueil.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:TitleText(text:"Sen HOTEL", color:Colors.white,size: 26),automaticallyImplyLeading: false,centerTitle: true,
      toolbarHeight:150,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),bottomRight: Radius.circular(100)),
              gradient: LinearGradient(
                  colors: [Colors.red,Colors.white10],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top:100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width:100,
              height: 40,
              child: ElevatedButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const HomePage()));
              }, child:SubTitleText(text:"Admin", color:Colors.white,size: 17,)
              ),
            ),
            SizedBox(
              width:100,
              height: 40,
              child: ElevatedButton(onPressed:(){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const WelcomeUser()));
              }, child:SubTitleText(text:"User", color:Colors.white,size: 17,)
              ),
            ),

          ],
        ),
      ),
    );
  }
}
