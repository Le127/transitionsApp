import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  final String text;

  Pagina2Page(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.text),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          this.text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
