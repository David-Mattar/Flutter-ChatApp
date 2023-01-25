import 'package:chatapp_firebase/helper/helper_functions.dart';
import 'package:chatapp_firebase/pages/auth/login_page.dart';
import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  
  // If web, run initialization for web
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: Constants.apiKey,
        appId: Constants.appId,
        messagingSenderId: Constants.messagingSenderId,
        projectId: Constants.projectId
      )
    );
  }else{ 
    //  Else, run the initialization for android and futurelly IOs
    await Firebase.initializeApp();
  }


  runApp(const MyApp());
}


class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key:key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSinedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggednStatus();
  }

  getUserLoggednStatus() async {
    await HelperFunctions.getUserLoggednStatus().then((value){
      if( value != null){
        _isSinedIn = value;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isSinedIn ? const HomePage() : const LoginPage(),
      
    );
  }
}