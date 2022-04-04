import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_app_navigation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.read<AuthProvider>().setLoginTrue();
            context.beamToReplacementNamed("/");
          },
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 100),
          ),
        ),
      ),
    );
  }
}
