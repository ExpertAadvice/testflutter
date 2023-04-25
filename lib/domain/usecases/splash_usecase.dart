import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:testflutter/utils/route_utils/route_names.dart';

import '../../ui/screens/splash/userViewModel.dart';
import '../models/user_model.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (kDebugMode) {
        print(value.token.toString());
      }

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
