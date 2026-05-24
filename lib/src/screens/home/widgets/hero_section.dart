import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D0221), Color(0xFF2D0E5E)],
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/Banner_Mobile.png'),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "Hora de abraçar seu",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.orbitron(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFF55DF),
                        ),
                      ),
                      Text(
                        "lado geek!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.orbitron(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF8FFF24),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "As melhores roupas e acessórios\npara desenvolvedores.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF780BF7),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Ver as novidades!",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
