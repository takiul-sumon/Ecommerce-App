import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/auth/data/models/login_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool _inProcess = false;
  String? _errorMessage;
  late String _message;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
  String get message => _message;
  Future<bool> Login(LoginModel model) async {
    bool isSuccess = false;
    _inProcess = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.loginUrl, body: model.toJson());
    if (response.isSuccess) {
      _message = response.responseData!['msg'];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProcess = false;
    update();
    return isSuccess;
  }
}
