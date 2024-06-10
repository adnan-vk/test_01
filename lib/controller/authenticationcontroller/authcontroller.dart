import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/model/usermodel.dart';
import 'package:task/service/auth_service/authenticationservice.dart';

class AuthController extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel? currentUser;
  UserModel? sortedUser;
  final AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  bool showOtpField = false;

  Future<UserCredential> signUpEmail(String email, String password) async {
    return await authService.signUpEmail(email, password);
  }

  Future<UserCredential> signInEmail(String email, String password) async {
    return await authService.signInEmail(email, password);
  }

  Future<void> signOutEmail() async {
    return await authService.signOutEmail();
  }

  addUser() async {
    final user = UserModel(
        email: emailController.text,
        phoneNumber: phoneController.text,
        firstname: firstnamecontroller.text,
        uId: firebaseAuth.currentUser!.uid,
        lastname: lastnamecontroller.text);
    await authService.addUser(user);
    getUser();
  }

  getUser() async {
    currentUser = await authService.getCurrentUser();
    log(currentUser?.phoneNumber ?? "");
    notifyListeners();
  }

  clearControllers() {
    firstnamecontroller.clear();
    lastnamecontroller.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
    otpController.clear();
    notifyListeners();
  }

  showOtp() {
    showOtpField = true;
    notifyListeners();
  }

  updateUser(userid, UserModel data) async {
    await authService.updateUser(userid, data);
    clearControllers();
    notifyListeners();
  }

  getProductUser(String uId) async {
    List<UserModel> allUsers = await authService.getAllUser();
    sortedUser = allUsers.firstWhere((element) => element.uId == uId);
    notifyListeners();
  }
}
