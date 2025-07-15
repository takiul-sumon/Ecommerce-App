import 'package:ecommerce_app/features/auth/data/models/login_model.dart';
import 'package:ecommerce_app/features/auth/ui/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/ui/ui/widgets/sncak_bar_messenger.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_app/features/commons/ui/screens/main_buttom_nav_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static final String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 60), // or any value
                  Applogo(),
                  SizedBox(height: 10),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  // SizedBox(height: 5),
                  Text(
                    'Please Enter Your Email Address',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),

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
                    controller: passwordTEController,
                    validator: (String? value) {
                      String passwordValue = value ?? '';
                      if (passwordValue.length <= 6) {
                        return 'Enter a password length greater then 6';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 5),
                  GetBuilder<LoginController>(
                    builder: (controller) => Visibility(
                      visible: controller.inProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: onTapLoginButton,
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text(
                          'Next',
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
        ),
      ),
    );
  }

  onTapLoginButton() async {
    if (_formKey.currentState!.validate()) {
      final LoginModel model = LoginModel(
        email: emailTEController.text.trim(),
        password: passwordTEController.text,
      );
      final bool isSuccess = await _loginController.Login(model);
      if (isSuccess) {
        Navigator.pushNamed(context, MainButtomNavScreen.name);
        showSnackBarMessenger(context, _loginController.message);
      } else {
        showSnackBarMessenger(
          context,
          _loginController.errorMessage ?? 'An unknown error occurred',
          true,
        );
      }
    }
  }
}
