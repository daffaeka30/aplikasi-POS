import 'package:food/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/module/login/login.dart';
import 'package:food/module/login/user_info.dart';
import 'package:food/shared/widget/theme_dark.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getTOKEN();
  print(token);

  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }

  mainStorage = await Hive.openBox('mainStorage');

//------------
  await ProductService.getProductList();
  await PurchaseOrderService.loadDataFromDB();
  await SalesOrderService.loadDataFromDB();
//------------

  return runApp(MaterialApp(
    title: 'Food App',
    navigatorKey: Get.navigatorKey,
    debugShowCheckedModeBanner: false,
    theme: getDarkTheme(),
    home: token == null ? const Login() : const MainNavigationView(),
  ));
}
