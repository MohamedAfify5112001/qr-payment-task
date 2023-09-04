import 'package:flutter/material.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';

class AppAlertDialog extends StatelessWidget {
  final Function onConfirm;
  final Widget title;
  final String subtitle;

  const AppAlertDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      backgroundColor: AppColors.whiteColor,
      title: title,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(subtitle),
            const SizedBox(height: 32.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        side:
                            BorderSide(width: 1.0, color: AppColors.greyColor1),
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.greyColor2,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 23.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                    child: Text(
                      'Ok',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.whiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
