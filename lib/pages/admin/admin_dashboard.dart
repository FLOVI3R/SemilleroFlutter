import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../models/User.dart';

class admin_dashboard extends StatefulWidget {
  final String token;
  const admin_dashboard(this.token);

  @override
  State<admin_dashboard> createState() => _admin_dashboard_State();
}

class _admin_dashboard_State extends State<admin_dashboard>{
  List<User> userList = <User>[];

  Future<List<User>> getUserList() async {
    var url = 'http://semillero.allsites.es/public/api/users';
    var response = await http.get(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8", HttpHeaders.authorizationHeader: widget.token}).timeout(Duration(seconds: 90));
    print(response.body);
    Map<String,dynamic> map = jsonDecode(response.body);
    print(map);
    print(response.statusCode);
    var uList = <User>[];

    print(map);
    return uList;
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
    getUserList().then((value) {
      setState(() {
        userList.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.lightGreen,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      userList[index].email,
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}