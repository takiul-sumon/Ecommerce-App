import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/commons/model/user_model.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp_model.dart';
import 'package:ecommerce_app/features/commons/controller/auth_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  //loading State
  bool _inProcess = false;
  String? _errorMessage;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
  Future<bool> verifyOtp(VerifyOtpModel model) async {
    bool isSuccess = false;
    _inProcess = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.otpUrl, body: model.toJson());
    if (response.isSuccess) {
      await Get.find<AuthController>().saveUserData(
        response.responseData?['data']['token'],
        UserModel.fromJson(response.responseData?['data']['user']),
      );
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProcess = false;
    update();
    return isSuccess;
  }

  //error State
  //Data Model
  //Actual Method
}
