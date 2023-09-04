import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/presentation/view_model/payment/payment_view_model_bloc.dart';

import '../../../domain/entities/payment_entity.dart';

class PaymentItemsWidget extends StatelessWidget {
  final List<PaymentEntity> payments;

  const PaymentItemsWidget({
    this.payments = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentViewModelBloc, PaymentViewModelState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              PaymentItem(payment: payments[index]),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16.0,
          ),
          itemCount: payments.length,
        );
      },
    );
  }
}

class PaymentItem extends StatelessWidget {
  final PaymentEntity payment;

  const PaymentItem({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: 235.0,
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
        children: <Widget>[
          TitlePaymentCardWidget(payment: payment),
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
                    SvgPicture.asset('assets/images/svgexport-17.svg'),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      'Visa',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Text(
                  '${payment.budget} KWD',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Due',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12.0,
                        color: AppColors.orangeColor,
                      ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  payment.date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12.0,
                        color: AppColors.orangeColor,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            constraints: const BoxConstraints(maxWidth: 310.0),
            child: Text(
              payment.desc,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.greyColor2,
                  ),
            ),
          ),
          const SizedBox(
            height: 17.5,
          ),
          const Divider(
            color: AppColors.greyColor1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/pay.svg'),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                'Pay Now',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 12.0,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TitlePaymentCardWidget extends StatelessWidget {
  final PaymentEntity payment;

  const TitlePaymentCardWidget({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightPurpleColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              payment.title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              payment.date,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 12.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
