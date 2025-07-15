import 'package:ecommerce_app/app/urls.dart';
import 'package:ecommerce_app/core/services/network/network_client.dart';
import 'package:ecommerce_app/features/home/data/models/slider_model.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  bool _inProcess = false;
  String? _errorMessage;
  late String _message;
  bool get inProgress => _inProcess;
  String? get errorMessage => _errorMessage;
  String get message => _message;
  List<SliderModel> _sliderModel = [];
  List<SliderModel> get slider => _sliderModel;
  Future<bool> getSlider() async {
    bool isSuccess = false;
    _inProcess = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.homeSliderurl,
    );
    if (response.isSuccess) {
      List<SliderModel> list = [];
      for (Map<String, dynamic> slider
          in response.responseData!['data']['results']) {
        list.add(SliderModel.fromJson(slider));
      }
      _sliderModel = list;
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
