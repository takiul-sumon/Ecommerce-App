import 'package:ecommerce_app/features/auth/ui/screens/Main_Buttom_Nav_Bar.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static final String name = '/SignUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailTEController = TextEditingController();

  TextEditingController firstNameTEController = TextEditingController();
  TextEditingController lastNameTEController = TextEditingController();
  TextEditingController mobileTEController = TextEditingController();
  TextEditingController cityNameTEController = TextEditingController();
  TextEditingController locationTEController = TextEditingController();

  TextEditingController passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Spacer(),
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
                      String firstNameValue = value ?? '';
                      if (firstNameValue.isEmpty) {
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
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: mobileTEController,
                    validator: (String? value) {
                      String emailValue = value ?? '';
                      if (EmailValidator.validate(emailValue) == false) {
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
                      String cityValue = value ?? '';
                      if (cityValue.isEmpty) {
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
                      String passwordValue = value ?? '';
                      if (passwordValue.length < 6) {
                        return 'Enter a password length greater then 6';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(hintText: 'Shopping Address'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
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
                  SizedBox(height: 10),
                  SizedBox(
                    width: 330,
                    child: ElevatedButton(
                      onPressed: onTapLoginButton,
                      style: Theme.of(context).elevatedButtonTheme.style,
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapLoginButton() {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return MainButtomNavBar();
    //     },
    //   ),
    // );
    // if (_formKey.currentState!.validate()) {}
  }
}
