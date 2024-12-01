import 'package:flutter/material.dart';
import 'package:fyp_student_productivity_system/constants/routes.dart';

import '../api/google_signin_api.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sign In with Google Button
              ElevatedButton.icon(
                onPressed: GoogleSignIn,
                icon: Image.asset(
                  'assets/google_logo.png', // Add your Google logo image here
                  height: 24.0,
                  width: 24.0,
                ),
                label: const Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16.0),
              // Sign Up with Email Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle sign-up with email logic here
                  debugPrint('Sign up with Email button pressed');
                },
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 24.0,
                ),
                label: const Text('Sign up with Email'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future GoogleSignIn() async {
    final user = await GoogleSigninApi.login();
    Navigator.of(context).pushNamedAndRemoveUntil(mainScreen, (route)=>false);
  }
}

