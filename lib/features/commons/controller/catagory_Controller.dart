import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/commons/model/catagory_list_model.dart';
import 'package:get/get.dart';

class CatagoryListController extends GetxController {
  final int _count = 30;
  int _currentpage = 0;
  int? lastpage;

  bool _inProcess = false;
  bool _initialLoadingInProcess = false;
  bool get initialLoadingInProcess => _initialLoadingInProcess;
  String? _errorMessage;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
   List<CatagoryListModel> _catagoryListModel = [];
  List<CatagoryListModel> get catagoryList => _catagoryListModel;
  int get catagoryLength => _catagoryListModel.length;

  int get homeCatagorylength =>
      _catagoryListModel.length > 10 ? 10 : _catagoryListModel.length;

  Future<void> getCatagory() async {
    _currentpage++;

    if (lastpage != null && lastpage! < _currentpage) {
      return;
    }
    if (_currentpage == 1) {
      _catagoryListModel.clear();
      _initialLoadingInProcess = true;
    } else {
      _inProcess = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.catagoriesListurl(_count, _currentpage),
    );
    if (response.isSuccess) {
      lastpage = response.responseData!['data']['last_page'] ?? 0;
      List<CatagoryListModel> list = [];
      for (Map<String, dynamic> slider
          in response.responseData!['data']['results']) {
        list.add(CatagoryListModel.fromJson(slider));
      }
      _catagoryListModel.addAll(list);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }
    _inProcess = false;
    if (_currentpage == 1) {
      _initialLoadingInProcess = false;
    } else {
      _inProcess = false;
    }
    update();
  }
}
