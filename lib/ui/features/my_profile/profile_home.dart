import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zumi_app/ui/features/my_profile/widgets/my_reviews.dart';
import 'package:zumi_app/ui/features/my_profile/widgets/personal_info_show.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class ProfileHome extends StatefulWidget {
  static const String route = "ProfileHome";
  const ProfileHome({Key? key}) : super(key: key);

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  List reviewsList = [
    {'title': 'rupesh test'},
    {'title': 'rupesh test'},
    {'title': 'rupesh test'}
  ];
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
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/edit_profile.svg'),
            onPressed: () => Navigator.pushNamed(context, 'EditProfile'),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Profile',
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
            children: [
              const PersonalInfoShow(isEdit: false),
              const SizedBox(height: 15),
              MyReviews(myReviewList: reviewsList),
            ],
          ),
        ),
      ),
    );
  }
}
