import 'package:ecommerce_app/features/auth/ui/screens/Main_Buttom_Nav_Bar.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Spacer(),
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

                SizedBox(
                  height: 50,
                  width: 330,
                  child: TextFormField(
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
                ),
                SizedBox(height: 5),

                SizedBox(
                  height: 50,
                  width: 330,
                  child: TextFormField(
                    controller: passwordTEController,
                    validator: (String? value) {
                      String passwordValue = value ?? '';
                      if (passwordValue.length < 6) {
                        return 'Enter a password length greater then 6';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ),
                SizedBox(
                  width: 330,
                  child: ElevatedButton(
                    onPressed: onTapLoginButton,
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text('Next', style: TextStyle(color: Colors.white)),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapLoginButton() {
    Navigator.of(context).pushReplacement(
      DialogRoute(
        context: context,
        builder: (context) {
          return MainButtomNavBar();
        },
      ),
    );
    // if (_formKey.currentState!.validate()) {}
  }
}
