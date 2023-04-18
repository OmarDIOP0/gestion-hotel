import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//// CATEGORIES/////////////

var url ="http://192.168.1.8:8000";
Future getCategory() async{
  var response = await http.get(Uri.parse(url+"/showCategories"),
      //headers: {'Content-type':'application/json',}
  );
  var jsonResponse;
  if(response.statusCode==200){
     jsonResponse =jsonDecode(response.body);
  }
  return jsonResponse['categories'];
}
////////////////////////////////////////////////////////////
////CLIENT////////////////////


Future getClients() async{
  //var url='http://192.168.1.4:8000/showClients';
  var response = await http.get(Uri.parse("$url/showClients"),
      //headers: {'Content-type':'application/json',}
  );
  var jsonResponse;
  if(response.statusCode==200){
    jsonResponse =jsonDecode(response.body);
  }
  return jsonResponse['Chambres'];
}
//////////////////////////////////////////////////////////////
Future getClient(id) async{
  var response = await http.get(Uri.parse("$url/showClients/$id"),
  //headers: {'Content-type':'application/json',}
  );
  var jsonResponse;
  if(response.statusCode==200){
  jsonResponse =jsonDecode(response.body);
  }
  return jsonResponse['Chambres'];
}
////////////
Future getChambres() async{
  var response = await http.get(Uri.parse("$url/showChambres"));
  var jsonResponse;
  if(response.statusCode==200){
    jsonResponse=jsonDecode(response.body);
  }
  return jsonResponse['Chambres'];
}
/////////////
Future getChambre(id) async{
  var response = await http.get(Uri.parse("$url/showChambres/$id"));
  var jsonResponse;
  if(response.statusCode==200){
    jsonResponse=jsonDecode(response.body);
  }
  return jsonResponse['Chambres'];
}