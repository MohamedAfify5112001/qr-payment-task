import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_demo/app/locator/locator.dart';
import 'package:qr_code_demo/app/styles/app_color.dart';
import 'package:qr_code_demo/presentation/view/details_qr_code_screen/details/details_screen.dart';
import 'package:qr_code_demo/presentation/view/payment/payment_screen.dart';
import 'package:qr_code_demo/presentation/view_model/details_qr/details_qr_code_view_model_bloc.dart';
import 'package:qr_code_demo/presentation/view_model/payment/payment_view_model_bloc.dart';
import 'package:qr_code_demo/presentation/view_model/questions/question_view_model_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instance<QuestionViewModelBloc>(),
        ),
        BlocProvider(
          create: (context) => instance<PaymentViewModelBloc>(),
        ),
        BlocProvider(
          create: (context) => instance<DetailsQrCodeViewModelBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: AppColors.whiteColor,
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.whiteColor,
              foregroundColor: AppColors.whiteColor,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0.0,
              scrolledUnderElevation: 0.0),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: AppColors.primaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.greyColor1,
                width: 1.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.greyColor1,
                width: 1.0,
              ),
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(
              16.0,
              10.0,
              0.0,
              10.0,
            ),
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.greyColor2,
                ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: AppColors.redColor,
                width: 1.0,
              ),
            ),
          ),
          fontFamily: 'Montserrat',
          useMaterial3: true,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w800,
              fontSize: 41.0,
            ),
            titleLarge: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w800,
              fontSize: 24.0,
            ),
            headlineLarge: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w800,
              fontSize: 18.0,
            ),
            titleMedium: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 14.0,
            ),
            headlineMedium: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
            bodyMedium: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
            titleSmall: TextStyle(
              color: AppColors.greyColor1,
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
            bodySmall: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
            displaySmall: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
        ),
        home: const PaymentScreen(),
      ),
    );
  }
}
