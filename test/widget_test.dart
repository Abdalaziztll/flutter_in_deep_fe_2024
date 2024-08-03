// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_and_mocking/excpetions/auth_exception.dart';
import 'package:tdd_and_mocking/model/reposen_model.dart';
import 'package:tdd_and_mocking/model/user_model.dart';
import 'package:tdd_and_mocking/repos/auth_repo.dart';
import 'package:tdd_and_mocking/service/auth_service.dart';

void main() {
  group("testing for Model ", () {
    test("happy scenario for model toMap function", () {
      UserModel user = UserModel(
          firstName: "string",
          lastName: "string",
          phone: "stringstri",
          username: "string",
          birthDate: "2024-08-03",
          password: "string",
          confirmPassword: "string");

      expect(user.toMap(), {
        "firstName": "string",
        "lastName": "string",
        "phone": "stringstri",
        "username": "string",
        "birthDate": "2024-08-03",
        "password": "string",
        "confirmPassword": "string"
      });
    });

    test("bad scenario toMap model function", () {
      UserModel user = UserModel(
          firstName: "",
          lastName: "",
          phone: "",
          username: "",
          birthDate: "",
          password: "",
          confirmPassword: "");

      expect(user.toMap(), {
        "firstName": "",
        "lastName": "",
        "phone": "",
        "username": "",
        "birthDate": "",
        "password": "",
        "confirmPassword": ""
      });
    });

    group("Test Service ", () {
      late AuthService authService;
      late Dio dio;
      late UserModel user;

      setUp(() {
        dio = Dio();
        authService = AuthService(dio: dio);
        user = UserModel(
            firstName: "firstName",
            lastName: "lastName",
            phone: "phone",
            username: "usernme",
            birthDate: "2022-07-08",
            password: "password",
            confirmPassword: "password");
      });

      test("InValid Password", () async {
        try {
          var data = await authService.signUp(user);
        } catch (e) {
          print(e.runtimeType);
          expect(e, throwsA(PasswordMustContainOneUppercase()));
        }
      });
    });

    group("Test Repo", () {
      late Dio dio;
      late UserModel user;
      late AuthService authService;
      late AuthRepo repo;

      setUp(() {
        user = UserModel(
            firstName: "firstName",
            lastName: "lastName",
            phone: "phone",
            username: "usernme",
            birthDate: "2022-07-08",
            password: "password",
            confirmPassword: "password");
        dio = Dio();
        authService = AuthService(dio: dio);
        repo = AuthRepo(service: authService);
      });

      test("Password Must Contianer and return DataFailed", () async {
        var data = await repo.signup(user);
        expect(data, isA<DataFailed>());
      });
    });
  });
}
