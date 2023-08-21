import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';
import 'classes.dart';
import 'globalData.dart';




void main() {

  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalData(),
      child: const MyApp(),
    ),
  );
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
  int _counter = 0; int _counter2 = 0;  double _rotation = 0;
  int _color = 0; int _fade = 1;  double _blurEffect = 0; String _textoAnimado = '';
  String textoFinal = "DANIEL"; final apellido = "ARRIBAS"; final subapellido = "SORANDO";
  final svgString = '''<svg width="524" height="596" viewBox="0 0 524 596" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M277.75 5.67062L507.29 138.195C517.036 143.822 523.04 154.221 523.04 165.475V430.525C523.04 441.779 517.036 452.178 507.29 457.805L277.75 590.329C268.004 595.956 255.996 595.956 246.25 590.329L16.7103 457.805C6.96421 452.178 0.960327 441.779 0.960327 430.525V165.475C0.960327 154.221 6.9642 143.822 16.7103 138.195L246.25 5.67062C255.996 0.0436921 268.004 0.0436845 277.75 5.67062Z" stroke="white"/></svg>''';
  var degradado = [
    Colors.teal.shade100.withOpacity(0.5),
    Colors.purpleAccent.withOpacity(0.1),
  ];
  var _opacidad = 0.0;var aux = true;


  var tagSeleccionado = 0;
  double rounded = 400;

  void _showPopupGithub(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 30,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          content: Container(
            height: 300,
            width: 90,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blueGrey.withOpacity(1),
                width: 1,
              ),
            ),
            child: Center(
                child: Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.android,
                              color: Colors.white, size: 50),
                        ),
                        Container(
                          height: 10,
                        ),
                        const Text(
                          "Git-Hub",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    )),
                Flexible(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        color: Colors.blueGrey.withOpacity(1),
                        child: Container(
                            alignment: Alignment.center,
                            color: Colors.blueGrey.withOpacity(1),
                            child: Column(
                              children: [
                                const Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: const Icon(Icons.person,
                                            color: Colors.white, size: 25),
                                        flex: 1,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "Dani78w",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        flex: 1,
                                      ),
                                    ]),
                                const Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Icon(Icons.visibility,
                                            color: Colors.black, size: 20),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Text(
                                          "250",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: const Icon(Icons.arrow_upward,
                                            color: Colors.black, size: 20),
                                      ),
                                      Flexible(
                                        child: Text(
                                          "250",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        flex: 1,
                                      ),
                                    ]),
                                Container(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                    border: Border.all(
                                      color: Colors.blueGrey.withOpacity(1),
                                      width: 1,
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Visitar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            color: Colors.black, size: 15),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context); // Cierra el popup
                                    },
                                  ),
                                ),
                              ],
                            ))))
              ],
            )),
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
                child: Icon(Icons.close, color: Colors.white, size: 30),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPopupEmail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 30,
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          content: Container(
            height: 294,
            width: 290,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blueGrey.withOpacity(1),
                width: 1,
              ),
            ),
            child: Center(
                child: Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.android,
                              color: Colors.white, size: 50),
                        ),
                        Container(
                          height: 10,
                        ),
                        const Text(
                          "Contact",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    )),
                Flexible(
                    flex: 2,
                    child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        color: Colors.blueGrey.withOpacity(1),
                        child: Container(
                            alignment: Alignment.center,
                            color: Colors.blueGrey.withOpacity(1),
                            child: Column(
                              children: [
                                const Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                        child: Icon(Icons.email,
                                            color: Colors.white, size: 25),
                                        flex: 1,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "danielarribas78w@gmail.com",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        flex: 3,
                                      ),
                                    ]),
                                Container(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 38,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black12,
                                    border: Border.all(
                                      color: Colors.blueGrey.withOpacity(1),
                                      width: 1,
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Visitar",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            color: Colors.black, size: 15),
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context); // Cierra el popup
                                    },
                                  ),
                                ),
                              ],
                            ))))
              ],
            )),
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

  Widget timeline(ScrollController scrollController) {
    var rangos = [];

    for (var i = 0; i < porfolio.tags.length; i++) {
      var max = (i * 80) + 15;
      var min = (i * 80) - 15;
      rangos.add([min, max]);
    }

    scrollController.addListener(() {
      for (var i = 0; i < rangos.length; i++) {
        if (scrollController.position.pixels >= rangos[i][0] &&
            scrollController.position.pixels <= rangos[i][1]) {
          if (tagSeleccionado != i) {

            setState(() {
              tagSeleccionado = i;
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
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.8)
            ]),
            border: 0,
            blur: 10,
            shape: BoxShape.circle,
            borderGradient: const LinearGradient(
                colors: [Colors.cyanAccent, Colors.black])),
        Container(
            width: MediaQueryData.fromView(window).size.width,
            height: MediaQueryData.fromView(window).size.height,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 43, left: 25, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQueryData.fromView(window).size.width - 135,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1),
                    borderRadius: BorderRadius.circular(10),
                    backgroundBlendMode: BlendMode.difference,
                  ),
                ),
              ],
            )),
        Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 15, left: 20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(1),
                      width: 1,
                    ),
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
              for (var i = 0; i < porfolio.tags.length; i++)
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 80,
                  color: Colors.transparent,
                  child: Row(children: [
                    Container(
                      height: 100,
                      width: 34,
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
                            porfolio.tags[i].toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                            textAlign: TextAlign.end,
                          ),
                          Container(
                            height: 3,
                            width: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.cyan,
                            ),
                          ),
                          Container(
                            height: 7,
                            width: 3,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ), //palitos
                    Container(
                        height: 150,
                        width: 51,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var j = 0; j < 3; j++)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 17,
                                        height: 20,
                                        margin:
                                            const EdgeInsets.only(bottom: 50),
                                        child: Center(
                                          child: Container(
                                            width: 1,
                                            height: 20,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ],
                                )
                            ],
                          ),
                        )),
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
        ),
        Container(
            width: MediaQueryData.fromView(window).size.width,
            height: MediaQueryData.fromView(window).size.height,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(bottom: 19, left: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 68,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 15,
                          width: 71,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(1),
                          ),
                          child: const Center(
                            child: Text(
                              "PROYECTOS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          height: 5,
                        ),
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white.withOpacity(1),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                Flexible(
                                  flex: 10,
                                  child: IconButton(
                                      icon: const Icon(Icons.arrow_back_ios,
                                          color: Colors.white, size: 20),
                                      onPressed: () {
                                        scrollController.animateTo(
                                            scrollController.position.pixels -
                                                85,
                                            duration: const Duration(
                                                milliseconds: 100),
                                            curve: Curves.easeIn);
                                      }),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Flexible(
                                  child: IconButton(
                                    icon: const Icon(Icons.arrow_forward_ios,
                                        color: Colors.white, size: 20),
                                    onPressed: () {
                                      scrollController.animateTo(
                                          scrollController.position.pixels + 85,
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.easeIn);
                                    },
                                  ),
                                  flex: 10,
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            )),
      ],
    );
  }

  @override
  Widget proyecto(int proyecto) {


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
                        style: const TextStyle(
                            color: Colors.cyanAccent, fontSize: 50),
                      ),
                      const CupertinoActivityIndicator(
                        color: Colors.cyanAccent,
                      ),
                      const Text(
                        "CARGANDO",
                        style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 8,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Column(
                children: [
                  Center(
                    child: InteractiveViewer(
                      panEnabled: true,
                      // Set it to false to prevent panning.
                      boundaryMargin: const EdgeInsets.all(80),
                      minScale: 0.5,
                      maxScale: 4,
                      child: Image.asset(porfolio.proyectos[proyecto].ruta_foto,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 100,
                  )
                ],
              )
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
    await Future.delayed(const Duration(microseconds: 100));
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
          const Fondo(),
          Container(
            margin: EdgeInsets.only(top: margin, left: 37),
            child: Image.asset(
              'assets/perfil.png',
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 6,
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
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {},
            ),
            const Text(
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
                icon: const Icon(Icons.file_copy, color: Colors.white),
                onPressed: () {
                  //navegar a la pagina de cv

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BannerScreen()),
                  );
                },
              ),
              const Text(
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
                icon: const Icon(Icons.email, color: Colors.white),
                onPressed: () {
                  _showPopupEmail(context);
                },
              ),
              const Text(
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
                icon: const Icon(Icons.computer, color: Colors.white),
                onPressed: () {
                  _showPopupGithub(context);
                },
              ),
              const Text(
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
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
        diapositivas(tagSeleccionado),
        timeline(scrollController),
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
          const Flexible(
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

  @override
  Widget Proyectos() {
    porfolio.getProyectosLength();
    return Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
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
            Flex(
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
                                    85 * (tamPorfolio - i),
                                duration: const Duration(milliseconds: 100),
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
                                                        tamPorfolio - i - 1)
                                                    .getIcon(),
                                                color: Colors.white),
                                            Row(
                                              children: [
                                                Text(
                                                    "  " +
                                                        porfolio
                                                            .getProyecto(
                                                                tamPorfolio -
                                                                    i -
                                                                    1)
                                                            .getNombre()
                                                            .toString()
                                                            .toUpperCase(),
                                                    style: const TextStyle(
                                                        color: Colors.white,
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
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      )
                                    ],
                                  )))),
                    ),
                ]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    int columnas = 3;
    var widgets = [
      Proyectos(),
      const TechnoWidget(),
      const SearchWidget(),
      if(MediaQuery.of(context).size.width > 1336)
      Container(),
      LastPost(),
      TreeWidget(),
    ];

    var gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: columnas,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
    );

    final screenWidth = MediaQuery.of(context).size.width;
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
        itemBuilder: (Widget, index) {
          return Container(
            padding: EdgeInsets.all(10.0),
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
  var _padding = 0;
  var _color = 0;

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

var tecnoSelected = [].toSet();

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
    return Container(
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
                child: Container(
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
              child: Container(
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
                          print("he puslado " +
                              list[index] +
                              "  |  " +
                              value.toString() +
                              "  |  " +
                              tecnoSelected.toString() +
                              "  |");
                        });
                      },
                    );
                  }),
                ),
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
            child: Center(
                child: Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.search,
                              color: Colors.white, size: 50),
                        ),
                        Container(
                          height: 10,
                        ),
                        const Text(
                          "Resultados",
                          style: const TextStyle(
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
                            children: const [resultados()],
                          ),
                        )))
              ],
            )),
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
    ;

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
            Flex(
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

class resultados extends StatefulWidget {
  const resultados({super.key});

  @override
  State<resultados> createState() => _resultadosState();
}

class _resultadosState extends State<resultados> {
  Widget buscar() {
    var cambios = Provider.of<GlobalData>(context, listen: true).value;
    List<Proyecto> proyectos = porfolio.proyectos.toList();
    var tecnoSelectedNames = [].toSet();

    for (var i = 1; i < cambios + 1; i++) {
      tecnoSelectedNames.add(tecnoSelected.elementAt(i).toString());
      tecnoSelected.add(tecnoSelected.elementAt(i));
      print("ayquerico" + tecnoSelectedNames.toString());
    }

    List<Proyecto> resultadosBusqueda = [];
    resultadosBusqueda = resultadosBusqueda.toSet().toList();

    for (var proyecto in proyectos) {
      var j = 0;
      for (var tecnologia in tecnoSelectedNames) {
        print("tecnologia" + tecnologia.toString());
        print(proyecto.getTecnologias().toString());
        if (proyecto.getTecnologias().contains(tecnologia.toString()) == true) {
          j++;
        }
      }

      if (j == tecnoSelectedNames.length) {
        resultadosBusqueda.add(proyecto);
      }
    }
    print("Busqueda Finalizada");
    print(resultadosBusqueda.toString());
    resultadosBusqueda = resultadosBusqueda.toSet().toList();

    return Column(
      children: [
        if (resultadosBusqueda.length == 0)
          Text("No se han encontrado resultados"),
        if (resultadosBusqueda.length != 0)
          for (var proyecto in resultadosBusqueda)
            GestureDetector(
                onTap: () {
                  var posicion = porfolio.proyectos.indexOf(proyecto);
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
                          child: const Icon(
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
    int _tam = 30;
    double opacidad = _opacidad;

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

    Future desenfoque() async {
      await Future.delayed(const Duration(seconds: 7));
      if (_blurEffect < 10) {
        for (int i = 0; i < 50; i++) {
          setState(() {
            _blurEffect = i.toDouble();
          });
          await Future.delayed(const Duration(milliseconds: 20));
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

    var tam = 60;
    Future out() async {
      for (int i = 31; i < tam; i++) {
        setState(() {
          _tam = i;
        });
        await Future.delayed(const Duration(milliseconds: 10));
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
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
              height: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 3,
                      child: Stack(
                        children: [
                          Container(


                              child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                for (var j = 0; j < 23; j++)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AnimatedContainer(
                                          duration: Duration(seconds: 1),
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
                                  )
                              ],
                            ),
                          )),
                          Center(
                              child: Container(

                            alignment: Alignment.centerRight,
                            width: 140,
                            height: 240,
                            clipBehavior: Clip.antiAlias,
                            transform: Matrix4.identity()
                              ..setEntry(
                                  3, 2, 0.002) // Agrega perspectiva cónica
                              ..rotateY(0.5),
                            decoration: BoxDecoration(
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

                            ),
                            child: Flexible(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black87,
                                    width:0,
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
                          ))
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
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
              ))
        ],
      ),
    );
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
    return

      Flex(
      direction: Axis.vertical,
      children: [
        Flexible(flex:2,child: Container(
        alignment: Alignment.topCenter,
          child: const ModelViewer(
            src: 'assets/3d/key_card.glb',
            loading: Loading.auto,
            alt: "A 3D model",
            reveal: Reveal.auto,
            ar: true,
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
            flex:1,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Text(
                          "MODELOS",
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
        Spacer(
          flex: 1,
        ),

      ],
    );
  }
}
