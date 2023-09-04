import 'package:flutter/material.dart';

import '../../../widgets/download_widget.dart';
import 'multiple_card_details.dart';

class MultipleDetailsQrCodeScreen extends StatelessWidget {
  const MultipleDetailsQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            MultipleCardDetails(),
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
}
