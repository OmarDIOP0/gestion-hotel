import 'package:flutter/material.dart';
import 'package:gestion_hotel/api/apiMethode.dart';

class AccueilUser extends StatefulWidget {
  const AccueilUser({Key? key}) : super(key: key);

  @override
  State<AccueilUser> createState() => _AccueilUserState();
}

class _AccueilUserState extends State<AccueilUser> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
        children: [
        Column(
        children: [
          Image.asset("assets/images/hotel_1.png",fit: BoxFit.cover),
         ],
           ),
         /* FutureBuilder(
            future: getChambres(),
              builder:(context,snapshot){
              return ListView.builder(
                 itemCount: snapshot.data.length,
                  itemBuilder:(context,index){
                    return ListTile(
                      title: Text(snapshot.data['EtatChambre']),
                    );
                  }
              );
              }
          )*/

        ],
        ),
    );
  }
}
