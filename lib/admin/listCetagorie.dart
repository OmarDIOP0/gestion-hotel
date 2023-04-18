import 'package:flutter/material.dart';
import 'package:gestion_hotel/api/apiMethode.dart';

import '../start/titleText.dart';
class ListeCategorie extends StatefulWidget {
  const ListeCategorie({Key? key}) : super(key: key);

  @override
  State<ListeCategorie> createState() => _ListeCategorieState();
}

class _ListeCategorieState extends State<ListeCategorie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleText(text:"Liste Categorie", color:Colors.white,size: 15,),centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width*1,
          child: Column(
            children: [
              SizedBox(height: 10),
              TitleText(text: "Liste Categorie", color:Colors.black,size: 15,),
              const SizedBox(height: 10),
              SingleChildScrollView(
                  child: Expanded(
                    child:Container(
                        width: MediaQuery.of(context).size.width*1,
                        child:SingleChildScrollView(
                          child: Column(
                            children: [
                              FutureBuilder(
                                  future:getCategory(),
                                  builder:(context,snapshot){
                                    if(snapshot.data==null){
                                      return CircularProgressIndicator();
                                    }
                                    else{
                                      return SingleChildScrollView(
                                        scrollDirection:Axis.horizontal,
                                        child: DataTable(
                                          columns:[
                                            DataColumn(label:TitleText(text:"NomCategorie",color: Colors.black,size: 14,)),
                                            DataColumn(label:TitleText(text:"Tarifs",color: Colors.black,size: 14,)),
                                          ],
                                          rows:snapshot.data.map<DataRow>((data){
                                            var name=data['NomCategorie'].toString();
                                            var tarif =data['Tarifs'].toString();
                                            return DataRow(
                                                cells:[
                                                  DataCell(TitleText(text:name,color: Colors.black,size:12,)),
                                                  DataCell(TitleText(text:tarif,color: Colors.black,size:12,)),
                                                ]
                                            );
                                          }).toList(),
                                        ),
                                      );
                                    }
                                  }
                              ),],
                          )             ,
                        )

                    ),
                  )
              )
            ],
          ),
        ) ,
      ),
    );
  }
}
