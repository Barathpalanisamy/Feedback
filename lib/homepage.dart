import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final user=FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text('hi'+ user.email!),
      MaterialButton(onPressed: () {
        FirebaseAuth.instance.signOut();
      },
      color: Colors.red,
      child:Text('Sign out')
      ),]),));
    
  }
}