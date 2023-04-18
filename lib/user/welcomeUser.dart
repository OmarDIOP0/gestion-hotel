import 'package:flutter/material.dart';
import 'package:gestion_hotel/user/accueil_user.dart';
import 'package:gestion_hotel/user/profile.dart';
import 'package:gestion_hotel/user/reservation.dart';

import '../start/titleText.dart';

class WelcomeUser extends StatefulWidget {
  const WelcomeUser({Key? key}) : super(key: key);

  @override
  State<WelcomeUser> createState() => _WelcomeUserState();
}

class _WelcomeUserState extends State<WelcomeUser> {
  int _currentIndex=0;
  final List _childreen=[
    const AccueilUser(),
    const Reservation(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:[
          TitleText(text: 'Sen Hotel', color:Colors.white, size: 21,),
          TitleText(text: 'Reservation', color:Colors.white,size: 21,),
          TitleText(text: 'Profile', color:Colors.white,size: 21,),
        ][_currentIndex],
        automaticallyImplyLeading: false,centerTitle: true,
      ),
      body:_childreen[_currentIndex],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home",backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.room_service),label:"Reservation",backgroundColor: Colors.pink),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile",backgroundColor: Colors.pink),
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
