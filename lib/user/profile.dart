import 'package:flutter/material.dart';

import '../start/titleText.dart';
import '../ui/custom_form.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey =GlobalKey<FormState>();
  TextEditingController telephoneController =TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Column(
            children: [
              TitleText(text:"Page Connexion", color:Colors.black, size: 15,),
              const SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child:Column(
                    children: [
                      CustomForm(
                        comment:"Saisir le numero de telephone",
                        controller:telephoneController,
                        nameField:"Telephone",
                      ),
                      const SizedBox(height: 20),
                      CustomForm(
                        comment:"Saisir le mot de passe",
                        controller:passwordController,
                        nameField:"Mot de passe",
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                            }
                          },
                          child:const Text("Se connecter"),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextButton(onPressed: (){}, child:const Text("Voir le profile"))
                    ],
                  )

              ),
            ],
          ),

        ],
      ),
    );
  }
}
