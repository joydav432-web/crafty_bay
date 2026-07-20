import 'package:flutter/widgets.dart';

import '../../../app/get_networkcaller.dart';
import '../../../app/urls.dart';
import '../../../core/service/network_caller/network_caller.dart';
import '../data/model/product_deatails_model.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _getProductDetailsInProgress = false;
  bool get getProductDetailsInProgress => _getProductDetailsInProgress;
  String? _errorMessage;
  ProductDetailsModel? _productDetailsModel;
  String? get errorMessage => _errorMessage;
  ProductDetailsModel? get productDetailsModel => _productDetailsModel;
  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;
    _getProductDetailsInProgress = true;
    notifyListeners();

    final NetworkResponse response = await networkCaller.getRequest(
      Urls.productDetailsUrl(productId),
    );

    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(
        response.body['data'],
      );
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getProductDetailsInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
