import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/provider/otptimer_provider.dart';
import 'package:crafty_bay/features/auth/presentation/provider/verify_otp_provider.dart';
import 'package:crafty_bay/features/shered/presentation/presention/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../shered/presentation/widgets/show_snackbar_message.dart';
import '../../data/models/otp_params.dart';
import '../widgets/app_logo.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key, required this.email});

  static const String name = '/otp-verify';

  final String email;

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  PinInputController otpController = PinInputController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider();
  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _otpTimerProvider),
        ChangeNotifierProvider.value(value: _verifyOtpProvider),

      ],
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

                  Consumer<VerifyOtpProvider>(
                    builder: (context,_,_) {

                      if(_verifyOtpProvider.verifyProgress){

                        return Center(child: CircularProgressIndicator());
                      }
                      return FilledButton(
                        onPressed: _onTapVerifyOtpButton,

                        child: Text(context.localizations.next),
                      );
                    }
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

  void _onTapVerifyOtpButton() {

    if (_formKey.currentState!.validate()) {
      _verifyOtp();


    }
    //to do call sign in api
  }

  Future <void> _verifyOtp() async {
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(

      VerifyOtpParams(
        otpController.text,
        email: '',
      ),
    );
    if (isSuccess) {

      Navigator.pushNamedAndRemoveUntil(
          context, MainNavBar.name, (predicate) => false);




    }else{
      showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);


    }





  }

  void _onReset() {
    _otpTimerProvider.startTimer();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpController.dispose();
  }
}


