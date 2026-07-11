import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/provider/signin_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/signup_scren.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shered/presentation/utlis/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shered/presentation/presention/main_nav_bar.dart';
import '../../../shered/presentation/widgets/show_snackbar_message.dart';
import '../../data/models/signin_params.dart';

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

  final SignInProvider _signInProvider = SignInProvider();


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _signInProvider,

      child: Scaffold(
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

                  Consumer<SignInProvider>(
                    builder: (context,_,_) {

                      if(_signInProvider.signInInProgress){

                        return Center(child: CircularProgressIndicator());

                      }
                      return FilledButton(onPressed: _onTapSignIn,

                          child: Text(context.localizations.signin));
                    }
                  ),


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
      ),
    );
  }

  void _onTapSignIn(){

    if(_formKey.currentState!.validate()){
      _signIn();
      //to do call sign in api
    }

  }


  Future<void> _signIn() async {

    final isSuccess = await _signInProvider.signIn(

      SignInParams(
        email: emailTEController.text.trim(),
        password: passwordTEController.text.trim(),
      ),
    );

    if(isSuccess && mounted){

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => MainNavBar()),
                (predicate) => false);

    }else if(mounted){

        showSnackBarMessage(context, _signInProvider.errorMessage!);

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
