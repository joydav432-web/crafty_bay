

import 'package:crafty_bay/app/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/signin_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shered/presentation/utlis/validators.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});


  static const String name ='/sign-up';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  TextEditingController emailTEController = TextEditingController();
  TextEditingController firstnameTEController = TextEditingController();
  TextEditingController lastnameTEController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController shippingController = TextEditingController();

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (){},
            child: Column(
              children: [


                SizedBox(height: 80,),
                Applogo(),

                SizedBox(height: 15,),


                Text("Complete Profile",
                  style: TextTheme.of(context).headlineMedium,
                ),

                SizedBox(height: 5,),


                Text("Get Started with us with your Complete Details",
                  style: TextTheme.of(context).labelLarge,
                ),

                SizedBox(height: 40,),

            TextFormField(
              controller:emailTEController ,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  hintText: context.localizations.email,
                  labelText: context.localizations.email

              ),

              validator: (String?value)=>Validators.validateEmail(value),
            ),

                SizedBox(height: 12,),


                TextFormField(
                  controller: firstnameTEController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: context.localizations.fristname,
                      labelText: context.localizations.fristname

                  ),
                  validator: (String?value)=>Validators.validateInput(value,
                      "enter your first name"),
                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: lastnameTEController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: context.localizations.lastname,
                      labelText: context.localizations.lastname

                  ),
                  validator: (String?value)=>Validators.validateInput(value,
                      "enter your last name"),

                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: context.localizations.mobile,
                      labelText: context.localizations.mobile

                  ),

                  validator: (String?value)=>Validators.validateInput(value,
                      "enter your active number"),

                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: cityController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: context.localizations.city,
                      labelText: context.localizations.city

                  ),

                  validator: (String?value)=>Validators.validateInput(value,
                  "enter your current city"),

                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: shippingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: context.localizations.shipping,
                      labelText: context.localizations.shipping

                  ),

                  validator: (String?value)=>Validators.validateInput(value,
                      "enter your shipping address"),

                ),


                SizedBox(height: 25,),

                FilledButton(onPressed: _onComplete,

                    child: Text(context.localizations.complete)),


                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.localizations.account,
                      style: TextStyle(
                          color: AppColors.enableBorderColor
                      ),
                    ),
                    TextButton(onPressed: _onSignIn,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(context.localizations.signin)),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onComplete(){

   // if(_formKey.currentState!.validate()){
      //to do call complete api
   // }

    Navigator.pushNamed(context,
        OtpVerifyScreen.name);

  }
  void _onSignIn(){

    Navigator.pushNamed(context,
        SigninScreen.name);


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    firstnameTEController;
    lastnameTEController;
    mobileController;
    cityController;
    shippingController;
  }
}
