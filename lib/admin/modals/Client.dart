import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_hotel/admin/listClient.dart';

import '../../api/apiMethode.dart';
import '../../start/titleText.dart';
import '../../ui/custom_form.dart';
import 'package:http/http.dart' as http;

class Client extends StatefulWidget {
  const Client({Key? key}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {

  final _formKey=GlobalKey<FormState>();

  TextEditingController nameController =TextEditingController();
  TextEditingController prenomController= TextEditingController();
  TextEditingController telephoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top:10),
      child: SingleChildScrollView(
        child:  Column(
          children: [
            Column(
              children: [
                TitleText(text:"Ajouter Client", color:Colors.black, size: 15,),
                const SizedBox(height: 10),
                Form(
                    key: _formKey,
                    child:Column(
                      children: [
                        CustomForm(
                          comment:"Saisir le prenom",
                          controller:prenomController,
                          nameField:"Prenom",
                        ),
                        const SizedBox(height: 10),
                        CustomForm(
                          comment:"Saisir le nom",
                          controller:nameController,
                          nameField:"Nom",
                        ),
                        const SizedBox(height: 10),
                        CustomForm(
                          comment:"Saisir le numero de telephone",
                          controller:telephoneController,
                          nameField:"Telephone",
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              if(_formKey.currentState!.validate()) {
                                addClient(prenomController.text, nameController.text,
                                    telephoneController.text);
                                prenomController.clear();
                                nameController.clear();
                                telephoneController.clear();
                              }
                            },
                            child:const Text("Envoyer"),
                          ),
                        ),
                      ],
                    )

                ),
              ],
            ),
              SizedBox(height: 20),
              FloatingActionButton(
                  child:Icon(Icons.person),
                  onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(builder:
                        (context)=>const ListClient()));
                  }
              ),

          ],
        ),
      )
    );
  }
  Future addClient(prenom,nom,telephone) async{
    Map list={
      'Prenom':prenom,
      'Name':nom,
      'Telephone':telephone
    };
    var url ='http://192.168.1.8:8000/createClients';
    var response = await http.post(Uri.parse(url),body:list,
        //headers: {'Content-type':'application/json'}
    );
    if(response.statusCode==200){
      var jsonResponse = jsonEncode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content:Text('Client ajouté avec success!!!'),
            backgroundColor: Colors.green,
          )
      );
      print(jsonResponse);
    }
  }
}
