import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_demo/presentation/view/details_qr_code_screen/single/single_card_details.dart';

import '../../../widgets/download_widget.dart';

class SingleDetailsQrCodeScreen extends StatelessWidget {
  const SingleDetailsQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            SingleDetailsCardWidget(),
            SizedBox(
              height: 32.0,
            ),
            DownloadActionButtonWidget(),
            SizedBox(
              height: 32.0,
            ),
          ],
        ),
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
        'Details',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 18.0,
            ),
      ),
      actions: [
        SvgPicture.asset('assets/images/ic_share.svg'),
        const SizedBox(
          width: 16.0,
        )
      ],
    );
  }
}
