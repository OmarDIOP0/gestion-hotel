import 'package:flutter/material.dart';
import 'package:gestion_hotel/admin/detail_client.dart';

import '../api/apiMethode.dart';
import '../start/titleText.dart';

class ListClient extends StatefulWidget {
  const ListClient({Key? key}) : super(key: key);

  @override
  State<ListClient> createState() => _ListClientState();
}

class _ListClientState extends State<ListClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleText(text:"Liste Clients", color:Colors.white,size: 15,),centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width*1,
          child: Column(
            children: [
              SizedBox(height: 10),
              TitleText(text: "Liste Client", color:Colors.black,size: 15,),
              const SizedBox(height: 10),
              SingleChildScrollView(
                  child: Expanded(
                    child:Container(
                        width: MediaQuery.of(context).size.width*1,
                        child:SingleChildScrollView(
                          child: Column(
                            children: [
                              FutureBuilder(
                                  future:getClients(),
                                  builder:(context,snapshot){
                                    if(snapshot.data==null){
                                      return CircularProgressIndicator();
                                    }
                                    else{
                                      return SingleChildScrollView(
                                        scrollDirection:Axis.horizontal,
                                        child: DataTable(
                                          columns:[
                                            DataColumn(label:TitleText(text:"ID",color: Colors.black,size: 14,)),
                                            DataColumn(label:TitleText(text:"Prenom",color: Colors.black,size: 14,)),
                                            DataColumn(label:TitleText(text:"Nom",color: Colors.black,size: 14,)),
                                            DataColumn(label:TitleText(text:"Info",color: Colors.black,size: 14,)),
                                          ],
                                          rows:snapshot.data.map<DataRow>((data){
                                            var id=data['ID'];
                                            var idString=id.toString();
                                            var name =data['Name'].toString();
                                            var prenom = data['Prenom'].toString();
                                            return DataRow(
                                                cells:[
                                                  DataCell(TitleText(text:idString,color: Colors.black,size:12,)),
                                                  DataCell(TitleText(text:prenom,color: Colors.black,size:12,)),
                                                  DataCell(TitleText(text:name,color: Colors.black,size:12,)),
                                                  DataCell(ElevatedButton( child:const Text("Voir"),onPressed: (){
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                                                        DetailClient(id: idString)
                                                    ));
                                                  },))
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
