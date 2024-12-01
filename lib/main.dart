import 'package:flutter/material.dart';
import 'package:fyp_student_productivity_system/main_screen.dart';
import 'package:fyp_student_productivity_system/pages/signin_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Student Productivity System',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomeScreen(),
    routes: {
      signIn: (context) => const SigninPage(),

    },
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _googleSignIn.signInSilently(), // Attempt to sign in silently
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final GoogleSignInAccount user = snapshot.data as GoogleSignInAccount;
            return MainScreen(user: user); // Navigate to MainScreen with user
          } else {
            return const SigninPage(); // Navigate to Sign-In screen
          }
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error initializing app.'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
