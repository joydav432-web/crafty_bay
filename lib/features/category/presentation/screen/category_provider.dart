
import '../../../../app/get_networkcaller.dart';
import 'package:flutter/foundation.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../../data/model/category_model.dart';

class CategoryListProvider extends ChangeNotifier {
  bool _isInitialLoading = false;
  bool _isLoadMoreLoading = false;

  final int categoryPerPage =32;

  int _currentPage = 0;
  int? _lastPage;

  String? _errorMessage;
  final List<CategoryModel> _categoryList = [];
  bool get isInitialLoading => _isInitialLoading;
  bool get isLoadMoreLoading => _isLoadMoreLoading;
  List<CategoryModel> get categoryList => _categoryList;
  String? get errorMessage => _errorMessage;


  Future<bool> getCategoriesData() async {
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

    final NetworkResponse response = await networkCaller().getRequest(
      Urls.categoryListUrl(_currentPage, categoryPerPage),
    );

    if (response.isSuccess) {
      isSuccess = true;
      List<CategoryModel> list = [];
      for (Map<String, dynamic> jsonData in response.body['data']['results']) {
        list.add(CategoryModel.fromJson(jsonData));
      }
      _categoryList.addAll(list);
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
    _categoryList.clear();
    _lastPage = null;
    getCategoriesData();
  }

  bool get isLoading=>_isInitialLoading||_isLoadMoreLoading;
}
