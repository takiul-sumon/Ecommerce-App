import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/commons/ui/model/product_details_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProcess = false;
  String? _errorMessage;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
  late ProductDetailsModel productDetails;
  ProductDetailsModel get slider => productDetails;
  Future<bool> getProductDetails(String id) async {
    bool isSuccess = false;
    _inProcess = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productDetailsUrl(id),
    );
    if (response.isSuccess) {
      productDetails = ProductDetailsModel.fromJson(
        response.responseData!['data'],
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
}
