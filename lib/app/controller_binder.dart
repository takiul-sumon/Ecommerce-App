import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/auth/ui/controller/auth_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/catagory_Controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/new_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/popular_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/sign_up_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/slider_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/special_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/login_screen.dart';
import 'package:ecommerce_app/features/commons/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/commons/ui/controller/product_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(VerifyOtpController());
    Get.put(LoginController());
    Get.put(SliderController());

    Get.put(
      NetworkClient(
        onUnAthorized: _onUnAuthorized,
        commonHeaders: () {
          return _commonHeaders();
        },
      ),
    );
    Get.put(SignUpController());
    Get.put(MainBottomNavScreenController());
    Get.put(CatagoryListController());
    Get.put(ProductListByCatagoryController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
  }

  void _onUnAuthorized() async {
    await Get.find<AuthController>().clearUserData();
    Get.to(() => LoginScreen());
  }

  Map<String, String> _commonHeaders() {
    return {
      'content-type': 'application/json',
      'token': Get.find<AuthController>().accessToken ?? '',
    };
  }
}
