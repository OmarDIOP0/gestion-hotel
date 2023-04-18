import 'package:flutter/material.dart';
import 'package:gestion_hotel/api/apiMethode.dart';
import 'package:gestion_hotel/start/titleText.dart';

import '../start/subtitleText.dart';
class DetailClient extends StatelessWidget {
  final id;
   const DetailClient({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleText(text: "Detail Client", color:Colors.white,size: 14),),
      body:FutureBuilder(
          future: getClient(id),
          builder:(context,snapshot){
            if(snapshot.data==null){
              return CircularProgressIndicator();
            }
            else{
              List detail=snapshot.data;


              return ListView(
                children:detail.map((data){
                  var telephone=data['Telephone'];
                  var tele=telephone.toString();
                  return Container(
                    margin:const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SubTitleText(text:"Prenom : ", color:Colors.black,size: 14),
                            TitleText(text: data['Prenom'], color:Colors.black,size: 17)
                          ],
                        ),
                        Row(
                          children: [
                            SubTitleText(text:"Nom : ", color:Colors.black,size: 14),
                            TitleText(text: data['Name'], color:Colors.black,size: 17)
                          ],
                        ),
                        Row(
                          children: [
                            SubTitleText(text:"Telephone : ", color:Colors.black,size: 14),
                            TitleText(text:tele, color:Colors.black,size: 17)
                          ],
                        ),
                        Row(
                          children: [
                            SubTitleText(text:"Creer le : ", color:Colors.black,size: 14),
                            TitleText(text: data['CreatedAt'], color:Colors.black,size: 17)
                          ],
                        ),

                        Row(
                          children: [
                            SubTitleText(text:"Reservation : ", color:Colors.black,size: 14),
                           // TitleText(text: data['ReservationClients'], color:Colors.black,size: 17)
                          ],
                        ),
                        Row(
                          children: [
                            SubTitleText(text:"Facture : ", color:Colors.black,size: 14),
                          //  TitleText(text: data['FacturationClients'], color:Colors.black,size: 17)
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          }
      ),
    );
  }
}
