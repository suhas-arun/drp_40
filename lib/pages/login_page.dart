import 'package:flutter/material.dart';
import 'package:saveshare/constants/colour.dart';
import 'package:saveshare/constants/text.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/size.dart';
import '../user/user.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: APPColour.green,
            title: IconButton(
              iconSize: APPSize.APP_ICON_SIZE,
              color: Colors.white,
              icon: const Icon(Icons.energy_savings_leaf_outlined),
              onPressed: () {},
            )),
        body: Column(children: [
          const SizedBox(height: 75),
          Container(
            alignment: Alignment.center,
            child: const Text("Welcome to SaveShare",
                style: APPText.largeGreenText),
          ),
          const SizedBox(height: 50),
          emailInput(),
          const SizedBox(height: 50),
          passwordInput(),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(errorText, style: APPText.badMediumText),
          ),
          const SizedBox(height: 30),
          logInButton()
        ]));
  }

  Widget emailInput() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Email",
            style: APPText.mediumGreenText,
          ),
          SizedBox(
              width: 300,
              child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: APPColour.green),
                  cursorColor: APPColour.green,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email, color: APPColour.green),
                      hoverColor: APPColour.green,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: APPColour.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: APPColour.green))))),
        ]);
  }

  Widget passwordInput() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Password",
            style: APPText.mediumGreenText,
          ),
          SizedBox(
              width: 300,
              child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  style: const TextStyle(color: APPColour.green),
                  cursorColor: APPColour.green,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.password, color: APPColour.green),
                      hoverColor: APPColour.green,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: APPColour.green)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: APPColour.green))))),
        ]);
  }

  Widget logInButton() {
    return SizedBox(
        width: 150,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: APPColour.green, foregroundColor: Colors.white),
          onPressed: login,
          child: const Text("Log In", style: TextStyle(fontSize: 20)),
        ));
  }

  Future<void> login() async {
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } catch (e) {
      setState(() {
        errorText = "Incorrect email or password.";
      });
      return;
    }
    User? user = userCredential.user;
    if (user != null) {
      String name = user.email!.split("@")[0];
      User_.curUser = name[0].toUpperCase() + name.substring(1);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
