import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/util.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool _signuploading = false;
  get loading => _loading;
  get signuploading => _signuploading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setsignUploading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo.loginApi(data).then((value) {
      setloading(false);

      final userpreferences =
          Provider.of<UserviewModel>(context, listen: false);
      userpreferences.userModel(UserModel(
        token: value['token'].toString()
      ));
      Utils.flutterErrorMessage('Login successful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.flutterErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setsignUploading(true);
    _myRepo.signUpApi(data).then((value) {
      setsignUploading(false);
      Utils.flutterErrorMessage('Sign up successful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setsignUploading(false);
      Utils.flutterErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
