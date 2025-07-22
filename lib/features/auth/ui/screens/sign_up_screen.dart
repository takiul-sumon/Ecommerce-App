import 'package:bd_phone_validator/bd_phone_validator.dart';
import 'package:ecommerce_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:ecommerce_app/features/auth/ui/controller/sign_up_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:ecommerce_app/core/ui/sncak_bar_messenger.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/ui/widgets/centered_circular_progress_indicator.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static final String name = '/SignUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();
  final TextEditingController cityNameTEController = TextEditingController();
  final TextEditingController locationTEController = TextEditingController();

  final TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10), // or any value
                        Applogo(),
                        SizedBox(height: 10),
                        Text(
                          'Complete Profile',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'Get started with us with your details',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: emailTEController,
                          validator: (String? value) {
                            String emailValue = value ?? '';
                            if (EmailValidator.validate(emailValue) == false) {
                              return 'Enter a Valid Email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: 'Email'),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 10),

                        TextFormField(
                          controller: firstNameTEController,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter a  First Name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(hintText: 'First Name'),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: lastNameTEController,

                          decoration: InputDecoration(hintText: 'Last Name'),
                          textInputAction: TextInputAction.next,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter a  Last Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: mobileTEController,
                          validator: (String? value) {
                            String mobileValue = value ?? '';
                            if (BdPhoneValidator.validate(mobileValue) ==
                                false) {
                              return 'Enter a Valid Mobile';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: 'Mobile'),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: cityNameTEController,
                          validator: (String? value) {
                            if (value?.trim().isEmpty == true) {
                              return 'Enter a Valid City';
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: 'City'),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 10),

                        TextFormField(
                          controller: locationTEController,
                          maxLines: 2,
                          validator: (String? value) {
                            if (value?.trim().isEmpty == true) {
                              return 'Enter a Valid Location';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'Shopping Address',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: passwordTEController,
                          validator: (String? value) {
                            if ((value?.length ?? 0) <= 6) {
                              return 'Enter a password more than 6 letters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(hintText: 'Password'),
                        ),
                        SizedBox(height: 10),
                        GetBuilder<SignUpController>(
                          builder: (_) => Visibility(
                            visible: _signUpController.inProgress == false,
                            replacement: CenteredCircularProgressIndicator(),
                            child: ElevatedButton(
                              onPressed: onTapLoginButton,
                              style: Theme.of(
                                context,
                              ).elevatedButtonTheme.style,
                              child: Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // or any value
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have an account?'),
                    TextButton(
                      onPressed: onTapLoginPageButton,
                      child: Text('Login In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapLoginPageButton() {
    Navigator.pop(context);
  }

  Future<void> onTapLoginButton() async {
    if (_formKey.currentState?.validate() ?? true) {
      final SignUpRequestModel model = SignUpRequestModel(
        email: emailTEController.text.trim(),
        firstName: firstNameTEController.text.trim(),
        lasttName: lastNameTEController.text.trim(),
        city: cityNameTEController.text.trim(),
        phone: mobileTEController.text.trim(),
        password: passwordTEController.text,
      );
      final bool isSuccess = await _signUpController.signUp(model);
      if (isSuccess) {
        Navigator.pushNamed(
          context,
          VerifyOtpScreen.name,
          arguments: emailTEController.text.trim(),
        );
        showSnackBarMessenger(context, _signUpController.message);
      } else {
        showSnackBarMessenger(
          context,
          _signUpController.errorMessage ?? 'An unknown error occurred',
          true,
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstNameTEController.dispose();
    lastNameTEController.dispose();
    emailTEController.dispose();
    locationTEController.dispose();
    passwordTEController.dispose();
    mobileTEController.dispose();
    cityNameTEController.dispose();
  }
}


