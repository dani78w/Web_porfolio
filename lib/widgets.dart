import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';
import 'classes.dart';
import 'globalData.dart';
import 'package:flutter/services.dart';

import 'main.dart';


class SobreMi extends StatefulWidget {
  const SobreMi({super.key});

  @override
  State<SobreMi> createState() => _SobreMi();
}

class _SobreMi extends State<SobreMi> {



  @override
  Widget build(BuildContext context) {
    return
    const Column(
      children: [
      Text("Sobre Mi"),


    ],
    );

  }
}

class StatsWidget extends StatefulWidget {
  const StatsWidget({super.key});

  @override
  State<StatsWidget> createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {

  var screenWidth = MediaQueryData.fromWindow(window).size.width;
  int tamPorfolio = porfolio.getProyectosLength();
  var tecno = porfolio.getTecnologias().toSet();

  Widget tecnologias() {
    List list = [];

    if(tecno.isEmpty){
      tecno.add("Cargando...");
    }

    for (var item in tecno) {
      list.add(item.toString());
    }

    return Flex(
      direction: Axis.vertical,
      children: [
        const Flexible(
          child: Text(
            "Tecnologias",
            style: TextStyle(color: Colors.cyanAccent, fontSize: 50),
          ),
        ),
        Flexible(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(list.length, (index) {
              return Chip(
                label: Text(list[index]),
                backgroundColor: Colors.cyanAccent,
              );
            }),
          ),
        )
      ],
    );
  }
  Widget proyectos() {
    porfolio.getProyectosLength();
    return Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          children: [
            Container(
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          transform: Matrix4.rotationZ(0.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.purpleAccent, Colors.cyanAccent],
                              ))),
                    ),
                  ]),
            ),
            Container(
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  clipBehavior: Clip.antiAlias,
                  children: [
                    const Text(
                      "PROYECTOS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "MÁS RECIENTES",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      color: Colors.white,
                      indent: 100,
                      endIndent: 100,
                      thickness: 1,
                    ),
                    for (int i = 1; i < 4; i++)
                      Flexible(
                        child: GestureDetector(
                            onTap: () {
                              // Manejar la acción de clic aquí
                              scrollController.animateTo(
                                  scrollController.position.pixels +
                                      85 * (porfolio.tags.length - i),
                                  duration: const Duration(milliseconds: 900),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                                width: 600,
                                height: 150,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 10,
                                      blurRadius: 20,
                                      offset: const Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: 1,
                                  ),
                                ),
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                  porfolio
                                                      .getProyecto(
                                                       1)
                                                      .getIcon(),
                                                  color: Colors.white),
                                              Row(
                                                children: [
                                                  Text(
                                                      "  ${
                                                          porfolio
                                                          .getProyecto(porfolio.tags.length - i)
                                                          .getNombre()
                                                          .toString()
                                                          .toUpperCase()}",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20)),
                                                ],
                                              ),
                                            ]),
                                        Flexible(
                                          flex: 10,
                                          child: Text(
                                            porfolio
                                                .getProyecto(tamPorfolio - i)
                                                .getDescripcion()
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    )))),
                      ),
                  ]),
            )

          ],
        ));
  }
  Widget proyectList() {
    return Container(
      color: Colors.cyan,
      child:
      Column(
        children: [
          for(var i = 0 ; i < porfolio.getProyectosLength(); i++)
            Text(porfolio.getProyecto(i).getNombre())
        ],

      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var widgets = [
      proyectos(),
      const TechnoWidget(),
      const SearchWidget(),
      if (MediaQuery.of(context).size.width > 1336) Container(),
      Container(),
      Container(),
      proyectList(),
      //const LastPost(),
      //const TreeWidget(),
    ];



    return Column(children: [
      Container(
        height: 350,
      ),
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 660, // Ancho máximo de cada elemento
          mainAxisSpacing: 8.0, // Espacio vertical entre elementos
          crossAxisSpacing: 8.0, // Espacio horizontal entre elementos
        ),
        itemCount: widgets.length,
        // Cantidad de elementos en la cuadrícula
        itemBuilder: (widget, index) {
          return Container(
            padding:const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
            alignment: Alignment.center,
            child: widgets[index],
          );
        },
      ),
      Container(
        height: 350,
      ),
    ]);
  }
}

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("CURRICULUM VITAE",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: ListView(
            children: [
              InteractiveViewer(
                  panEnabled: true,
                  // Set it to false to prevent panning.
                  maxScale: 5,
                  child: Image.asset(
                    'assets/curriculum.jpg',
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                  )),
            ],
          )),
    );
  }
}

class GlobalData extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  set value(int newValue) {
    _value = newValue;
    notifyListeners();
  }
}
var tecnoSelected = <dynamic>{};

