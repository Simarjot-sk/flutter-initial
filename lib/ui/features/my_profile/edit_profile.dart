import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zumi_app/ui/features/auth/sign_up/widgets/sign_up_email_field.dart';
import 'package:zumi_app/ui/features/auth/sign_up/widgets/sign_up_name_field.dart';
import 'package:zumi_app/ui/features/my_profile/widgets/personal_info_show.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class EditProfile extends StatefulWidget {
  static const String route = "EditProfile";
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF8F8E5),
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(left: 12, top: 12, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 1,
                    blurRadius: 8,
                  )
                ],
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.blackDarkFont,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Edit Profile',
              style: Gilroy.semiBold(AppColors.blackDarkFont).s20,
            ),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/setting_icon.svg'),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PersonalInfoShow(isEdit: true),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10),
                child: SignUpNameField(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10),
                child: SignUpEmailField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
