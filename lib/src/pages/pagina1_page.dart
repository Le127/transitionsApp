import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transiciones_app/src/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transition Page"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            //
            _buttonTransition(context, "SlideTransition", 1),
            SizedBox(height: 50),
            _buttonTransition(context, "ScaleTransition", 2),
            SizedBox(height: 50),
            _buttonTransition(context, "RotationTransition", 3),
            SizedBox(height: 50),
            _buttonTransition(context, "FadeTransition", 4),
          ],
        ),
      ),
    );
  }

//======Crear Rutas con transiciones======

  Route _crearRuta(int page, String textPage) {
    return PageRouteBuilder(
      //Es una funcion que realiza la transicion
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Pagina2Page(textPage);
      },
      transitionDuration: Duration(milliseconds: 400),

      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //animacion principal
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        //Transiciones
        switch (page) {
          case 1:
            return SlideTransition(
              child: child, //este child es Pagina2Page
              position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
                  .animate(curvedAnimation),
            );

          case 2:
            return ScaleTransition(
              child: child,
              scale:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            );

          case 3:
            return RotationTransition(
                child: child,
                turns: Tween<double>(begin: 0.0, end: 2.0)
                    .animate(curvedAnimation));

          case 4:
            return FadeTransition(
                child: child,
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                    .animate(curvedAnimation));

          default:
            return SlideTransition(
              child: child, //este child es Pagina2Page
              position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
                  .animate(curvedAnimation),
            );
        }
      },
    );
  }
//======================================

//======Button Transition======
  Widget _buttonTransition(BuildContext context, String text, int page) {
    return Container(
      width: 160,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue.shade400),
          elevation: MaterialStateProperty.all(5),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        onPressed: () {
          Navigator.push(context, _crearRuta(page, text));
        },
      ),
    );
  }
//======================================
}
