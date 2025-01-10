import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:liga_inggris_mobile/services/auth/model.dart';
import 'package:flutter/material.dart';

class ProfilePageController extends GetxController {
  var isProfileLoading = false.obs;
  var photoUrl = ''.obs;
  var handle = ''.obs;
  var bio = ''.obs;
  var namaPengguna = ''.obs;
  var isEditing = false.obs;
  var userModel = Rxn<UserModel>();

  late TextEditingController handleController;
  late TextEditingController bioController;
  late TextEditingController namaPenggunaController;

  @override
  void onInit() {
    super.onInit();
    loadProfileData();
    handleController = TextEditingController();
    bioController = TextEditingController();
    namaPenggunaController = TextEditingController();
  }

  Future<void> loadProfileData() async {
    isProfileLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userJson = prefs.getString('user');
    if (userJson != null) {
      userModel.value = UserModel.fromJson(userJson);
    } else {
      userModel.value = UserModel(
        name: "Budi",
        email: "budi@example.com",
        password: "********",
      );
    }

    photoUrl.value =
        prefs.getString('photoUrl') ?? "https://placehold.jp/150x150.png";
    handle.value = prefs.getString('handle') ?? "mimin123";
    bio.value = prefs.getString('bio') ?? "Setan Merah dihati ❤️";
    namaPengguna.value = prefs.getString('namaPengguna') ?? "adminsaja";

    handleController.text = handle.value;
    bioController.text = bio.value;
    namaPenggunaController.text = namaPengguna.value;

    isProfileLoading.value = false;
  }

  Future<void> saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('handle', handleController.text);
    await prefs.setString('bio', bioController.text);
    await prefs.setString('namaPengguna', namaPenggunaController.text);

    handle.value = handleController.text;
    bio.value = bioController.text;
    namaPengguna.value = namaPenggunaController.text;

    isEditing.value = false;
  }

  void toggleEditMode() {
    isEditing.value = !isEditing.value;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.toNamed('/signin');
    Get.delete();
  }
}
