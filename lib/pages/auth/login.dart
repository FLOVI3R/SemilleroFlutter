import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:semillero/components/AuthButton.dart';
import 'package:semillero/components/AuthTextField.dart';
import 'package:semillero/models/loggedUser.dart';
import 'package:semillero/pages/auth/register.dart';
import 'package:http/http.dart' as http;

import '../admin/admin_dashboard.dart';
import '../user/user_opinions.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => loginState();
}

  class loginState extends State<login> {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future<void> login() async {
      final user = {"email": emailController.text, "password": passwordController.text};
      print(user);
      var response;
      var url = 'http://semillero.allsites.es/public/api/login';
      try {
        response = await http.post(Uri.parse(url), headers: {HttpHeaders.acceptHeader: "application/json;charset=UTF-8", HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8"}, body: jsonEncode(user));
        print(jsonDecode(response.body));
      } catch(e) {
        print(e);
      }
      if(response.statusCode == 200) {
        Map<String,dynamic> userMap = jsonDecode(response.body);
        String token = userMap["data"]["token"].toString();
        if(userMap["data"]["type"].toString() == "a") {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => admin_dashboard(token)));
        }else {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => user_opinions(token)));
        }
      } else {
        passwordController.clear();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children:[
                const SizedBox(height: 25,),
                Image(
                  image: AssetImage('img/semillero.png'),
                  height: 200,
                ),
                const SizedBox(height: 15,),
                Text(
                  "Inicio de Sesión",
                  style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15,),
                AuthTextField(
                  controller: emailController,
                  icon: Icons.account_box,
                  hintText: 'Correo Electrónico',
                  obscureText: false,
                ),
                const SizedBox(height: 25,),
                AuthTextField(
                  controller: passwordController,
                  icon: Icons.password,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),
                const SizedBox(height: 25,),
                AuthButton(
                  buttonText: "Inicio de Sesión",
                  onTap: () {
                    login();
                  },
                ),
                const SizedBox(height: 25,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => register()));
                  },
                  child: Text("¿Aún no tiene una cuenta? Pulse aquí para crear una."),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }