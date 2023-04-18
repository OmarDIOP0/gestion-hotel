import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_hotel/ui/custom_form.dart';
import 'package:http/http.dart' as http;
import '../../api/apiMethode.dart';
import '../../start/titleText.dart';

class Chambre extends StatefulWidget {
  const Chambre({Key? key}) : super(key: key);

  @override
  State<Chambre> createState() => _ChambreState();
}

class _ChambreState extends State<Chambre> {
  final _keyForm=GlobalKey<FormState>();
  TextEditingController etatController =TextEditingController();
  TextEditingController nbreChControntroller=TextEditingController();
  TextEditingController descController=TextEditingController();
  TextEditingController capaciteController= TextEditingController();
  TextEditingController serviceController =TextEditingController();
  TextEditingController surfaceController = TextEditingController();
  var _categorieid;
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child:Container(
      margin:const EdgeInsets.only(top:10),
      child: Column(
        children: [
          Column(
            children: [
              TitleText(text:"Ajouter Chambre", color:Colors.black, size: 15,),
              const SizedBox(height:5),
              Container(
                margin: EdgeInsets.only(top: 50),
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
                                        _categorieid=value;
                                      });
                                  },
                                  value: _categorieid,
                                  items:snapshot.data.map<DropdownMenuItem<String>>((categorie){
                                    var name=categorie['NomCategorie'].toString();
                                    var id=categorie['ID'].toString();
                                    return DropdownMenuItem<String>(
                                    value:id.toString(),
                                    child:Text(name),
                                  );

                             }).toList()
                              );
                            }
                          }
                      ),
                    )
                  ],
                ),
              ),
              Form(
                key: _keyForm,
                  child:Column(
                    children: [
                      CustomForm(
                          comment:"Saisir l'etat..",
                          controller: etatController,
                          nameField:"Etat Chambre"
                      ),
                      const SizedBox(height: 5),
                      CustomForm(
                          comment:"Saisir le nombre de lits..",
                          controller: nbreChControntroller,
                          nameField:"Nombre Lit"
                      ),
                      const SizedBox(height: 5),
                      CustomForm(
                          comment:"Saisir la desccription..",
                          controller: descController,
                          nameField:"Description"
                      ),
                      const SizedBox(height: 5),
                      CustomForm(
                          comment:"Saisir lea capacite..",
                          controller: capaciteController,
                          nameField:"Capacite"
                      ),
                      const SizedBox(height: 5),
                      CustomForm(
                          comment:"Saisir les services ..",
                          controller: serviceController,
                          nameField:"Services"
                      ),
                      const SizedBox(height: 5),
                      CustomForm(
                          comment:"Saisir la surface...",
                          controller: surfaceController,
                          nameField:"Surface"
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            //setState(() {_isLoading=true;});
                            if(_keyForm.currentState!.validate()) {
                              addChambre(_categorieid,etatController.text,
                                  nbreChControntroller.text,descController.text,
                                  capaciteController.text, serviceController.text,
                                  surfaceController.text);
                             // _categorieid.clear();etatController.clear();nbreChControntroller.clear();
                            //  descController.clear();capaciteController.clear();serviceController.clear();
                           //   serviceController.clear();
                            }
                          },
                          child:const Text("Envoyer"),
                        ),
                      ),
                       const SizedBox(height: 20,)
                    ],
                  )
              )
            ],
          )
        ],
      ),
      )
    );
  }
  Future addChambre(catId,etatCh,nbreLit,description,capacite,service,surface) async{
       Map list={
         'CategoriesID':catId,
         'EtatChambre':etatCh,
         'NbreLits':nbreLit,
         'Description':description,
         'Capacites':capacite,
         'Services':service,
         'Surfaces':surface
       };
       var url='http://192.168.1.8:8000/createChambres';
       var response= await http.post(Uri.parse(url),body: list);
       if(response.statusCode==200){
         var jsonResponse = jsonDecode(response.body);
         //setState(() {_isLoading=false;});
         ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content:Text('Chambre ajouté avec success!!!'),
               backgroundColor: Colors.green,
             )
         );
       }
       else{
         ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content:Text('Erreur  ajout!!!'),
               backgroundColor: Colors.black,
             )
         );
       }
  }
}
