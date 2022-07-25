import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class MyReviews extends StatelessWidget {
  final List myReviewList;

  const MyReviews({Key? key, required this.myReviewList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews',
                style: Gilroy.semiBold(AppColors.blackDarkFont).s20,
              ),
              Text(
                'See All',
                style: Gilroy.boldUnderline(AppColors.blackDarkFont).s14,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          DecoratedBox(
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
            child: Column(
              children: myReviewList.map(getChip).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget getChip(date) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://picsum.photos/100/100',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        date['title'],
                        style: Gilroy.bold(AppColors.blackDarkFont).s14,
                      ),
                      Text(
                        '12, june',
                        style: Gilroy.regular(AppColors.blackDarkFont).s12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'this is test text for lorem ipsum',
                    style: Gilroy.regular(AppColors.blackDarkFont).s14,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                    decoration: BoxDecoration(
                      color: const Color(0xffB2C7C7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Home visit'),
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
