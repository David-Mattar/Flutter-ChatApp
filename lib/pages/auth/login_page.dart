import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key:key);
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                const Text("Groupie", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10),
                const Text("Login now to see what they are talking!", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                Image.asset("assets/login.png"),

                // Email texto box
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "E-mail",
                    prefixIcon:  
                      Icon(
                        Icons.email,
                        color:Theme.of(context).primaryColor,
                      ),                      
                  ),
                  onChanged: (val){
                    setState(() {
                      email = val;
                      print(email);
                    });
                  },
                ),

                const SizedBox(height: 15), 

                // Password text box
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Password",
                    prefixIcon:  
                      Icon(
                        Icons.lock,
                        color:Theme.of(context).primaryColor,
                      ),                      
                  ),
                  onChanged: (val){
                    setState(() {
                      password = val;
                      print(password);
                    });
                  },
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}