class TechnoWidget extends StatefulWidget {
  const TechnoWidget({super.key});

  @override
  State<TechnoWidget> createState() => _TechnoWidgetState();
}

class _TechnoWidgetState extends State<TechnoWidget> {
  var tecno = porfolio.getTecnologias().toSet();
  List<String> selectedOptions = [];

  void toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List list = [];
    for (var item in tecno) {
      list.add(item.toString());
      tecnoSelected.add(false);
    }
    porfolio.getProyectosLength();
    return
      Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          clipBehavior: Clip.antiAlias,
          children: [
            const Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      "TECNOLOGÍAS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 5,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "USADAS EN LOS PROYECTOS",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 100,
                      endIndent: 100,
                      thickness: 1,
                    ),
                  ],
                )),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blueAccent.withOpacity(1),
                    Colors.purpleAccent.withOpacity(0.7),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:

                    Container(
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.compass_calibration_sharp,
                        color: Colors.black,
                        size: 80,
                      ),
                    ),


              ),
            ),
            Flexible(
              flex: 4,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(list.length, (index) {
                  return FilterChip(
                    selected: tecnoSelected.contains(list[index]),
                    checkmarkColor: Colors.black,
                    selectedShadowColor: Colors.cyanAccent,
                    pressElevation: 3,
                    selectedColor: Colors.blueAccent.withOpacity(0.9),
                    label: Text(
                      list[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                    avatarBorder: const CircleBorder(),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 10),
                        )),
                    backgroundColor: Colors.black,
                    onSelected: (bool value) {
                      setState(() {
                        if (tecnoSelected.contains(list[index]) == false) {
                          tecnoSelected.add(list[index]);
                          Provider.of<GlobalData>(context, listen: false)
                              .value++;
                        } else {
                          tecnoSelected.remove(list[index]);
                          Provider.of<GlobalData>(context, listen: false)
                              .value--;
                        }
                      });
                    },
                  );
                }),
              ),
            ),
          ]),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  void _showPopupResoults(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 30,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          content: Container(
              height: 500,
              width: 300,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white.withOpacity(1),
                  width: 1,
                ),
              ),
              child:
              Flex(
                direction: Axis.vertical,
                children: [
                  Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                          ),
                          const SizedBox(
                            height: 50,
                            width: 50,
                            child:  Icon(Icons.search,
                                color: Colors.white, size: 50),
                          ),
                          Container(
                            height: 10,
                          ),
                          const Text(
                            "Resultados",
                            style:  TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 4,
                      child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          color: Colors.white.withOpacity(1),
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.white.withOpacity(1),
                            child: ListView(
                              children: const [Resultados()],
                            ),
                          )))
                ],
              )
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el popup
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.white.withOpacity(1),
                    width: 1,
                  ),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 30),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var cambios = Provider.of<GlobalData>(context, listen: true).value;
    var searchState = 25;
    var isExpanded = false;
    if (cambios != 0) {
      setState(() {
        searchState = 8;
        isExpanded = true;
      });
    } else {
      setState(() {
        searchState = 25;
        isExpanded = false;
      });
    }


    return Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(),
                  ),
                  for (var i = 1; i < cambios + 1; i++)
                  /* if(tecnoSelected.elementAt(i)==true)*/
                    Flexible(
                        flex: 1,
                        child: Container(
                            margin: const EdgeInsets.only(left: 55, right: 55),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.blueAccent
                                      .withOpacity(10 * i / (cambios * 10)),
                                  Colors.purpleAccent.withOpacity(0.9),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                tecnoSelected.elementAt(i).toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            )))
                ],
              ),
            ),
            Container(
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: searchState,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: isExpanded ? 420 : 420,
                        // Cambia la anchura con animación
                        height: isExpanded ? 500 : 500,
                        color: Colors.transparent,

                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.only(top: isExpanded ? 400 : 0),
                                  width: 100,
                                  // Cambia la anchura con animación
                                  height: isExpanded ? 0 : 100,
                                  child: Container(
                                    padding:
                                    EdgeInsets.only(left: isExpanded ? 800 : 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "BUSCAR PROYECTOS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      letterSpacing: 5,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "SELECCIONA UNA TECNOLOGÍA",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 10),
                                ),
                                Divider(
                                  color: Colors.white.withOpacity(0.4),
                                  indent: 100,
                                  endIndent: 100,
                                  thickness: 1,
                                ),
                              ],
                            )),
                      )),
                  Flexible(
                    flex: 10,
                    child: Container(),
                  )
                ],
              ),
            ),

            if (isExpanded == true)
              Container(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                    onTap: () {
                      _showPopupResoults(context);
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        margin: const EdgeInsets.only(right: 30, bottom: 30),
                        child: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ))),
              )
          ],
        ));
  }
}

