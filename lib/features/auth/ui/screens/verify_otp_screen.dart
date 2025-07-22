import 'package:ecommerce_app/features/auth/data/models/verify_otp_model.dart';
import 'package:ecommerce_app/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:ecommerce_app/core/ui/sncak_bar_messenger.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo.dart';
import 'package:ecommerce_app/features/commons/ui/screens/main_buttom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.emailAddress});
  static final String name = '/verify-otp-screen';
  final String emailAddress;
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  onTapValidateField() async {
    if (_formKey.currentState!.validate()) {
      VerifyOtpModel model = VerifyOtpModel(
        email: widget.emailAddress,
        otp: _otpController.text,
      );
       bool isSuccess = await Get.find<VerifyOtpController>().verifyOtp(
        model,
      );
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainButtomNavScreen.name,
          (route) => false,
        );
      } else {
        showSnackBarMessenger(
          context,
          Get.find<VerifyOtpController>().errorMessage!,
          true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 60),
              Applogo(),
              SizedBox(height: 10),
              Text(
                'Enter OTP Code',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              // SizedBox(height: 5),
              Text(
                'A 4 digit OTP has been sent to   ${widget.emailAddress}',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Pinput(
                controller: _otpController,
                obscureText: false,
                length: 4,
                focusedPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Colors.green),
                ),
                errorPinTheme: defaultPinTheme.copyDecorationWith(
                  border: Border.all(color: Colors.red),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.length < 4) {
                    return 'Enter Correct Pin';
                  }
                  return null;
                },
              ),

              GetBuilder<VerifyOtpController>(
                builder: (controller) => ElevatedButton(
                  onPressed: onTapValidateField,
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    'Verify',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 60), // or any value
            ],
          ),
        ),
      ),
    );
    // ignore: dead_code
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
