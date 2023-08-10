import 'dart:collection';
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'classes.dart';

const descripcion =
    "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo" +
        "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo";

// Proyectos => siguiente version de la app estos estaran en una base de datos
Proyecto pr1 = Proyecto("Proyecto 1", descripcion, "12312-23",
    ["Flutter", "Dart", "Python"], "assets/defult.png", Icons.android);
Proyecto pr2 = Proyecto("Proyecto 2", descripcion, "22-23-123",
    ["Flutter", "Dart", "Kotlin"], "assets/defult.png", Icons.apple);
Proyecto pr3 = Proyecto(
    "Proyecto 3",
    descripcion,
    "2323-23-22",
    ["Flutter", "Dart", "C++", "Java"],
    "assets/defult.png",
    Icons.desktop_windows);
Proyecto pr4 = Proyecto(
    "Proyecto 4",
    descripcion,
    "2323-23-22",
    ["Flutter", "Dart", "C++", "Java", "Odoo", "Bash"],
    "assets/defult.png",
    Icons.access_alarm);

Porfolio porfolio = Porfolio([pr1, pr2, pr3, pr4]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter2 = 0;
  double _rotation = 0;
  int _color = 0;
  int _fade = 1;
  double _blurEffect = 0;
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
      <svg width="1708" height="1926" viewBox="0 0 1708 1926" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M899 69.7987L1605.04 477.428C1632.88 493.505 1650.04 523.217 1650.04 555.37V1370.63C1650.04 1402.78 1632.88 1432.49 1605.04 1448.57L899 1856.2C871.154 1872.28 836.846 1872.28 809 1856.2L102.965 1448.57C75.1189 1432.49 57.965 1402.78 57.965 1370.63V555.37C57.965 523.217 75.1189 493.505 102.965 477.428L809 69.7987C836.846 53.7217 871.154 53.7217 899 69.7987Z" stroke="url(#paint0_linear_411_25)" stroke-width="114"/>
      <defs>
      <linearGradient  x1="854" y1="861" x2="504" y2="1552" gradientUnits="userSpaceOnUse">
      <stop/>
      <stop offset="0.234375" stop-opacity="0.973958"/>
      <stop offset="1" stop-opacity="0"/>
      </linearGradient>
      </defs>
      </svg>
          ''';
  var degradado = [
    Colors.teal.shade100.withOpacity(0.5),
    Colors.purpleAccent.withOpacity(0.1),
  ];
  var _opacidad = 0.0;
  var aux = true;
  var meses = [
    "HOME",
    "PR 1",
    "PR 2",
    "PR 3",
  ];

  var mesSeleccionado = 0;
  double rounded = 400;

  @override
  Widget timeline() {
    ScrollController scrollController = ScrollController(
        keepScrollOffset: false,
        initialScrollOffset: -MediaQueryData.fromView(window).size.width);
    var rangos = [];

    for (var i = 0; i < meses.length; i++) {
      var max = (i * 80) + 15;
      var min = (i * 80) - 15;
      rangos.add([min, max]);
    }

    scrollController.addListener(() {
      for (var i = 0; i < rangos.length; i++) {
        if (scrollController.position.pixels >= rangos[i][0] &&
            scrollController.position.pixels <= rangos[i][1]) {
          if (mesSeleccionado != i) {
            print("Estoy en el mes: " +
                meses[i] +
                " | PANTALLA :" +
                (i + 1).toString());
            setState(() {
              mesSeleccionado = i;
            });
          }
        }
      }
    });

    return Stack(
      children: [
        GlassmorphicContainer(
            margin: EdgeInsets.only(
                top: MediaQueryData.fromView(window).size.height - 120,
                left: 0),
            width: MediaQueryData.fromView(window).size.width,
            height: 120,
            borderRadius: 1,
            linearGradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.1)
            ]),
            border: 0,
            blur: 10,
    shape: BoxShape.circle,
            borderGradient:
                LinearGradient(colors: [Colors.cyanAccent, Colors.black])),
        Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 15, left: 30),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                    backgroundBlendMode: BlendMode.difference,
                  ),
                )
              ],
            )),
        Container(
          alignment: Alignment.bottomCenter,
          height: 100,
          margin: EdgeInsets.only(
              top: MediaQueryData.fromView(window).size.height - 100),
          child: ListView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 80,
                width: 28,
                color: Colors.transparent,
              ),
              for (var i = 0; i < meses.length; i++)
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 80,
                  color: Colors.transparent,
                  child: Row(children: [
                    Container(
                      height: 100,
                      width: 35,
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: Container(
                                  height: 50,
                                  width: 3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    backgroundBlendMode: BlendMode.difference,
                                  )),
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 3,
                            color: Colors.transparent,
                          ),
                          Text(
                            meses[i],
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            textAlign: TextAlign.end,
                          ),
                          Container(
                            height: 10,
                            width: 3,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.transparent,
                    ),
                  ]),
                ),
              Container(
                height: 50,
                width: MediaQueryData.fromWindow(window).size.width - 111,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget fondo() {
    var fondo = [
      Colors.teal.shade100.withOpacity(0.5),
      Colors.tealAccent,
    ];
    int _tam = 30;
    double opacidad = _opacidad;

    double fontSizeInSp = 40.0;
    double fontSize = fontSizeInSp * MediaQuery.textScaleFactorOf(context);
    Future mostrarFondo() async {
      await Future.delayed(Duration(seconds: 1));
      if (_opacidad < 1) {
        for (int i = 0; i < 9; i++) {
          setState(() {
            _opacidad = (i) / 10;
          });
          await Future.delayed(Duration(milliseconds: 20));
        }
      }
    }

    Future desenfoque() async {
      await Future.delayed(Duration(seconds: 7));
      if (_blurEffect < 10) {
        for (int i = 0; i < 50; i++) {
          setState(() {
            _blurEffect = i.toDouble();
          });
          await Future.delayed(Duration(milliseconds: 20));
        }
      }
    }

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
      await Future.delayed(Duration(seconds: 6));
      _fade = 0;
    }

    Future animate() async {
      if (_counter == MediaQuery.of(context).size.width.toInt()) {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          _counter = MediaQuery.of(context).size.width.toInt() * 2;
          _counter2 = MediaQuery.of(context).size.height.toInt() * 2;
          _rotation = pi / 2;
        });
      } else {
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          _counter = MediaQuery.of(context).size.width.toInt();
          _counter2 = MediaQuery.of(context).size.height.toInt();
          _rotation = pi / 4;
        });
      }
      await Future.delayed(Duration(seconds: 1));

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

    var tam = 60;
    Future out() async {
      for (int i = 31; i < tam; i++) {
        setState(() {
          _tam = i;
        });
        await Future.delayed(Duration(milliseconds: 10));
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
                                child: Container(
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
                                                  constraints: BoxConstraints(
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

  @override
  Widget proyecto(int proyecto) {
    var proyectos = ['pr1.jpg', 'p2.jpg', 'postit.jpg', 'postit.jpg'];

    return ListView(
      children: [
        Wrap(
          children: [
            Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "PROYECTO " + proyecto.toString(),
                        style:
                            TextStyle(color: Colors.cyanAccent, fontSize: 50),
                      ),
                      CupertinoActivityIndicator(
                        color: Colors.cyanAccent,
                      ),
                      Text(
                        "CARGANDO",
                        style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Image.asset('assets/' + proyectos[proyecto - 1],
                  fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
            ])

            /*Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height-100,
                      color: Colors.black,
                        child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("PROYECTO "+proyecto.toString(),style: TextStyle(color: Colors.cyanAccent,fontSize: 50),),
                                Column(
                                  children: [
                                    CupertinoActivityIndicator(color: Colors.cyanAccent,),
                                    Text("CARGANDO",style: TextStyle(color: Colors.cyanAccent,fontSize: 8,fontWeight: FontWeight.bold),),
                                  ],
                                )


                              ],
                            )

                      ),

                  );*/
          ],
        )
      ],
    );
  }

  Future<void> loadImage(BuildContext context) async {
    await Future.delayed(Duration(microseconds: 100));
  }

  @override
  Widget diapositivas(int pantalla) {
    var margin = 83.00;
    var degradado = [
      Colors.teal.shade100.withOpacity(0.5),
      Colors.purpleAccent.withOpacity(0.1),
    ];

    if (pantalla == 0) {
      return Stack(
        children: [
          fondo(),
          Container(
            margin: EdgeInsets.only(top: margin, left: 37),
            child: Image.asset(
              'assets/perfil.png',
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 2,
              alignment: Alignment.topLeft,
            ),
          ),
        ],
      );
    } else {
      return proyecto(pantalla);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {},
            ),
            Text(
              "About me",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.file_copy, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                "MY CV",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
          Container(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.email, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                "CONTACT",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
          Container(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.computer, color: Colors.white),
                onPressed: () {},
              ),
              Text(
                "GITHUB",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
          Container(
            width: 20,
          ),
        ],
      ),
      body: Stack(alignment: Alignment.center, fit: StackFit.loose, children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
        diapositivas(mesSeleccionado),
        timeline()
      ]),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width > 800 ? 5 : 2;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.transparent,
          child: Card(
            child: Column(
              children: [
                Image.network('https://example.com/image$index.jpg'),
                Text('Elemento $index'),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
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

  @override
  Widget Tecnologias() {
    List list = [];
    for (var item in tecno) {
      list.add(item.toString());
    }
    return Container(
      child: Flex(
        direction: Axis.vertical,
        children: [
          Flexible(
            child: Text(
              "Tecnologias",
              style: TextStyle(color: Colors.cyanAccent, fontSize: 50),
            ),
          ),
          Flexible(
            child: Container(
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
            ),
          )
        ],
      ),
    );
  }

  Widget Tecnologiaas() {
    List list = [];
    for (var item in tecno) {
      list.add(item.toString());
    }
    porfolio.getProyectosLength();
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          clipBehavior: Clip.antiAlias,
          children: [
            Flexible(
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
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.compass_calibration_sharp,
                    color: Colors.black,
                    size: 80,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(list.length, (index) {
                    return Chip(
                      label: Text(
                        list[index],
                        style: TextStyle(color: Colors.white),
                      ),
                      avatar: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )),
                      backgroundColor: Colors.black,
                    );
                  }),
                ),
              ),
            ),
          ]),
    );
  }

  @override
  Widget Proyectos() {
    porfolio.getProyectosLength();
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          children: [
            Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                clipBehavior: Clip.antiAlias,
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        transform: Matrix4.rotationZ(0.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.purpleAccent, Colors.cyanAccent],
                            ))),
                  ),
                ]),
            Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                clipBehavior: Clip.antiAlias,
                children: [
                  Text(
                    "PROYECTOS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "MÁS RECIENTES",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 100,
                    endIndent: 100,
                    thickness: 1,
                  ),
                  for (int i = 1; i < 4; i++)
                    Flexible(
                        child: GlassmorphicContainer(
                            width: 600,
                            height: 150,
                            borderRadius: 10,
                            linearGradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(1),
                                  Colors.white.withOpacity(1),
                                  Colors.white.withOpacity(1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            border: 0,
                            blur: 6,
                            borderGradient: LinearGradient(
                              colors: [
                                Colors.cyanAccent.withOpacity(0),
                                Colors.greenAccent.withOpacity(0)
                              ],
                            ),
                            margin: EdgeInsets.only(bottom: 10),
                            child: Container(
                                padding: EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                              porfolio
                                                  .getProyecto(tamPorfolio - i)
                                                  .getIcon(),
                                              color: Colors.black),
                                          Row(
                                            children: [
                                              Text(
                                                  "  " +
                                                      porfolio
                                                          .getProyecto(
                                                              tamPorfolio - i)
                                                          .getNombre()
                                                          .toString()
                                                          .toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20)),
                                            ],
                                          ),
                                        ]),
                                    Flexible(
                                      flex: 10,
                                      child: Container(
                                        child: Text(
                                          porfolio
                                              .getProyecto(tamPorfolio - i)
                                              .getDescripcion()
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10),
                                        ),
                                      ),
                                    )
                                  ],
                                )))),
                ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    int columnas = 3;
    var widgets = [Proyectos(), Tecnologiaas()];

    var gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: columnas,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
    );

    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
    child:
      Column(


        children:[
          Container(
    height: 350,
    ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 660, // Ancho máximo de cada elemento
            mainAxisSpacing: 8.0, // Espacio vertical entre elementos
            crossAxisSpacing: 8.0, // Espacio horizontal entre elementos
          ),
          itemCount: widgets.length,
          // Cantidad de elementos en la cuadrícula
          itemBuilder: (Widget, index) {
            return Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black54,
              ),
              alignment: Alignment.center,
              child:

              widgets[index],
            );
          },
        ),
    Container(
    height: 400,
    ),
        ]

    ),
      );
  }
}
