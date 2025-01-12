import 'package:flutter/material.dart';
import 'package:liga_inggris_mobile/presentation/common/club_logo_widget.dart';

class FavoriteCardWidget extends StatelessWidget {
  const FavoriteCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SizedBox(
                height: 120,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: const ClubLogoWidget(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: const Text(
                        'Arsenal FC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_outlined,
              size: 80,
              color: Colors.white,
            ),
            onPressed: () {
              // Implementasi aksi tombol delete
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Konfirmasi'),
                  content:
                      const Text('Apakah Anda yakin ingin menghapus item ini?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Logika untuk menghapus item
                        Navigator.pop(context);
                      },
                      child: const Text('Hapus'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
