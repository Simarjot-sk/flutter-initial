import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class PersonalInfoShow extends StatelessWidget {
  final bool isEdit;

  const PersonalInfoShow({
    Key? key,
    this.isEdit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xffF8F8E5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  'https://picsum.photos/90/90',
                  height: 130,
                  width: 130,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Josep Burns',
                style: Gilroy.bold(AppColors.blackDarkFont).s18,
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.greenVerified),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/certificate_profile.jpg',
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.greenVerified,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SizedBox(height: 20),
        if (isEdit) const SizedBox.shrink() else _showOtherDetail(context),
      ],
    );
  }

  Widget _showOtherDetail(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'SetAvailableTimeAndDate',
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xff69BC9D),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 35,
                  right: 30,
                ),
                leading: SvgPicture.asset('assets/icons/calender_time.svg'),
                title: Text(
                  'Set Availability Time & Rate',
                  style: Gilroy.semiBold(AppColors.white).s20,
                ),
                trailing: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 50,
                      color: AppColors.white,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 25,
                      color: Color(0xff69BC9D),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffB7CDCD),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '3 Years',
                      style: Gilroy.semiBold(AppColors.blackDarkFont).s20,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Qualified',
                      style: Gilroy.semiBold(AppColors.grayFont).s12,
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffB7CDCD),
                ),
                alignment: Alignment.center,
                child: Text(
                  '31 Reviews',
                  style: Gilroy.semiBold(AppColors.grayFont).s12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'LinkedIn',
            style: Gilroy.semiBold(AppColors.blackDarkFont).s20,
          ),
          const SizedBox(height: 10),
          Text(
            'https://www.linkedin.com/rupeshdeveloper_31',
            style: Gilroy.semiBold(AppColors.grayHint).s14,
          ),
          const SizedBox(height: 20),
          Text(
            'Availability',
            style: Gilroy.semiBold(AppColors.blackDarkFont).s20,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffB7CDCD),
                ),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  'Qualified',
                  style: Gilroy.semiBold(AppColors.blackDarkFont).s16,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffB7CDCD),
                ),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  '31 Reviews',
                  style: Gilroy.semiBold(AppColors.blackDarkFont).s16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 8,
                )
              ],
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me',
                  style: Gilroy.semiBold(AppColors.blackDarkFont).s20,
                ),
                const SizedBox(height: 10),
                Text(
                  'At the age of 26, I work full-time as a qualified veterinary nurse in a fast-paced small animal clinic and have launched my own pet-sitting business ...',
                  style: Gilroy.semiBold(AppColors.grayFont).s12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
