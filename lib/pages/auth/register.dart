import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:semillero/components/AuthButton.dart';
import 'package:semillero/components/AuthTextField.dart';
import 'package:semillero/pages/auth/login.dart';


class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => registerState();
}

class registerState extends State<register> {
  final firstnameController = TextEditingController();
  final secondnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final c_passwordController = TextEditingController();

  void register() async {
    final user = {"firstname": firstnameController.text, "secondname": secondnameController.text, "email": emailController.text, "password": passwordController.text, "c_password": c_passwordController.text};
    final headers = {"Content-Type":"application/json;charset=UTF-8", "Accept":"application/json;charset=UTF-8"};
    var response;
    var url = 'http://semillero.allsites.es/public/api/register';
    try {
      response = await http.post(Uri.parse(url), headers: {HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8", HttpHeaders.acceptHeader: "application/json"}, body: jsonEncode(user));
    } catch(e) {
      print(e);
    }
    var data = jsonDecode(response.body.toString());
    print(data);
    //firstnameController.clear();
    //secondnameController.clear();
    //emailController.clear();
    //passwordController.clear();
    //c_passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:[
              Image(
                image: AssetImage('img/semillero.png'),
                height: 200,
              ),
              const SizedBox(height: 15,),
              Text(
                "Registro de Usuario",
                style: const TextStyle(
                  color: Colors.lightGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 15,),
              AuthTextField(
                controller: emailController,
                icon: Icons.email,
                hintText: 'Correo Electrónico',
                obscureText: false,
              ),
              const SizedBox(height: 15,),
              AuthTextField(
                controller: firstnameController,
                icon: Icons.account_box,
                hintText: 'Nombre',
                obscureText: false,
              ),
              const SizedBox(height: 15,),
              AuthTextField(
                controller: secondnameController,
                icon: Icons.account_box,
                hintText: 'Apellidos',
                obscureText: false,
              ),
              const SizedBox(height: 15,),
              AuthTextField(
                controller: passwordController,
                icon: Icons.password,
                hintText: 'Contraseña',
                obscureText: true,
              ),
              const SizedBox(height: 15,),
              AuthTextField(
                controller: c_passwordController,
                icon: Icons.password,
                hintText: 'Confirmar contraseña',
                obscureText: true,
              ),
              const SizedBox(height: 15,),
              AuthButton(
                buttonText: "Registro",
                onTap: () {
                  register();
                },
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                },
                child: Text("¿Ya tiene una cuenta? Pulse aquí para iniciar sesión."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}