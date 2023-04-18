import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_hotel/admin/listCetagorie.dart';
import 'package:gestion_hotel/api/apiMethode.dart';
import 'package:gestion_hotel/ui/custom_form.dart';
import 'package:http/http.dart' as http;

import '../../start/titleText.dart';

class Categorie extends StatefulWidget {
  const Categorie({Key? key}) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  final _formKey=GlobalKey<FormState>();

  TextEditingController nomCategorie = TextEditingController();
  TextEditingController tarif =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      margin: EdgeInsets.only(top: 50),
      child: Column(
      children: [
        Column(
          children: [
          TitleText(text:"Ajouter Catégorie", color:Colors.black, size: 15,),
          const SizedBox(height: 20),
          Form(
              key: _formKey,
                child:Column(
                  children: [
                    CustomForm(
                      comment:"Saisir le nom de la categorie",
                      controller:nomCategorie,
                      nameField:"Nom Categorie",
                      ),
                      const SizedBox(height: 20),
                      CustomForm(
                        comment:"Saisir le montant du tarif",
                        controller:tarif,
                        nameField:"Tarif",
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){

                              addCategory(nomCategorie.text, tarif.text);
                            }
                          },
                          child:const Text("Envoyer"),
                        ),
                      ),
                    SizedBox(height: 20),
                    FloatingActionButton(
                        child:Icon(Icons.category),
                        onPressed:(){
                          Navigator.of(context).push(MaterialPageRoute(builder:
                              (context)=>const ListeCategorie()));
                        }
                    ),
            ],
          )

      ),
      ],
        ),

      ],
    ),
    );
  }
  Future addCategory(nomCategorie,tarif) async{
    Map list={
      'NomCategorie':nomCategorie,
      'Tarifs':tarif
    };
    var url ='http://192.168.1.8:8000/createCategories';
    var response = await http.post(Uri.parse(url),body:list,
      //  headers: {'Content-type':'application/json',}
    );
    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content:Text('Categorie ajouté avec success!!!'),
            backgroundColor: Colors.green,
          )
      );
    }
  }
}

/*Container(
                                margin: EdgeInsets.only(top: 10),
                                child:Column(
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(right: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight:Radius.circular(25),
                                          topLeft:Radius.circular(25),
                                          bottomRight:Radius.circular(25),
                                          bottomLeft:Radius.circular(25),
                                        )
                                      ),
                                      child: TitleText(text: etat, color:Colors.black),
                                    )
                                  ],
                                ) ,
                              );*/
