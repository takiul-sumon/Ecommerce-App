import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/Product/controller/add_to_cart_controller.dart';
import 'package:ecommerce_app/features/commons/controller/auth_controller.dart';
import 'package:ecommerce_app/features/cart/ui/controllers/cart_item_controller.dart';
import 'package:ecommerce_app/features/commons/controller/catagory_Controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/login_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/new_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/popular_product_list_controller.dart';
import 'package:ecommerce_app/features/Product/controller/product_details_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/sign_up_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/slider_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/special_product_list_controller.dart';
import 'package:ecommerce_app/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:ecommerce_app/features/Wishlist/controller/wish_list_controller.dart';
import 'package:ecommerce_app/features/commons/ui/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app/features/Product/controller/product_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // Register AuthController first
    Get.put(AuthController());

    // Use Get.find() to get the same instance everywhere
    final AuthController authController = Get.find<AuthController>();

    // Setup NetworkClient using same instance
    Get.put(
      NetworkClient(
        onUnAthorized: () async {
          // await authController.clearUserData();
          // Get.offAll(() => LoginScreen());
        },
        commonHeaders: () {
          return {
            'content-type': 'application/json',
            'token': authController.accessToken ?? '',
          };
        },
      ),
    );

    // Add other controllers
    Get.put(VerifyOtpController());
    Get.put(LoginController());
    Get.put(SliderController());
    Get.put(SignUpController());
    Get.put(MainBottomNavScreenController());
    Get.put(CatagoryListController());
    Get.put(ProductListByCatagoryController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
    Get.put(AddToCartController());
    Get.put(ProductDetailsController());
    Get.put(CartListController());
    Get.put(WishListController());
  }
}
