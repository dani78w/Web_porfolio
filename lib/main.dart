import 'dart:math';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var meses = [
    "Ene",
    "Feb",
    "Mar",
    "Abr",
    "May",
    "Jun",
    "Jul",
    "Ago",
    "Sep",
    "Oct",
    "Nov",
    "Dic",
  ];






  int _counter = 0;
  int _counter2 = 0;
  double _rotation = 0;
  int _color = 0;
  int _fade = 1 ;
  double _blurEffect = 0;

  String _textoAnimado = '';
  String textoFinal = "DANIEL";
  final apellido = "ARRIBAS";
  final subapellido = "SORANDO";
  int _tam = 30;

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
  var _opacidad = 0.0;
  var aux = true;

  var panel=false;
  @override
  Widget timeline() {
    ScrollController scrollController = ScrollController(keepScrollOffset: false, initialScrollOffset: -MediaQueryData.fromView(window).size.width);

    scrollController.addListener(() {

      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        print("Llegaste al final");


        setState(() {
          panel=true;
        });

      }else{

        setState(() {
          panel=false;
        });
      }

    });

    return ListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
    physics: const ClampingScrollPhysics(),
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: 80,
          width: 28,
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
                          color: Colors.white,
                        ),
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
          width: MediaQueryData.fromWindow(window).size.width -111,
          color: Colors.transparent,
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    double opacidad = _opacidad;
    var fondo = [
      Colors.teal.shade100.withOpacity(0.5),
      Colors.purpleAccent.withOpacity(0.1),
    ];
    double fontSizeInSp = 40.0;
    double fontSize = fontSizeInSp * MediaQuery.textScaleFactorOf(context);
    /*
    if (_counter >= 600) {
      setState(() {
        _counter = 50;
        _counter2 = 50;
        _rotation = 360 ;
      });
    }
  */
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Future mostrarFondo() async {
      await Future.delayed(Duration(seconds: 1));
      if (_opacidad < 1) {
        for (int i = 0; i < 9; i++) {
          setState(() {
            _opacidad = (i ) / 10;
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
    desenfoque();


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
        backgroundColor: Colors.teal,
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                children: [
                  if (aux == true)
                    for (var i = 1; i < 8; i++)
                      AnimatedContainer(
                        transform: Matrix4.rotationZ(_rotation * i),
                        transformAlignment: Alignment.center,
                        width: _counter.toDouble() / (i * 0.7),
                        height: _counter2.toDouble() / (i * 0.7),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: fondo)),
                            child: Container(
                                alignment: Alignment.center,
                                child: Flex(
                                  clipBehavior: Clip.antiAlias,
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Text("/ ",
                                          style: TextStyle(
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white.withOpacity(_fade.toDouble())))
                                    ),
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
                                                .withOpacity(_color.toDouble()),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ))
                                  ],
                                )))),
                  if (panel == true)
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black,Colors.black,Colors.redAccent],)),
                      alignment: Alignment.center,
                      child: Text(
                        "[ 🏁 ]",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 10,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

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
                          ),
                          )
                        ],
                      )),
                  timeline(),
                ]),
          ),
        ));
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
