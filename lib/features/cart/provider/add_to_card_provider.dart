import 'package:flutter/foundation.dart';

import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../../app/get_networkcaller.dart';
import '../data/model/add_to_cart_pharms.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _isLoading = false;

  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(AddToCartParams params) async {
    bool isSuccess = false;

    _isLoading = true;
    notifyListeners();

    final NetworkResponse response = await networkCaller().postRequest(
      Urls.addToCartUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _isLoading = false;
    notifyListeners();

    return isSuccess;
  }
}