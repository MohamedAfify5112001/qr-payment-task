import 'package:flutter/material.dart';

class DownloadActionButtonWidget extends StatelessWidget {
  const DownloadActionButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 13.0,
          ),
          child: Text(
            'Download',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
