import 'package:flutter/material.dart';
import 'package:transiciones_app/src/pages/pagina1_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transiciones App',
      home: Pagina1Page(),
    );
  }
}
