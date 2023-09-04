import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';

class SingleDetailsCardWidget extends StatelessWidget {
  const SingleDetailsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: 478.0,
      ),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
              color: AppColors.blackColorWithAlpha2,
              offset: Offset(0, 4),
              spreadRadius: 0.0,
              blurRadius: 32.0)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Center(
            child: Column(
              children: [
                SvgPicture.asset('assets/images/qr.svg'),
                const SizedBox(
                  height: 26.0,
                ),
                Text(
                  'Single',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 135.0 + 12.0),
                  padding: const EdgeInsets.symmetric(
                    vertical: 7.0,
                    horizontal: 12.0,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.lightPurpleColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Guest / ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.primaryColor, fontSize: 16.0),
                      ),
                      Text(
                        'Friend',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 13.0,
          ),
          const Divider(
            color: AppColors.greyColor4,
            thickness: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Visitor',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.greyColor2,
                        fontSize: 16.0,
                      ),
                ),
                Text(
                  'Abanoub',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16.0,
                      ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: DottedLine(
              dashColor: AppColors.greyColor1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Visit Date',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.greyColor2,
                        fontSize: 16.0,
                      ),
                ),
                Text(
                  '20/3/2023',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 16.0,
                      ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: DottedLine(
              dashColor: AppColors.greyColor1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Text(
              'Why You Come to The Compound ?',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.greyColor2,
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Answer1,',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Answer1',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

