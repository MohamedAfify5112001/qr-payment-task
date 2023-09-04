import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_demo/presentation/view/payment/payment_items_widget.dart';
import 'package:qr_code_demo/presentation/view/payment/payment_skeleton.dart';
import 'package:qr_code_demo/presentation/view/payment/search_widget.dart';
import 'package:qr_code_demo/presentation/view_model/payment/payment_view_model_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PaymentViewModelBloc>(context)
        .add(const FetchAllPaymentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<PaymentViewModelBloc, PaymentViewModelState>(
        builder: (context, paymentState) {
          if (paymentState is LoadingFetchAllPaymentsState) {
            return const PaymentSkeleton();
          } else if (paymentState is SuccessFetchAllPaymentsState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Column(
                  children: [
                    const SearchWidget(),
                    const SizedBox(
                      height: 16.0,
                    ),
                    PaymentItemsWidget(payments: paymentState.payments)
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: SvgPicture.asset(
        'assets/images/Iconsax_Linear_arrowleft.svg',
        fit: BoxFit.scaleDown,
      ),
      title: Text(
        'Payment',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18.0,
            ),
      ),
    );
  }
}
