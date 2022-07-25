import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/sign_in/sign_in_screen.dart';
import 'package:zumi_app/ui/features/auth/sign_in/sign_in_view_model.dart';
import 'package:zumi_app/ui/utils/transitions.dart';

class RouteHelper with Transitions {
  //common viewModels

  Map<String, WidgetBuilder> createRoutes() {
    return {
      SignInScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => SignInViewModel(),
            child: const SignInScreen(),
          ),
    };
  }
}

///the routes that require custom transitions are defined below instead of [createRoutes] method
// Route<dynamic> createFilterResourcesRoute() {
//   return slideDownAnimRoute(
//     page: ChangeNotifierProvider.value(
//       value: _resourcesViewModel,
//       child: const FilterResourcesScreen(),
//     ),
//   );
// }
