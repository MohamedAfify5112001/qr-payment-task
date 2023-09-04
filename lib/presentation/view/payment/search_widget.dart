import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/presentation/view_model/payment/payment_view_model_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.greyColor3,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 17.0, 0.0, 17.0),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/Icon_16px_Search.svg',
                fit: BoxFit.scaleDown),
            const SizedBox(
              width: 12.5,
            ),
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: (value) =>
                    BlocProvider.of<PaymentViewModelBloc>(context).add(
                  SearchPaymentEvent(name: searchController.text),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.greyColor2,
                      ),
                  contentPadding: EdgeInsets.zero,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search what you need... ',
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
