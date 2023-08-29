import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'dart:ui';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'package:provider/provider.dart';
import 'package:web_porfolio/widgets.dart';
import 'classes.dart';
import 'globalData.dart';

SyncApiPorfolio sc = SyncApiPorfolio();

Future<void> main() async {
  sc.syncPorfolio()
      .then((value) => runApp(
        ChangeNotifierProvider(
            create: (context) => GlobalData(),
            child:
              MyApp(),
            ),
      ));
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
      home: Container(
        color: CupertinoColors.black,
        child: MyHomePage(title: 'Portfolio Daniel Arribas'),
      ),
      //MyHomePage(title: 'Flutter Demo Home Page'),
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
  /* Future<http.Response> fetchPost() async {
    var resultado= await http.get(Uri(scheme:"http",host:"192.168.1.163",port:8090,path:'/first/cosas/Tables'))
    print("papi"+resultado.toString());
    print(JsonDecoder().convert(resultado.toString()));
    return JsonDecoder().convert(resultado.toString());
  }*/

  String textoFinal = "DANIEL";
  final apellido = "ARRIBAS";
  final subapellido = "SORANDO";
  final svgString =
      '''<svg width="524" height="596" viewBox="0 0 524 596" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M277.75 5.67062L507.29 138.195C517.036 143.822 523.04 154.221 523.04 165.475V430.525C523.04 441.779 517.036 452.178 507.29 457.805L277.75 590.329C268.004 595.956 255.996 595.956 246.25 590.329L16.7103 457.805C6.96421 452.178 0.960327 441.779 0.960327 430.525V165.475C0.960327 154.221 6.9642 143.822 16.7103 138.195L246.25 5.67062C255.996 0.0436921 268.004 0.0436845 277.75 5.67062Z" stroke="white"/></svg>''';
  var degradado = [
    Colors.teal.shade100.withOpacity(0.5),
    Colors.purpleAccent.withOpacity(0.1),
  ];
  var aux = true;
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
                          const SizedBox(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.android,
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
                                          flex: 1,
                                          child: Icon(Icons.person,
                                              color: Colors.white, size: 25),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Text(
                                            "Dani78w",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ]),
                                  const Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          child: Icon(Icons.arrow_upward,
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
                                        Navigator.pop(
                                            context); // Cierra el popup
                                      },
                                    ),
                                  ),
                                ],
                              ))))
                ],
              )),
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
                          const SizedBox(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.android,
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
                                          flex: 1,
                                          child: Icon(Icons.email,
                                              color: Colors.white, size: 25),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Text(
                                            "danielarribas78w@gmail.com",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
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
                                        Navigator.pop(
                                            context); // Cierra el popup
                                      },
                                    ),
                                  ),
                                ],
                              ))))
                ],
              )),
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
                    SizedBox(
                      height: 100,
                      width: 34,
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                                height: 50,
                                width: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  backgroundBlendMode: BlendMode.difference,
                                )),
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
                    SizedBox(
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
                                          scrollController.position.pixels - 85,
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.easeIn);
                                    }),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Flexible(
                                flex: 10,
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
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            )),
      ],
    );
  }

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
                        "PROYECTO $proyecto",
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
                    child: Image.asset(
                        porfolio.proyectos.elementAt(proyecto).rutaFoto,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width),
                  ),
                  const SizedBox(
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

  Widget diapositivas(int pantalla) {
    var margin = 83.00;
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

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: sc.isDoneSync(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const
              MyHomePage(title: 'Flutter Demo Home Page');
        } else if (snapshot.hasError) {
          return Stack(
            children: [
              Fondo(),
              Center(
                child: Text(
                  "CARGANDO",
                  style: TextStyle(color: Colors.cyanAccent, fontSize: 50),
                ),
              )
            ],
          );
        }
        return Container(
            color: Colors.black,
            alignment: Alignment.center,
            transformAlignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 6,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                    transform: Matrix4.rotationZ(pi / -4),
                    transformAlignment: Alignment.center,
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.cyanAccent.withOpacity(1),
                        width: 1,
                      ),
                    ),
                    child: CupertinoActivityIndicator(
                      color: Colors.cyanAccent,
                      radius: 20,
                    ),
                    //const Text("SINCRONIZANDO",style: TextStyle(color: Colors.cyanAccent,fontSize: 10),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    "SINCRONIZANDO",
                    style: TextStyle(color: Colors.cyanAccent, fontSize: 10),
                  ),
                )
              ],
            ));
      },
    ));
  }
}
