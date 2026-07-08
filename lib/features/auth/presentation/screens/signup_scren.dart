import 'package:crafty_bay/app/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shered/presentation/utlis/validators.dart';
import '../../../shered/presentation/widgets/show_snackbar_message.dart';
import '../../data/models/signup_params.dart';
import '../provider/signup_provider.dart';
import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignUpProvider _signUpProvider = SignUpProvider();

  bool _enableButton = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return ChangeNotifierProvider.value(
      value: _signUpProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: _checkIfFormValid,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Applogo(width: 80),
                    const SizedBox(height: 16),
                    Text('Create an Account', style: textTheme.titleLarge),
                    const SizedBox(height: 6),
                    Text(
                      'Sign up with your email and password',
                      style: textTheme.labelLarge,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: context.localizations.email,
                        hintText: context.localizations.email,
                      ),
                      validator: (String? value) =>
                          Validators.validateEmail(value),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'First name',
                        hintText: 'First name',
                      ),
                      validator: (String? value) => Validators.validateInput(
                        value,
                        'Enter your first name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Last name',
                        hintText: 'LAst name',
                      ),
                      validator: (String? value) => Validators.validateInput(
                        value,
                        'Enter your last name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _cityTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'City',
                        hintText: 'City',
                      ),
                      validator: (String? value) => Validators.validateInput(
                        value,
                        'Enter your city name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Phone',
                      ),
                      validator: (String? value) => Validators.validateInput(
                        value,
                        'Enter your phone number',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        labelText: context.localizations.password,
                        hintText: context.localizations.password,
                      ),
                      validator: (input) => Validators.validatePassword(input),
                    ),
                    const SizedBox(height: 16),
                    Consumer<SignUpProvider>(
                      builder: (context, _, child) {
                        if (_signUpProvider.signUpInInProgress) {
                          return const CircularProgressIndicator();
                        }

                        return FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: _enableButton == false
                                ? Colors.grey
                                : null,
                          ),
                          onPressed: _enableButton ? _onTapSignUpButton : null,
                          child: child,
                        );
                      },
                      child: Text('Sign Up'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _onTapSignInButton,
                      child: Text("Have an account? Sign In"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _checkIfFormValid() {
    if (_formKey.currentState!.validate()) {
      _enableButton = true;
    } else {
      _enableButton = false;
    }
    setState(() {});
  }

  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp() async {
    SignUpParams params = SignUpParams(
      email: _emailTEController.text.trim(),
      firstName: _firstNameTEController.text.trim(),
      lastName: _lastNameTEController.text.trim(),
      city: _cityTEController.text.trim(),
      phone: _phoneTEController.text.trim(),
      password: _passwordTEController.text,
    );
    final bool isSuccess = await _signUpProvider.signUp(params);
    if (isSuccess) {
      Navigator.pushNamed(context, OtpVerifyScreen.name);
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMessage!);
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _cityTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
