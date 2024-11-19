import 'package:google_fonts/google_fonts.dart';
import 'package:tiny_chef_mart/screens/menu.dart';
import 'package:tiny_chef_mart/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:tiny_chef_mart/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Color _registerNowColor = const Color(0xFF3E190E);
  Color _loginButtonNowColor = const Color(0xFFa16207); 

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFE7DBC6),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/Logo.png', 
                    height: 40.0, 
                  ),
                  const SizedBox(width: 8.0), 
                  Text(
                    "Tiny Chef Mart",
                    style: GoogleFonts.vollkorn(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 251, 249),
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFF3E190E)),
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: const LeftDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),  
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome Back!',
                  style: GoogleFonts.vollkorn(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color(0xFF3E190E),
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              ),
              const SizedBox(height: 25.0),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), 
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: GoogleFonts.vollkorn(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFF3E190E),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              ),
              const SizedBox(height: 10.0),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), 
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF8F0E5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16.0,
                  ),
                ),
              ),
              ),
              const SizedBox(height: 25.0),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), 
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: GoogleFonts.vollkorn(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xFF3E190E),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              ),
              const SizedBox(height: 10.0),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), 
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF8F0E5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16.0,
                  ),
                ),
                obscureText: true,
              ),
              ),
              const SizedBox(height: 25.0),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), 
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) {
                  setState(() {
                    _loginButtonNowColor = const Color(0xFF854d0e); // Warna saat hover
                  });
                },
                onExit: (_) {
                  setState(() {
                    _loginButtonNowColor = const Color(0xFFa16207); // Warna default
                  });
                },
              child: ElevatedButton(
                onPressed: () async {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  final response = await request
                      .login("http://127.0.0.1:8000/auth/login/", {
                    'username': username,
                    'password': password,
                  });

                  if (request.loggedIn) {
                    String message = response['message'];
                    String uname = response['username'];
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyHomePage()),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                              content: Text("$message Selamat datang, $uname.")),
                        );
                    }
                  } else {
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Login Gagal'),
                          content: Text(response['message']),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFFF8F0E5),
                  backgroundColor: _loginButtonNowColor, 
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: Text(
                  'Login', 
                  style: GoogleFonts.vollkorn(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              ),
              ),
              const SizedBox(height: 16.0),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0), 
              child: Center(
                child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      _registerNowColor = const Color(0xFFB07347);
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      _registerNowColor = const Color(0xFF3E190E);
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?  ',
                      style: GoogleFonts.vollkorn(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: const Color(0xFFB07347),
                      ),
                      children: [
                        TextSpan(
                          text: 'Register now',
                          style: GoogleFonts.vollkorn(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: _registerNowColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ),
              ),
            ],   
          ),
        ),
      ),
    );
  }
}