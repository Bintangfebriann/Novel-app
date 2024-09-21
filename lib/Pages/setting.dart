import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Ubah background menjadi hitam
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Bagian Foto Profil
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_image.jpg'), // Ganti dengan gambar profil Anda
            ),
            SizedBox(height: 20),
            // Edit Profile Button
            _buildListTile(
              context,
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            // Ubah Akun
            _buildListTile(
              context,
              icon: Icons.account_circle,
              title: 'Ubah Akun',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangeAccountPage()),
                );
              },
            ),
            // Keluar
            _buildListTile(
              context,
              icon: Icons.exit_to_app,
              title: 'Keluar',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogoutPage()),
                );
              },
            ),
            // Riwayat
            _buildListTile(
              context,
              icon: Icons.history,
              title: 'Riwayat',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            ),
            // Tentang Komikita
            _buildListTile(
              context,
              icon: Icons.info,
              title: 'Tentang Komikita',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            // Bersihkan Cache
            _buildListTile(
              context,
              icon: Icons.delete,
              title: 'Bersihkan Cache',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClearCachePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat ListTile dengan efek sentuhan
  Widget _buildListTile(BuildContext context,
      {required IconData icon, required String title, required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(10), // Efek sudut membulat saat di klik
        splashColor: Colors.blue.withOpacity(0.3), // Warna efek klik
        child: ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(
            title,
            style: TextStyle(color: Colors.white), // Warna teks menjadi putih
          ),
          tileColor: Colors.grey[800], // Warna default tombol lebih gelap
          selectedTileColor: Colors.blue[700], // Warna saat dipilih
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// Contoh halaman lain untuk navigasi
class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.black, // Background hitam
      body: Center(child: Text('Edit Profile Page', style: TextStyle(color: Colors.white))),
    );
  }
}

class ChangeAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Akun'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.black, // Background hitam
      body: Center(child: Text('Change Account Page', style: TextStyle(color: Colors.white))),
    );
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keluar'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.black, // Background hitam
      body: Center(child: Text('Logout Page', style: TextStyle(color: Colors.white))),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.black, // Background hitam
      body: Center(child: Text('History Page', style: TextStyle(color: Colors.white))),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Komikita'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.black, // Background hitam
      body: Center(child: Text('About Page', style: TextStyle(color: Colors.white))),
    );
  }
}

class ClearCachePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bersihkan Cache'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.black, // Background hitam
      body: Center(child: Text('Clear Cache Page', style: TextStyle(color: Colors.white))),
    );
  }
}
