import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'constants/routes.dart';

class MainScreen extends StatefulWidget {
  final GoogleSignInAccount? user;

  const MainScreen({super.key, required this.user});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text("Main Screen"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'logout') {
                await _googleSignIn.signOut();
                Navigator.of(context).pushReplacementNamed(signIn);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Main Screen, ${widget.user?.displayName ?? 'Guest'}!'),
            Text("Email: ${widget.user?.email ?? 'No email available'}"),
          ],
        ),
      ),
    );
  }
}
