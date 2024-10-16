import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:mmport/features/home/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate ({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
   initialData: FirebaseAuth.instance.currentUser,
   builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return SignInScreen(
  actions: [
    AuthStateChangeAction<SignedIn>((context, state) {
      Navigator.pushReplacementNamed(context, '/home');
    }),
  ],
);

    }
   
   return const HomePage (
    title: '',
    //currentUser: snapshot.data!,
   );
   }, 
  );
 }
}
