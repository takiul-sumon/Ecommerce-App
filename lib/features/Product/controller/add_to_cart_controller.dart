import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/commons/model/product_details_model.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProcess = false;
  String? _errorMessage;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
  late ProductDetailsModel productDetails;
  ProductDetailsModel get slider => productDetails;
  Future<bool> getProductToCart(String id) async {
    bool isSuccess = false;
    _inProcess = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.addToCartUrl, body: {'product': id});
    if (response.isSuccess) {
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
