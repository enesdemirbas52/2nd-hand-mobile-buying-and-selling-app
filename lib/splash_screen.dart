import 'package:flutter/material.dart';
import 'package:flutter_application_3/login_screen.dart';
import 'package:flutter_application_3/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(color: Colors.black),
              ),
              SafeArea(
                child: Center(
                  child: Image.asset(
                    'assets/images/splash.png',
                    scale: 3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                print("Login button pressed");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Giriş Yap",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)), // Köşeleri keskin yapmak için sıfır
                ),
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity,60), // Genişlik: tam ekran
              ),
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                print("Kayıt Ol");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text("Kayıt Ol",style: GoogleFonts.poppins(fontSize: 18,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)), // Köşeleri keskin yapmak için sıfır
                ),
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity,60), // Genişlik: tam ekran
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text("otozen.com.tr",style: GoogleFonts.poppins(fontSize: 15,color: Colors.black),),
        ],
      ),
    );
  }
}
