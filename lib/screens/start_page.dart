import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiny_chef_mart/screens/login.dart';
import 'package:tiny_chef_mart/screens/register.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {  
  Color _loginColor = const Color(0xFFa16207);
  Color _registerColor = const Color(0xFFa16207); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with opacity layer
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.7), // Adjust opacity here
            ),
          ),

          // Foreground content
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF43230e).withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon and close button row
                  
                  const SizedBox(height: 10),

                  // Title and subtitle
                  Text(
                    'Welcome to Tiny Chef Mart!',
                    style: GoogleFonts.vollkorn(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                   Text(
                    'Bringing fresh ingredients and gourmet tools to your fingertips, making every meal a masterpiece.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kadwa(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0), 
                    child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      _loginColor = const Color(0xFF854d0e);
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _loginColor = const Color(0xFFa16207);
                    });
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _loginColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Log In',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.vollkorn(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                      ),
                  ),
                   ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0), 
                    child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      _registerColor = const Color(0xFF854d0e);
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _registerColor = const Color(0xFFa16207);
                    });
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _registerColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.vollkorn(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    ),
                  ),
                   ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
