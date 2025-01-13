import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liga_inggris_mobile/presentation/controllers/profile/profile_page_controller.dart';

class ProfileCardWidget extends GetView<ProfilePageController> {
  final String? photoUrl;
  final bool isEditing;

  const ProfileCardWidget({
    super.key,
    this.photoUrl,
    required this.isEditing,
  });

  void _toggleEditMode() {
    controller.isEditing.value = !controller.isEditing.value;
  }

  void _onTapSave() {
    controller.saveProfile();
  }

  void _onTapLogout() {
    controller.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: photoUrl != null
                ? NetworkImage(photoUrl!)
                : const NetworkImage('https://placehold.jp/150x150.png'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller.emailController,
            readOnly: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.white,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller.usernameController,
            readOnly: !isEditing,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.person, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller.bioController,
            readOnly: !isEditing,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Bio',
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.favorite, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Get.toNamed('/favorite'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('Favorite Club'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: isEditing ? _onTapSave : _toggleEditMode,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
            child: Text(isEditing ? 'Simpan' : 'Edit Profile'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _onTapLogout,
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
