import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/res/components/Button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  HomeViewModel homeviewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeviewModel;
  }

  @override
  Widget build(BuildContext context) {
    final userPrefrences = Provider.of<UserviewModel>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeviewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, vm, _) {
            switch (vm.movieList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(vm.movieList.message.toString());
              case Status.COMPLETED:
                return Text('asd');
              case null:
                
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('home scree'),
                RoundButton(
                    title: 'Log out',
                    onTap: () {
                      userPrefrences.remove().then((value) {
                        Navigator.pushNamed(context, RoutesName.login);
                      });
                    })
              ],
            );
          }),
        ));
  }
}
