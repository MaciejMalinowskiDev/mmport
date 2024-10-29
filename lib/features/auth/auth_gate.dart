import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:mmport/features/home/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate ({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];
   return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
   initialData: FirebaseAuth.instance.currentUser,
   builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return SignInScreen(
            providers: providers,
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacementNamed(context, '/profile');
              }),
            ],
          );

    }
   
   return  HomePage (
    currentUser: snapshot.data!,
   );
   }, 
  );
 }
}
