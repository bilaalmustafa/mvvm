import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/util.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: InkWell(
                onTap: () {
                  Utils.flutterErrorMessage('No internet connection ', context);
                  Utils.toastMessage('no Internet connection');
                  Navigator.pushNamed(context, RoutesName.home);
                },
                child: const Text('click'))));
  }
}
