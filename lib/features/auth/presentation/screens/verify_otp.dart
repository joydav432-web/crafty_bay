import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/provider/otptimer_provider.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../widgets/app_logo.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});

  static const String name = '/otp-verify';

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  PinInputController otpController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _otpTimerProvider.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _otpTimerProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: () {},
              child: Column(
                children: [
                  SizedBox(height: 110),
                  Applogo(width: 50),

                  SizedBox(height: 15),

                  Text(
                    "Enter OTP Code",
                    style: TextTheme.of(context).headlineMedium,
                  ),

                  SizedBox(height: 5),

                  Text(
                    "a 4 digit code has been sent",
                    style: TextTheme.of(context).labelLarge,
                  ),

                  SizedBox(height: 40),

                  MaterialPinField(
                    pinController: otpController,

                    length: 4,
                    blinkDuration: Duration(milliseconds: 300),
                    keyboardType: TextInputType.number,
                    theme: MaterialPinTheme(
                      fillColor: Colors.grey,
                      focusedFillColor: Colors.grey,
                      focusedBorderColor: Colors.green,
                    ),
                  ),

                  SizedBox(height: 40),

                  FilledButton(
                    onPressed: _onNext,

                    child: Text(context.localizations.next),
                  ),

                  SizedBox(height: 30),

                  Consumer<OtpTimerProvider>(
                    builder: (context, _, _) {
                      if (_otpTimerProvider.secondsLeft == 0) {
                        return TextButton(
                          onPressed: _onReset,
                          child: Text(
                            "Resend Code",
                            style: TextStyle(color: AppColors.themeColor),
                          ),
                        );
                      } else {
                        return RichText(
                          text: TextSpan(
                            style: TextStyle(color: AppColors.largeColor),
                            children: [
                              TextSpan(text: "Resend OTP after  "),

                              TextSpan(
                                text: '${_otpTimerProvider.secondsLeft}',
                                style: TextStyle(color: AppColors.themeColor),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onNext() {
    //to do call sign in api
  }

  void _onReset() {
    _otpTimerProvider.startTimer();
  }
}
