import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome",style: TextStyle(color: Colors.white,),),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4,
        actions: [

          IconButton(
            icon: const Icon(Icons.power_settings_new,color: Colors.white,),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
            shadowColor: Colors.greenAccent,
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
            minimumSize: const Size(100, 40),
          ),
          onPressed: () {  FirebaseAuth.instance.signOut();},
          child: const Text('Logout'),
        ),
      )

    );
  }
}
