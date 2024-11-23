import 'package:flutter/material.dart';
import 'package:mvvm/view_model/services/splash_services.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  SplashServices splashServices = SplashServices();
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Splash Screen',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    ));
  }
}
