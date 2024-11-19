import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tiny_chef_mart/screens/menu.dart';
import 'package:tiny_chef_mart/screens/productentry_form.dart';
import 'package:tiny_chef_mart/screens/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child:  MaterialApp(
        title: 'Tiny Chef Mart',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.brown,
            ).copyWith(secondary: Colors.brown[400]),
        ),
        
        home: StartPage(),
      ),
    );
  }
}

