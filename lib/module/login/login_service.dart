

import 'package:food/module/login/user_info.dart';

class loginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'admin@gmail.com' && password == 'admin') {
      await UserInfo().setToken("admin");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("admin");
      isLogin = true;
    }
    return isLogin;
  }
}
