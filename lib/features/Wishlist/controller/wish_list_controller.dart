import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/commons/model/product_model.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  final int _count = 30;

  int _currentpage = 0;
  int? lastpage;

  bool _inProcess = false;
  bool _initialLoadingInProcess = false;
  bool get initialLoadingInProcess => _initialLoadingInProcess;
  String? _errorMessage;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
  List<ProductModel> _productListModel = [];
  List<ProductModel> get catagoryList => _productListModel;

  int get catagoryLength => _productListModel.length;

  int get homeCatagorylength =>
      _productListModel.length > 10 ? 10 : _productListModel.length;

  Future<void> getCatagory() async {
    _currentpage++;

    if (lastpage != null && lastpage! < _currentpage) {
      return;
    }
    if (_currentpage == 1) {
      _productListModel.clear();
      _initialLoadingInProcess = true;
    } else {
      _inProcess = true;
    }
    update();

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.getWishItemListUrl,
    );
    if (response.isSuccess) {
      lastpage = response.responseData!['data']['last_page'] ?? 0;
      List<ProductModel> list = [];

      for (Map<String, dynamic> item
          in response.responseData!['data']['results']) {
        final product = item['product'];
        list.add(ProductModel.fromJson(product));
      }

      _productListModel.addAll(list);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    if (_currentpage == 1) {
      _initialLoadingInProcess = false;
    } else {
      _inProcess = false;
    }
    update();
  }
}
