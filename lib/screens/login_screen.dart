import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:shop_app_vender/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user not sign in
        if (!snapshot.hasData) {
          return SignInScreen(
              // showAuthActionSwitch: false,
              headerBuilder: (context, constraints, _) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: Center(
                          child: Column(children: const [
                        Text(
                          'Firebase Auth',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),

                      ]))),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    action == AuthAction.signIn
                        ? 'Welcome to Firebase! Please sign in to continue.'
                        : 'Welcome to Firebase! Please create an account to continue',
                  ),
                );
              },
              footerBuilder: (context, _) {
                return const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'By signing in, you agree to our terms and conditions.',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                    clientId: '1:433461709277:android:56a8b603504e0f9aafce34'),
                PhoneProviderConfiguration()
              ]);
        }
        //Render app if authenticated
        return const RegistrationScreen();
      },
    );
  }
}
