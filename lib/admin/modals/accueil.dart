import 'package:flutter/material.dart';
import 'package:gestion_hotel/api/apiMethode.dart';

import '../../start/titleText.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Image.asset("assets/images/hotel_2.png",fit: BoxFit.cover),
              TitleText(text: "Bienvenue a Sen HOTEL", color:Colors.black,size: 15),
            ],
          )
        ],
      ),
    );
  }
}
