import 'package:flutter/material.dart';
import 'package:gestion_hotel/admin/modals/Client.dart';
import 'package:gestion_hotel/admin/modals/accueil.dart';
import 'package:gestion_hotel/admin/modals/categorie.dart';
import 'package:gestion_hotel/admin/modals/chambre.dart';
import 'package:gestion_hotel/start/titleText.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex=0;
  final List _childreen=[
    const Accueil(),
    const Chambre(),
    const Categorie(),
    const Client(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:[
             TitleText(text: 'Sen Hotel', color:Colors.white, size: 21,),
             TitleText(text: 'Chambre', color:Colors.white,size: 21,),
             TitleText(text: 'Category', color:Colors.white,size: 21,),
             TitleText(text: 'Client', color:Colors.white,size: 21,),
          ][_currentIndex],
          automaticallyImplyLeading: false,centerTitle: true,
        ),
        body:_childreen[_currentIndex],
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home",backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.room),label:"Chambre",backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.category),label:"Category",backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.person_add),label:"Client",backgroundColor: Colors.pink),
        ],
          onTap: (index){
          setState(() {
            _currentIndex=index;
          });
          },
    ),

    );
  }
}