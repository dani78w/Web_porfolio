import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:provider/provider.dart';
import 'package:web_porfolio/widgets.dart';
import 'classes.dart';
import 'globalData.dart';
import 'package:flutter/material.dart';

class Proyecto {
  int id = 0;
  String nombre = "PROYECTO";
  String descripcion = "DESCRIPCION";
  String fecha = "FECHA";
  var tecnologias = ["TECNOLOGIA1", "TECNOLOGIA2", "TECNOLOGIA3"];
  var rutaFoto = "assets/defult.png";
  var icon = Icons.android;

  Proyecto(this.id,this.nombre, this.descripcion, this.fecha, this.tecnologias,
      this.rutaFoto, this.icon);

  factory Proyecto.fromJson(Map<String, dynamic> json) {
    return Proyecto(
        json['id'],
        json['nombre'],
        json['descripcion'],
        json['fecha'],
        List<String>.from(json['tecnologias'].split(',')),
        json['rutaFoto'],
        Icons.radio_button_off);
  }

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
    return rutaFoto;
  }

  IconData getIcon() {
    return icon;
  }
}

class Porfolio {
   var proyectos = [];

   void destroyDuplicates(){
     for(var i = 0 ; i< proyectos.length;i++){
        for(var j = 0 ; j< proyectos.length;j++){
          if(proyectos[i].id == proyectos[j].id && i!=j){
            proyectos.removeAt(j);
          }
        }
     }
   }
  List getProyectos() {
    return proyectos;
  }

  getProyecto(int index) {
    return proyectos[index];
  }

  int getProyectosLength() {
    return proyectos.length;
  }

  List<String> getTecnologias() {
    List<String> tecnologias = [];
    for (var i = 0; i < proyectos.length; i++) {
      for (var j = 0; j < proyectos[i].getTecnologias().length; j++) {
        tecnologias.add(proyectos[i].getTecnologias()[j]);
      }
    }
    return tecnologias;
  }

  var tags = ["Home"];

  void generarTags() {

    for (var i = 1; i < proyectos.length; i++) {
      tags.add("PR $i");
    }
  }

  void clear() {
    tags.clear();
    proyectos.clear();
  }

  Porfolio(
    this.proyectos,
  ) {
    generarTags();
  }
}

class SyncApiPorfolio {
  Future<bool> isDone = Future<bool>.value(false);

  List<Proyecto> parseProyectos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Proyecto>((json) => Proyecto.fromJson(json)).toList();
  }

  porfolioClear() {
    porfolio.clear();
  }

  Future<List<Proyecto>> fetchProyectos() async {

    final response = await http
        .get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      print("Descarga de proyectos correcta");

      for (var i = 0; i < parseProyectos(response.body).length; i++) {
        porfolio.proyectos.add(parseProyectos(response.body)[i]);
      }
      porfolio.generarTags();

      return parseProyectos(response.body);
    } else {
      throw Exception('Error al cargar los proyectos');
    }
  }

  Future<String> syncPorfolio() async {
    var result= Set<Proyecto>();
    try {
      await fetchProyectos()
          .then((value) => {
                for (var i = 0; i < value.length; i++)
                  {

                        result.add(value[i]),

                  }
              })
          .catchError((error) => print(error))
          .whenComplete(() => {
                porfolio.proyectos.addAll(result ),
                isDone = true as Future<bool>,
                print("completo\n"),
                print("Proyectos descargados: ${porfolio.getProyectosLength()}")
              });
      return "a";
    } catch (e) {
      print(e);
      return "b";
    }
  }

  Future<bool> isDoneSync() async {
    var result = false;
    isDone.whenComplete(() => result=true);
    return result;
  }
}
