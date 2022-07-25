import 'package:zumi_app/data/local/shared_pref_helper.dart';
import 'package:zumi_app/route_helper.dart';
import 'package:zumi_app/ui/features/auth/sign_in/sign_in_screen.dart';
import 'package:zumi_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //hiding the splash screen once the initialization is done.
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Template',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routes: context.read<RouteHelper>().createRoutes(),
      initialRoute: _getInitialRoute(),
    );
  }

  String _getInitialRoute() {
    if (Prefs.isLoggedIn.get()) {
      return "Home Screen";
    } else {
      return SignInScreen.route;
    }
  }
}
