import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  final String? photoUrl;
  final String namaPengguna;
  final bool isEditing;
  final TextEditingController handleController;
  final TextEditingController bioController;
  final TextEditingController namaPenggunaController;
  final VoidCallback onTapEdit;
  final VoidCallback onTapSimpan;
  final VoidCallback onTapLogout;

  const ProfileCardWidget({
    Key? key,
    this.photoUrl,
    required this.namaPengguna,
    required this.isEditing,
    required this.handleController,
    required this.bioController,
    required this.namaPenggunaController,
    required this.onTapEdit,
    required this.onTapSimpan,
    required this.onTapLogout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              controller: handleController,
              readOnly: !isEditing,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Name Handle',
                labelStyle: const TextStyle(color: Colors.white),
                prefixIcon:
                    const Icon(Icons.alternate_email, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: namaPenggunaController,
              readOnly: !isEditing,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nama Pengguna',
                labelStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.person, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bioController,
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
              onPressed: isEditing ? onTapSimpan : onTapEdit,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: Text(isEditing ? 'Simpan' : 'Edit Profile'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: onTapLogout,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
