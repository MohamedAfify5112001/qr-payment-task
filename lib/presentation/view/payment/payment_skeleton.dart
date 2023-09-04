import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_demo/presentation/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/styles/app_color.dart';

class PaymentSkeleton extends StatelessWidget {
  const PaymentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.greyColor3,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 17.0, 16.0, 17.0),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                        baseColor: AppColors.greyColor4,
                        highlightColor: Colors.grey[300]!,
                        child: const Skeleton(
                          radius: 5.0,
                          width: 16.0,
                          height: 16.0,
                          color: Colors.white,
                        )),
                    const SizedBox(width: 12.5),
                    Expanded(
                      child: Shimmer.fromColors(
                          baseColor: AppColors.greyColor4,
                          highlightColor: Colors.grey[300]!,
                          child: const Skeleton(
                            //width: 154.0,
                            height: 18.0,
                            radius: 5.0,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  const PaymentItemSkeletonWidget(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 16.0,
              ),
              itemCount: 4,
            )
          ],
        ),
      ),
    );
  }
}

class PaymentItemSkeletonWidget extends StatelessWidget {
  const PaymentItemSkeletonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints: BoxConstraints(
        minHeight: 235.0,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColorWithAlpha2,
            blurRadius: 32.0,
            spreadRadius: 0.0,
            offset: Offset(0, 4),
          )
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.greyColor3,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: AppColors.greyColor4,
                    highlightColor: Colors.grey[300]!,
                    child: const Skeleton(
                      radius: 5.0,
                      width: 88.0,
                      height: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: AppColors.greyColor4,
                    highlightColor: Colors.grey[300]!,
                    child: const Skeleton(
                      radius: 5.0,
                      width: 57.0,
                      height: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColors.greyColor4,
                      highlightColor: Colors.grey[300]!,
                      child: const Skeleton(
                        radius: 5.0,
                        width: 24.0,
                        height: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Shimmer.fromColors(
                      baseColor: AppColors.greyColor4,
                      highlightColor: Colors.grey[300]!,
                      child: const Skeleton(
                        radius: 5.0,
                        width: 88.0,
                        height: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    radius: 5.0,
                    width: 88.0,
                    height: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    radius: 5.0,
                    width: 25.0,
                    height: 17.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    radius: 5.0,
                    width: 57.0,
                    height: 17.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Shimmer.fromColors(
              baseColor: AppColors.greyColor4,
              highlightColor: Colors.grey[300]!,
              child: const Skeleton(
                radius: 12.0,
                width: double.infinity,
                height: 40.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 17.5,
          ),
          const Divider(
            color: AppColors.greyColor1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    radius: 7.0,
                    width: 24.0,
                    height: 24.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor4,
                  highlightColor: Colors.grey[300]!,
                  child: const Skeleton(
                    radius: 7.0,
                    width: 50.0,
                    height: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
