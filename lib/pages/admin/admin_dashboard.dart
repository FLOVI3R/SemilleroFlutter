import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../models/User.dart';

class admin_dashboard extends StatefulWidget {
  final String token;
  const admin_dashboard(this.token, {super.key});

  @override
  State<admin_dashboard> createState() => _admin_dashboard_State();
}
List<User> userList = <User>[];

class _admin_dashboard_State extends State<admin_dashboard>{

  Future<List<User>> getUserList() async {
    var url = 'http://semillero.allsites.es/public/api/users';
    try{
      var response = await http.get(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8", HttpHeaders.authorizationHeader: "Bearer " + widget.token}).timeout(Duration(seconds: 90));
      Map<String,dynamic> userMap = jsonDecode(response.body);
      if(response.statusCode == 200) {
        for(int i = 0; i < userMap.length; i++) {
          userList.add(User(
              id: userMap["data"]["id"][i],
              email: userMap["data"]["email"][i],
              firstname: userMap["data"]["firstname"][i],
              secondname: userMap["data"]["secondname"][i],
              company_id: userMap["data"]["company_id"][i],
              type: userMap["data"]["type"][i],
              email_confirmed: userMap["data"]["email_confirmed"][i],
              deleted: userMap["data"]["deleted"][i],
              actived: userMap["data"]["actived"][i],
              iscontact: userMap["data"]["iscontact"][i],
              company: userMap["data"]["company"][i],
              created_at: userMap["data"]["created_at"][i]));
          print(userList[i]);
        }
        return userList;
      }
      return <User>[];
    }catch(e) {
      return <User>[];
    }
  }

  Future<void> activateUser() async {
    var idUser;
    var response;
    var url = 'http://semillero.allsites.es/public/api/activate';
    try {
      response = await http.post(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8"}, body: jsonEncode(idUser));
      //print(jsonDecode(response.body));
    } catch(e) {
      print(e);
    }
    if(response.statusCode == 200) {
      Map<String,dynamic> userMap = jsonDecode(response.body);
      print(userMap);

    } else {

    }
  }

  Future<void> deactivateUser() async {
    var idUser;
    var response;
    var url = 'http://semillero.allsites.es/public/api/deactivate';
    try {
      response = await http.post(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8"}, body: jsonEncode(idUser));
      //print(jsonDecode(response.body));
    } catch(e) {
      print(e);
    }
    if(response.statusCode == 200) {
      Map<String,dynamic> userMap = jsonDecode(response.body);
      print(userMap);

    } else {

    }
  }

  Future<void> updateUser() async {
    var idUser;
    var response;
    var url = 'http://semillero.allsites.es/public/api/user/updated/' + idUser.toString();
    try {
      response = await http.post(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8"}, body: jsonEncode(idUser));
      //print(jsonDecode(response.body));
    } catch(e) {
      print(e);
    }
    if(response.statusCode == 200) {
      Map<String,dynamic> userMap = jsonDecode(response.body);
      print(userMap);

    } else {

    }
  }

  Future<void> deleteUser() async {
    var idUser;
    var response;
    var url = 'http://semillero.allsites.es/public/api/user/delete/' + idUser.toString();
    try {
      response = await http.post(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8"}, body: jsonEncode(idUser));
      //print(jsonDecode(response.body));
    } catch(e) {
      print(e);
    }
    if(response.statusCode == 200) {
      Map<String,dynamic> userMap = jsonDecode(response.body);
      print(userMap);

    } else {

    }
  }
  @override
  void initState() {
    super.initState();
    getUserList().then((list) {
      setState(() {
        userList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      body: FutureBuilder<List<User>>(
        future: getUserList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}