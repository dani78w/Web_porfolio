import 'dart:collection';
import 'dart:core';

import 'package:flutter/material.dart';

class Proyecto {
  String nombre = "PROYECTO";
  String descripcion = "DESCRIPCION";
  String fecha = "FECHA";
  var tecnologias = ["TECNOLOGIA1", "TECNOLOGIA2", "TECNOLOGIA3"];
  var ruta_foto = "assets/defult.png";
  var icon = Icons.android;

  Proyecto(this.nombre, this.descripcion, this.fecha, this.tecnologias,
      this.ruta_foto, this.icon);


  String getNombre() {
    return nombre;
  }
  String getDescripcion() {
    return descripcion;
  }
  String getFecha() {
    return fecha;
  }
  List<String> getTecnologias() {
    return tecnologias;
  }
  String getRutaFoto() {
    return ruta_foto;
  }
  IconData getIcon() {
    return icon;
  }


}
class Porfolio{
  List<Proyecto> proyectos = [];

  Porfolio(this.proyectos);

  List<Proyecto> getProyectos(){
    return proyectos;
  }

  getProyecto(int index){
    return proyectos[index];
  }

  int getProyectosLength(){
    return proyectos.length;
  }

  List<String> getTecnologias(){
    List<String> tecnologias = [];
    for (var i = 0; i < proyectos.length; i++) {
      for (var j = 0; j < proyectos[i].getTecnologias().length; j++) {
        tecnologias.add(proyectos[i].getTecnologias()[j]);
      }
    }
    return tecnologias;
  }




}
