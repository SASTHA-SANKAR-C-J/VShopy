import 'package:ecommercesas/view/bottom_navbar/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.163,
            ),
            Lottie.network(
                "https://lottie.host/f35eb2a7-dd2c-4f07-a6e7-59a52ac42230/aNmLbdaIix.json",
                height: height * 0.55,
                width: width * 0.9999),
            const Text(
              "VShopy.",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
