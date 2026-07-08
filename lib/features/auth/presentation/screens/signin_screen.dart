import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/signup_scren.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shered/presentation/utlis/validators.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});


  static const String name ='/sign-in';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

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


                SizedBox(height: 110,),
                Applogo(width: 50,),

                SizedBox(height: 15,),


                Text("Welcome Back",
                style: TextTheme.of(context).headlineMedium,
                ),

                SizedBox(height: 5,),


                Text("Sing in With Your Email & Password",
                style: TextTheme.of(context).labelLarge,
                ),

                SizedBox(height: 40,),


                TextFormField(
                  controller: emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localizations.email,
                    labelText: context.localizations.email

                  ),
                  validator: (String?value)=>Validators.validateEmail(value),
                ),

                SizedBox(height: 12),

                TextFormField(
                  controller: passwordTEController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: context.localizations.password,
                    labelText: context.localizations.password

                  ),

                  validator: (input)=>Validators.validatePassword(input),
                ),

                SizedBox(height: 25,),

                FilledButton(onPressed: _onTapSignIn,

                    child: Text(context.localizations.signin)),


                SizedBox(height: 10,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.localizations.account,
                    style: TextStyle(
                      color: AppColors.enableBorderColor
                    ),
                    ),
                    TextButton(onPressed: _onSignup,
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(context.localizations.signup)),
                  ],
                ),


                TextButton(onPressed: _onForgetPass,
                    child: Text(context.localizations.forget))



              ],
                   ),
           ),
         ),
       ),
    );
  }

  void _onTapSignIn(){

    if(_formKey.currentState!.validate()){
      //to do call sign in api
    }

  }

  void _onSignup(){

    Navigator.pushNamed(context,
        SignUpScreen.name);


  }

  void _onForgetPass(){


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
  }
}