class Resultados extends StatefulWidget {
  const Resultados({super.key});

  @override
  State<Resultados> createState() => _ResultadosState();
}

class _ResultadosState extends State<Resultados> {
  Widget buscar() {
    var cambios = Provider.of<GlobalData>(context, listen: true).value;
    List proyectos = porfolio.proyectos.toList();
    var tecnoSelectedNames = <dynamic>{};

    for (var i = 1; i < cambios + 1; i++) {
      tecnoSelectedNames.add(tecnoSelected.elementAt(i).toString());
      tecnoSelected.add(tecnoSelected.elementAt(i));
    }

    List<Proyecto> resultadosBusqueda = [];
    resultadosBusqueda = resultadosBusqueda.toSet().toList();

    for (var proyecto in proyectos) {
      var j = 0;
      for (var tecnologia in tecnoSelectedNames) {
        if (proyecto.getTecnologias().contains(tecnologia.toString()) == true) {
          j++;
        }
      }

      if (j == tecnoSelectedNames.length) {
        resultadosBusqueda.add(proyecto);
      }
    }
    resultadosBusqueda = resultadosBusqueda.toSet().toList();

    return Column(
      children: [
        if (resultadosBusqueda.isEmpty)
          const Text("No se han encontrado resultados"),
        if (resultadosBusqueda.isNotEmpty)
          for (var proyecto in resultadosBusqueda)
            GestureDetector(
                onTap: () {
                  var posicion = porfolio.proyectos.toList().indexOf(proyecto);
                  scrollController.animateTo(posicion * 85,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                },
                child: Container(
                    height: 70,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(flex: 2, child: Icon(proyecto.getIcon())),
                        Flexible(flex: 3, child: Text(proyecto.getNombre())),
                        const Flexible(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ],
                    )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buscar();
  }
}

class Fondo extends StatefulWidget {
  const Fondo({super.key});

  @override
  State<Fondo> createState() => _Fondo();
}

class _Fondo extends State<Fondo> {
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

class LastPost extends StatefulWidget {
  const LastPost({super.key});

  @override
  State<LastPost> createState() => _LastPostState();
}

class _LastPostState extends State<LastPost> {
  var animation = 8;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 420,
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 3,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (var j = 0; j < 23; j++)
                          SizedBox(
                              width: 17,
                              child: Center(
                                child: Container(
                                  width: 1,
                                  height:
                                  (j * animation).toDouble(),
                                  color: Colors.white,
                                ),
                              )),
                      ],
                    ),
                    Container(child: Flexible(
                        flex: 2,
                        child:Center(
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: 140,
                            height: 240,
                            //clipBehavior: Clip.antiAlias,
                            transform: Matrix4.identity()
                              ..setEntry(
                                  3, 2, 0.002) // Agrega perspectiva cónica
                              ..rotateY(0.5),
                            /*decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 32,
                                  offset: Offset(
                                      7, 0), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                            ),*/
                            child:  Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black87,
                                  width: 0,
                                ),
                                color: Colors.white,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Image.asset(
                                'assets/home.png',
                                fit: BoxFit.fitHeight,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        )) ,),

                  ],
                )),
            Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        child: const Column(
                          children: [
                            Text(
                              "RECIENTE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "EL ÚLTIMO EN PUBLICARSE",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: Colors.white,
                              indent: 100,
                              endIndent: 100,
                              thickness: 1,
                            ),
                          ],
                        )))),

            /* Flexible(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Image.asset(
                            'assets/home.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ), */
          ],
        ));



  }
}

class TreeWidget extends StatefulWidget {
  const TreeWidget({super.key});

  @override
  State<TreeWidget> createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const ModelViewer(
                    src: 'assets/3d/key_card.glb',
                    loading: Loading.auto,
                    alt: "A 3D model",
                    reveal: Reveal.auto,
                    ar: true,
                    iosSrc: 'assets/3d/key_card.usdz',
                    exposure: 1.0,
                    autoPlay: true,
                    autoRotate: true,
                    cameraControls: true,
                    backgroundColor: Colors.transparent,
                    rotationPerSecond: "360deg",
                    disablePan: true,
                    disableTap: true,
                    disableZoom: true,
                  ),
                )),
            Flexible(
                flex: 1,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        child: const Column(
                          children: [
                            Text(
                              "MODELOS",
                              style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  letterSpacing: 5,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "EL ÚLTIMO EN PUBLICARSE",
                              style:
                              TextStyle(color: Colors.white, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: Colors.white,
                              indent: 100,
                              endIndent: 100,
                              thickness: 1,
                            ),
                          ],
                        )))),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Container(

          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0),
            borderRadius: BorderRadius.circular(10),

          ),
        ),
      ],
    );
  }
}
