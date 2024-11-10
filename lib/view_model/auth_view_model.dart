import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/util.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  get loading => _loading;
  setloading(bool value) {
    _loading = value;
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setloading(true);
    _myRepo.loginApi(data).then((value) {
      setloading(false);
      Utils.flutterErrorMessage('Login successful', context);
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
}
