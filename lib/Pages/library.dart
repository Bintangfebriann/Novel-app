import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Warna latar belakang
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Kartu untuk Lookism
            _buildMangaCard(
              context,
              'Lookism',
              'images/sololev.jpg', // Ganti dengan path gambar yang sesuai
              ['chapter 4', 'chapter 3', 'chapter 2'],
            ),
            // Kartu untuk One Piece
            _buildMangaCard(
              context,
              'One Piece',
              'images/sololev.jpg', // Ganti dengan path gambar yang sesuai
              ['chapter 12', 'chapter 10'],
            ),
            // Kartu untuk Omniscient Reader
            _buildMangaCard(
              context,
              'Omniscient Reader',
              'images/sololev.jpg', // Ganti dengan path gambar yang sesuai
              ['chapter 4', 'chapter 3', 'chapter 2'],
            ),
            // Kartu untuk Virus Girlfriend
            _buildMangaCard(
              context,
              'Virus Girlfriend',
              'images/sololev.jpg', // Ganti dengan path gambar yang sesuai
              ['chapter 4', 'chapter 3', 'chapter 2'],
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu manga
  Widget _buildMangaCard(BuildContext context, String title, String imagePath, List<String> chapters) {
    return Card(
      color: Colors.grey[800], // Warna latar belakang kartu
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Gambar Manga
            Image.asset(
              imagePath,
              width: 70,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12),
            // Judul dan daftar chapter
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Manga
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Daftar Chapter
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: chapters
                        .map(
                          (chapter) => InkWell(
                            onTap: () {
                              // Navigasi ke halaman detail saat chapter diklik
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChapterDetailPage(chapter: chapter),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                chapter,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline, // Garis bawah untuk penanda klik
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman detail chapter
class ChapterDetailPage extends StatelessWidget {
  final String chapter;

  const ChapterDetailPage({Key? key, required this.chapter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $chapter'),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Text(
          'Ini adalah halaman detail untuk $chapter',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.grey[900], // Warna latar belakang halaman detail
    );
  }
}
