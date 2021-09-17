import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_app/core/manager/locale_manager.dart';
import 'package:test_app/models/base_model.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/services/concrete/auth_service.dart';

class MyDialogViewModel extends BaseViewModel {
  BuildContext context;
  setContext(BuildContext context) => this.context = context;

  String errorText = "";
  bool showError = false;
  bool fetchingLogin = false;

  BaseModel baseModel = BaseModel();
  UserModel userModel = UserModel();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  submitLogin(email, password) async {
    this.fetchingLogin = true;
    notifyListeners();
    try {
      var baseModel = await AuthService.instance.submitLogin(email, password);
      if (baseModel is BaseModel && baseModel.success) {
        this.userModel = UserModel.fromJson(baseModel.data);
      }
      this.fetchingLogin = false;
      notifyListeners();
    } on DioError catch (e) {
      if (e.response.statusCode == 403) {
        this.baseModel = BaseModel.fromJson(jsonDecode(e.response.toString()));
        errorText = baseModel.message;
        showError = true;
      }
      this.fetchingLogin = false;
      notifyListeners();
    }
  }

  Future<void> setPrefs() async {
    await LocaleManager.instance.setStringValue(
      PreferencesKeys.USER_ID,
      userModel.userId,
    );
    await LocaleManager.instance.setBoolValue(
      PreferencesKeys.IS_LOGIN,
      true,
    );
  }
}
