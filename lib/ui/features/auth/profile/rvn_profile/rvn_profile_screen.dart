import 'package:flutter/material.dart';
import 'package:zumi_app/data/repositories/auth_repo.dart';
import 'package:zumi_app/ui/features/auth/sign_in/sign_in_screen.dart';
import 'package:zumi_app/ui/utils/widgets/common_button.dart';

class RVNProfileScreen extends StatelessWidget {
  static const String route = "RVNProfileScreenRoute";

  const RVNProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: CommonButton(
            text: 'Logout',
            onPressed: () {
              AuthRepo.logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                SignInScreen.route,
                (route) => false,
              );
            },
          ),
        ),
      ),
    );
  }
}
