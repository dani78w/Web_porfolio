
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'classes.dart';

// Texto LoremIpsum
  const descripcion =
      "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo" "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo";

// Proyectos => siguiente version de la app estos estaran en una base de datos
  Proyecto home = Proyecto(0,"This Web", descripcion, "12312-23", ["Flutter", "Dart"], "assets/defult.png", Icons.home);
  Proyecto pr1 = Proyecto(0,"Jetpack Music App", descripcion, "12312-23", ["Flutter", "Dart", "Python"], "assets/proyects/yb.jpg", Icons.surround_sound);
  Proyecto pr2 = Proyecto(0,"Android Layouts XML", descripcion, "22-23-123", ["Flutter", "Dart", "Kotlin"], "assets/proyects/p2.jpg", Icons.android);
  Proyecto pr3 = Proyecto(0,"Post-it TFG", descripcion, "2323-23-22", ["Flutter", "Dart", "C++", "Java"], "assets/proyects/postit.jpg", Icons.pentagon);

  Porfolio porfolio = Porfolio([home]);


  var tagSeleccionado = 0;

  ScrollController scrollController = ScrollController(
      keepScrollOffset: false,
      initialScrollOffset: - PlatformDispatcher.instance.implicitView!.physicalSize.width);