import 'dart:convert';

import 'package:flutter/material.dart';

import '../api/apiMethode.dart';
import '../start/titleText.dart';
import '../ui/custom_form.dart';
import 'package:http/http.dart' as http;

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {

  final _formKey=GlobalKey<FormState>();
  TextEditingController nuiteController =TextEditingController();
  TextEditingController entreeController=TextEditingController();
  TextEditingController sortieController= TextEditingController();
  var _clientId;
  var _chambreId;
  //var _categorieId;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Column(
              children: [
                Image.asset("assets/images/hotel_4.png",fit: BoxFit.cover),
                TitleText(text:"Ajouter Reservation", color:Colors.black, size: 13,),
                Form(
                    key: _formKey,
                    child:Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          child: FutureBuilder(
                              future: getCategory(),
                              builder:(context,snapshot){
                                print(snapshot.data);
                                if(snapshot.data==null){
                                  return CircularProgressIndicator();
                                }
                                else{
                                  return DropdownButton<String>(
                                      hint: TitleText(text:"Choisir une categorie", color:Colors.black,size: 13,),
                                      dropdownColor: Colors.pink,
                                      onChanged:(value){
                                        setState(() {
                                          _chambreId=value;
                                        });
                                      },
                                      value: _chambreId,
                                      items:snapshot.data.map<DropdownMenuItem<String>>((chambre){
                                        var nameCh=chambre['NomCategorie'].toString();
                                        var idCh=chambre['ID'].toString();
                                        return DropdownMenuItem<String>(
                                          value:idCh.toString(),
                                          child:Text(nameCh),
                                        );

                                      }).toList()
                                  );
                                }
                              }
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width*1,
                          child: FutureBuilder(
                              future: getClients(),
                              builder:(context,snapshot){
                                if(snapshot.data==null){
                                  return CircularProgressIndicator();
                                }
                                else{
                                  return DropdownButton<String>(
                                      hint: TitleText(text:"Choisir un client", color:Colors.black,size: 13,),
                                      dropdownColor: Colors.pink,
                                      onChanged:(value){
                                        setState(() {
                                          _clientId=value;
                                        });
                                      },
                                      value: _clientId,
                                      items:snapshot.data.map<DropdownMenuItem<String>>((client){
                                        var name=client['Prenom'].toString();
                                        var id=client['ID'].toString();
                                        return DropdownMenuItem<String>(
                                          value:id.toString(),
                                          child:Text(name),
                                        );

                                      }).toList()
                                  );
                                }
                              }
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomForm(
                            comment:"Saisir le nombre de nuite",
                            controller:nuiteController,
                            nameField: "Nuite"
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: entreeController,
                          decoration: const InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Date Entree?',
                              icon: Icon(Icons.date_range)),
                          onTap: () async{
                            DateTime? pickedate= await showDatePicker(
                              context: context,
                              initialDate:DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate:DateTime(2100),
                            );
                            if(pickedate!=null){
                              setState(() {
                                entreeController.text=pickedate.toString();
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: sortieController,
                          decoration: const InputDecoration(
                              border:OutlineInputBorder(),
                              hintText: 'Date de Sortie ?',
                              icon: Icon(Icons.date_range)),
                          onTap: () async{
                            DateTime? pickedate= await showDatePicker(
                              context: context,
                              initialDate:DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate:DateTime(2100),
                            );
                            if(pickedate!=null){
                              setState(() {
                                sortieController.text=pickedate.toString();
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                addReservation(entreeController.text, sortieController.text,
                                    nuiteController.text, _clientId, _chambreId);
                              }
                            },
                            child:const Text("Envoyer"),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    )

                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Future addReservation(entree,sortie,nuite,clientId,chambreId) async{
   Map list= {
     'DateDentrer': entree,
     'DateSortie':sortie,
      'Nuite':nuite,
      'ClientsID':_clientId,
      'ChambresID':chambreId
   };
   var url='http://192.168.1.8:8000/createReservation';
   var response= await http.post(Uri.parse(url),body: list);
   if(response.statusCode==200){
     var jsonResponse = jsonDecode(response.body);
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content:Text('Reservation ajouté avec success!!!'),
           backgroundColor: Colors.green,
         )
     );
   }
   else{
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content:Text('Erreur  ajout de la reservation!!!'),
           backgroundColor: Colors.black,
         )
     );
   }
  }
}
