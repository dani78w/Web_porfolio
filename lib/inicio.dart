import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_porfolio/widgets.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _counter = 0;
  int _counter2 = 0;
  double _rotation = 0;
  int _color = 0;
  int _fade = 1;
  final double _blurEffect = 0;
  String _textoAnimado = '';
  String textoFinal = "DANIEL";
  final apellido = "ARRIBAS";
  final subapellido = "SORANDO";

  /*final svgString = '''
      <svg width="673" height="502" viewBox="0 0 673 502" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M558 500L666.266 432.932C669.209 431.109 671 427.894 671 424.431V309" stroke="white" stroke-width="4"/>
<path d="M115 2L6.73387 69.0675C3.79074 70.8907 2 74.1065 2 77.5686L2 193" stroke="white" stroke-width="4"/>
<path d="M115 2L6.73387 69.0675C3.79074 70.8907 2 74.1065 2 77.5686L2 193" stroke="white" stroke-width="4"/>
</svg>
          ''';*/
  final svgString = '''
      <svg width="524" height="596" viewBox="0 0 524 596" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M277.75 5.67062L507.29 138.195C517.036 143.822 523.04 154.221 523.04 165.475V430.525C523.04 441.779 517.036 452.178 507.29 457.805L277.75 590.329C268.004 595.956 255.996 595.956 246.25 590.329L16.7103 457.805C6.96421 452.178 0.960327 441.779 0.960327 430.525V165.475C0.960327 154.221 6.9642 143.822 16.7103 138.195L246.25 5.67062C255.996 0.0436921 268.004 0.0436845 277.75 5.67062Z" stroke="white"/>
</svg>

          ''';
  var degradado = [
    Colors.teal.shade100.withOpacity(0.5),
    Colors.purpleAccent.withOpacity(0.1),
  ];
  var _opacidad = 0.0;
  var aux = true;
  var tags = [
    "HOME",
    "PR 1",
    "PR 2",
    "PR 3",
  ];

  var tagSeleccionado = 0;
  double rounded = 400;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    double fontSizeInSp = 40.0;
    double fontSize = fontSizeInSp * MediaQuery.textScaleFactorOf(context);

    Future mostrarFondo() async {
      await Future.delayed(const Duration(seconds: 1));
      if (_opacidad < 1) {
        for (int i = 0; i < 9; i++) {
          setState(() {
            _opacidad = (i) / 10;
          });
          await Future.delayed(const Duration(milliseconds: 20));
        }
      }
    }

    /*Future desenfoque() async {
      await Future.delayed(const Duration(seconds: 7));
      if (_blurEffect < 10) {
        for (int i = 0; i < 50; i++) {
          setState(() {
            _blurEffect = i.toDouble();
          });
          await Future.delayed(const Duration(milliseconds: 20));
        }
      }
    }*/

    Future parpadeo() async {
      if (_color == 1) {
        setState(() {
          _color = 0;
        });
      } else {
        setState(() {
          _color = 1;
        });
      }
    }

    Future fade() async {
      await Future.delayed(const Duration(milliseconds: 4020));
      _fade = 0;
    }

    Future animate() async {
      if (_counter == MediaQuery.of(context).size.width.toInt()) {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          _counter = MediaQuery.of(context).size.width.toInt() * 2;
          _counter2 = MediaQuery.of(context).size.height.toInt() * 2;
          _rotation = pi / 2;
        });
      } else {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          _counter = MediaQuery.of(context).size.width.toInt();
          _counter2 = MediaQuery.of(context).size.height.toInt();
          _rotation = pi / 4;
        });
      }
      await Future.delayed(const Duration(seconds: 1));

      if (_textoAnimado != textoFinal) {
        _textoAnimado = _textoAnimado + textoFinal[_textoAnimado.length];

        parpadeo();
      }

      if (_textoAnimado == textoFinal) {
        if (_textoAnimado == "DANIEL") {
          _textoAnimado = "";
          textoFinal = apellido;
        }
        if (_textoAnimado == apellido) {
          _textoAnimado = "";
          textoFinal = subapellido;
        }
        if (_textoAnimado == subapellido) {
          _textoAnimado = "";
          textoFinal = "DANIEL ARRIBAS SORANDO";
        }
      }
    }

    mostrarFondo();
    animate();
    fade();

    //desenfoque();
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        body: Center(
          child: GestureDetector(
              onTap: () {},
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height - 300,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.loose,
                        children: [
                          if (aux == true)
                            for (var i = 1; i < 4; i++)
                              AnimatedContainer(
                                transform: Matrix4.rotationZ(_rotation * i),
                                transformAlignment: Alignment.center,
                                width: _counter.toDouble() / (i * 0.9),
                                height: _counter2.toDouble() / (i * 0.9),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0),
                                ),
                                duration: Duration(milliseconds: 300 * i),
                                curve: Curves.easeInExpo,
                                child: SvgPicture.string(svgString),
                              ),
                          if (aux == true)
                            BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: _blurEffect, sigmaY: _blurEffect),
                                // Ajusta los valores según prefieras
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Flex(
                                          clipBehavior: Clip.antiAlias,
                                          direction: Axis.horizontal,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                                flex: 1,
                                                child: Text("/ ",
                                                    style: TextStyle(
                                                        fontSize: fontSize,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.white
                                                            .withOpacity(_fade
                                                            .toDouble())))),
                                            Flexible(
                                              flex: 10,
                                              child: Text(
                                                _textoAnimado,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  letterSpacing: 10,
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                                flex: 1,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  constraints:
                                                  const BoxConstraints(
                                                    maxWidth: 30,
                                                    maxHeight: 30,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(
                                                        _color.toDouble()),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        100),
                                                  ),
                                                ))
                                          ],
                                        )))),
                        ]),
                  ),
                  const StatsWidget()
                ],
              )),
        ));
  }
}
