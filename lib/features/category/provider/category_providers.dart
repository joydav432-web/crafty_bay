

import 'package:flutter/foundation.dart';

import '../../../../app/get_networkcaller.dart';
import '../../../../app/urls.dart';
import '../../../../core/service/network_caller/network_caller.dart';
import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  bool _categoryInProgress = false;
  bool get categoryInProgress => _categoryInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> getCategories() async {
    bool isSuccess = false;

    _categoryInProgress = true;
    notifyListeners();

    final NetworkResponse response = await networkCaller.getRequest(
      Urls.categoryUrl,
    );

    if (response.isSuccess) {
      List<CategoryModel> categoryList = [];

      for (Map<String, dynamic> model
      in response.body['data']['results']) {
        categoryList.add(CategoryModel.fromJson(model));
      }

      _categories = categoryList;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _categoryInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}