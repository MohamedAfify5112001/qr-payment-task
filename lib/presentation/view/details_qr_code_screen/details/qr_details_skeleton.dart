import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_demo/presentation/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/styles/app_color.dart';

class DetailsQrSkeleton extends StatelessWidget {
  const DetailsQrSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            const SingleDetailsCardSkeleton(),
            const SizedBox(
              height: 32.0,
            ),
            Shimmer.fromColors(
              baseColor: AppColors.greyColor4,
              highlightColor: Colors.grey[300]!,
              child: Skeleton(
                width: MediaQuery.of(context).size.width,
                height: 48.0,
                radius: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleDetailsCardSkeleton extends StatelessWidget {
  const SingleDetailsCardSkeleton({super.key});

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
            blurRadius: 32.0,
          )
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 151.0,
                    height: 124.0,
                    radius: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 51.0,
                    height: 20.0,
                    radius: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 135.0,
                    height: 34.0,
                    radius: 12.0,
                  ),
                ),
                const SizedBox(
                  height: 13.0,
                ),
                const Divider(
                  color: AppColors.greyColor4,
                  thickness: 3.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 90.0,
                    height: 20.0,
                    radius: 12.0,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 90.0,
                    height: 20.0,
                    radius: 12.0,
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
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 90.0,
                    height: 20.0,
                    radius: 12.0,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 90.0,
                    height: 20.0,
                    radius: 12.0,
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
            child: Shimmer.fromColors(
              baseColor: AppColors.greyColor4,
              highlightColor: Colors.grey[300]!,
              child: const Skeleton(
                width: double.infinity,
                height: 20.0,
                radius: 12.0,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 70.0,
                    height: 20.0,
                    radius: 12.0,
                  ),
                ),
                const SizedBox(
                  width: 12.5,
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    width: 70.0,
                    height: 20.0,
                    radius: 12.0,
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
