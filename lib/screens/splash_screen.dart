import 'package:flutter/material.dart';
import 'package:helloworld/screens/fitess_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Memanggil fungsi navigasi setelah widget di-init
    _navigateToHome();
  }

  // Fungsi untuk navigasi ke home page
  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      // Cek apakah widget masih ada
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const FitnessHomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Memastikan stack mengisi seluruh layar
        children: [
          Image.asset(
            'assets/images/splash.jpg',
            fit: BoxFit.cover, // Memastikan gambar menutupi seluruh layar
          ),
          // Anda bisa menambahkan widget lain di sini, misalnya loading indicator
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
