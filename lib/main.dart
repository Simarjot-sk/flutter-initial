import 'dart:developer' as developer;
import 'package:zumi_app/data/local/shared_pref_helper.dart';
import 'package:zumi_app/data/repositories/auth_repo.dart';
import 'package:zumi_app/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/utils/log_tags.dart';
import 'package:zumi_app/ui/utils/toasts.dart';
import 'package:zumi_app/my_app.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //keeping the splash ui visible
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //initializing shared preferences
  await Prefs.init();

  if (Prefs.isLoggedIn.getOrDefault(false)) {
    try {
      await AuthRepo.getUserDetails();
    } catch (th, stackTrace) {
      developer.log(
        "exception while loading initial data $th",
        name: LogTags.initialDataLoad,
      );
      developer.log(
        'stacktrace: $stackTrace',
        name: LogTags.initialDataLoad,
      );
      errorToast(
        "Failed to load data, Make sure you have a stable Internet Connection",
      );
    }
  }

  //restricting orientation to Portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    Provider<RouteHelper>(
      create: (_) => RouteHelper(),
      child: const MyApp(),
    ),
  );
}
