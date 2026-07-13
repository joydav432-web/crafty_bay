import '../../../../app/get_networkcaller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/model/slider_model.dart';
import 'package:flutter/foundation.dart';

class HomeSliderProviders extends ChangeNotifier {
  List<SliderModel> _slider = [];

  List<SliderModel> get slider => _slider;

  bool _sliderInProgress = false;
  bool get sliderInProgress => _sliderInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getSlider() async {
    bool isSuccess = false;
    _sliderInProgress = true;
    notifyListeners();

    final NetworkResponse response = await networkCaller.getRequest(
      Urls.homeSliderUrl,
    );

    if (response.isSuccess) {
      List<SliderModel> sliderModels = [];
      for (Map<String, dynamic> model in response.body['data']['results']) {
        sliderModels.add(SliderModel.fromJson(model));
      }

      _slider = sliderModels;
      isSuccess = true;

      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _sliderInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
