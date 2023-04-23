import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/Opinion.dart';

class user_opinions extends StatefulWidget {
  final String token;
  const user_opinions(this.token, {super.key});

  @override
  State<user_opinions> createState() => _user_opinions_State();
}

class _user_opinions_State extends State<user_opinions>{

  Future<List<Opinion>> getOpinionList() async {
    var url = 'http://semillero.allsites.es/public/api/opinions';
    try{
      var response = await http.get(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8", HttpHeaders.authorizationHeader: "Bearer " + widget.token}).timeout(Duration(seconds: 90));
      if(response.statusCode == 200) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

        return parsed.map<Opinion>((json) => Opinion.fromJson(json)).toList();
      }else {
        return <Opinion>[];
      }
    }catch(e) {
      return <Opinion>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Opiniones'),
      ),
      body: FutureBuilder<List<Opinion>>(
        future: getOpinionList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Ha ocurrido un error!'),
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