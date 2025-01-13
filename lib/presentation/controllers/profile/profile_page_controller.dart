import 'package:get/get.dart';
import 'package:liga_inggris_mobile/services/club/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:liga_inggris_mobile/services/auth/model.dart';
import 'package:flutter/material.dart';

class ProfilePageController extends GetxController {
  var isProfileLoading = false.obs;
  var photoUrl = ''.obs;
  var bio = ''.obs;
  var isEditing = false.obs;
  var user = Rxn<UserModel>();
  var favoriteClubs = <ClubModel>[].obs; 

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController bioController;

  @override
  void onInit() {
    super.onInit();
    print("!!! initawdawd");
    loadProfileData();
    loadFavoriteClubs();
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

  void loadFavoriteClubs() {
    favoriteClubs.addAll([
      ClubModel(
        id: 1,
        name: "Arsenal",
        coach: "Ole Gunnar Solskjaer",
        foundedYear: 1878,
        achievements: [
          "Premier League",
          "FA Cup",
          "UEFA Champions League",
        ],
        logo: "https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg",
      ),
      ClubModel(
        id: 2,
        name: "Chelsea",
        coach: "Thomas Tuchel",
        foundedYear: 1905,
        achievements: [
          "Premier League",
          "FA Cup",
          "UEFA Champions League",
        ],
        logo: "https://upload.wikimedia.org/wikipedia/id/c/cc/Chelsea_FC.svg",
      ),
    ]);
  }

  void deleteFavoriteClub(int id) {
    favoriteClubs.removeWhere((club) => club.id == id);
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.toNamed('/signin');
    Get.delete();
  }
}
