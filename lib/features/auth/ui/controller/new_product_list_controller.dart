import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/commons/ui/model/product_model.dart';
import 'package:get/get.dart';

class NewProductListController extends GetxController {
  bool _inProcess = false;
  String? _errorMessage;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
  List<ProductModel> popularProduct = [];
  List<ProductModel> get slider => popularProduct;
  Future<bool> getNewProduct() async {
    bool isSuccess = false;
    _inProcess = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.popularListByTagurl('new'),
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> slider
          in response.responseData!['data']['results']) {
        list.add(ProductModel.fromJson(slider));
      }
      popularProduct = list;
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
