import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:liga_inggris_mobile/services/auth/model.dart';
import 'package:flutter/material.dart';

class ProfilePageController extends GetxController {
  var isProfileLoading = false.obs;
  var photoUrl = ''.obs;
  var bio = ''.obs;
  var isEditing = false.obs;
  var user = Rxn<UserModel>();

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController bioController;
  var favoriteClubs = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("!!! initawdawd");
    loadProfileData();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    bioController = TextEditingController();
  }

  Future<void> loadProfileData() async {
    isProfileLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userJson = prefs.getString('user');
    if (userJson != null) {
      print("=======> $userJson");
      user.value = UserModel.fromJson(userJson);
    } else {
      user.value = UserModel(
        name: "Budi",
        email: "budi@example.com",
        password: "********",
      );
    }

    photoUrl.value =
        prefs.getString('photoUrl') ?? "https://placehold.jp/150x150.png";
    bio.value = prefs.getString('bio') ?? "Setan Merah dihati ❤️";

    bioController.text = bio.value;
    emailController.text = user.value?.email ?? '';
    usernameController.text = user.value?.name ?? '';

    isProfileLoading.value = false;
  }

  Future<void> saveProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final newUser = UserModel(
      name: usernameController.text,
      email: emailController.text,
      password: user.value?.password ?? '',
    );

    bio.value = bioController.text;

    await prefs.setString('user', newUser.toJson());
    await prefs.setString('bio', bio.value);

    isEditing.value = false;

    Get.snackbar(
      "Berhasil",
      "Profil berhasil disimpan",
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
    );
  }

  void removeFavoriteClub(int id) {
    favoriteClubs.removeWhere((club) => club == id);
    Get.snackbar(
      "Berhasil",
      "Klub berhasil dihapus dari favorit",
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.toNamed('/signin');
    Get.delete();
  }
}
