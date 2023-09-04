import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_demo/app/enum/app_enum.dart';
import 'package:qr_code_demo/presentation/view/details_qr_code_screen/multiple/multiple_details_qr_code_screen.dart';
import 'package:qr_code_demo/presentation/view/details_qr_code_screen/single/single_details_qr_code_screen.dart';
import 'package:qr_code_demo/presentation/view/details_qr_code_screen/details/qr_details_skeleton.dart';
import 'package:qr_code_demo/presentation/view_model/details_qr/details_qr_code_view_model_bloc.dart';
import 'package:share_plus/share_plus.dart';

class DetailsQrScreen extends StatefulWidget {
  const DetailsQrScreen({super.key});

  @override
  State<DetailsQrScreen> createState() => _DetailsQrScreenState();
}

class _DetailsQrScreenState extends State<DetailsQrScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailsQrCodeViewModelBloc>(context)
        .add(const GetTypeQrDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsQrCodeViewModelBloc, DetailsQrCodeViewModelState>(
      builder: (context, state) {
        if (state is LoadingDetailsQrCodeViewModelState) {
          return Scaffold(
            appBar: _buildAppBar(context),
            body: const DetailsQrSkeleton(),
          );
        } else if (state is SuccessDetailsQrCodeViewModelState) {
          if (state.typeQrDetails == TypeQrDetails.single) {
            return Scaffold(
              appBar: _buildAppBar(context),
              body: const SingleDetailsQrCodeScreen(),
            );
          } else {
            return Scaffold(
              appBar: _buildAppBar(context),
              body: const MultipleDetailsQrCodeScreen(),
            );
          }
        } else {
          return Scaffold(
            appBar: _buildAppBar(context),
            body: const SizedBox.shrink(),
          );
        }
      },
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
        'Details',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18.0,
            ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Share.share('com.qr_code_demo.qr.qr_code_demo');
          },
          child: SvgPicture.asset('assets/images/ic_share.svg'),
        ),
        const SizedBox(
          width: 16.0,
        )
      ],
    );
  }
}
