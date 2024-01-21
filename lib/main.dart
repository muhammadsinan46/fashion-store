import 'package:flutter/material.dart';
import 'package:store_app/presentation/homes_screen.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    return  const  MaterialApp(

    
      debugShowCheckedModeBanner: false,
      
      home: HomeScreen(),
    );
  }
}