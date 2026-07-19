
import 'package:crafty_bay/features/products/data/model/product_model.dart';

import '../../../../app/get_networkcaller.dart';
import 'package:flutter/foundation.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';

class ProductListProvider extends ChangeNotifier {
  bool _isInitialLoading = false;
  bool _isLoadMoreLoading = false;

  final int productPerPage =32;

  int _currentPage = 0;
  int? _lastPage;

  String? _errorMessage;
  final List<ProductModel> _productList = [];
  bool get isInitialLoading => _isInitialLoading;
  bool get isLoadMoreLoading => _isLoadMoreLoading;
  List<ProductModel> get productList => _productList;
  String? get errorMessage => _errorMessage;


  Future<bool> getProductData() async {
    bool isSuccess = false;

    if (_currentPage == 0 || (_lastPage != null && _currentPage < _lastPage!)) {
      _currentPage++;
    } else {
      return false;
    }

    if (_currentPage == 1) {
      _isInitialLoading = true;
    } else {
      _isLoadMoreLoading = true;
    }

    notifyListeners();

    final NetworkResponse response = await networkCaller.getRequest(
      Urls.productListUrl(_currentPage,productPerPage)
    );

    if (response.isSuccess) {
      isSuccess = true;
      List<ProductModel> list = [];
      for (Map<String, dynamic> jsonData in response.body['data']['results']) {
        list.add(ProductModel.fromJson(jsonData));
      }
      _productList.addAll(list);
      _lastPage = response.body['data']['last_page'];
    } else {
      _errorMessage = response.errorMessage;
    }

    if (_currentPage == 1) {
      _isInitialLoading = false;
    } else {
      _isLoadMoreLoading = false;
    }

    notifyListeners();

    return isSuccess;

  }

  void refreshCategoryList() {
    _currentPage = 0;
    _productList.clear();
    _lastPage = null;
    getProductData();
  }

  bool get isLoading=>_isInitialLoading||_isLoadMoreLoading;

}
