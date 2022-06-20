import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/respository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

// for login
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarError('Login Successful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarError(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  /// for sign up
  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setLoading(false);
      Utils.flushBarError('signUp Succesfuly', context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarError(error.toString(), context);
    });
  }
}
