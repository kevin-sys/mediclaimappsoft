// ignore: import_of_legacy_library_into_null_safe
import 'dart:math';

import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:clinica/pages/recetaview.dart';
import 'package:flutter/material.dart';



String Id = '';
String Name = '';
class MenuAdministrador extends StatelessWidget {
  String idUsuario ;
  MenuAdministrador({required this.idUsuario, nameUsuario});
  factory MenuAdministrador.Asignar(Map JsonMap) {
    Id = JsonMap['idUsuario'];
    Name = JsonMap['nameUsuario'];
    return MenuAdministrador(idUsuario: JsonMap[Id], nameUsuario: JsonMap[Name]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu Principal'+ Id,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
         "/Receta": (BuildContext context) => BusquedaRecetas(idUsuario: '',),
       /* "/Personal": (BuildContext context) => AddPersonalAtencion(),
        "/Cita": (BuildContext context) => AddCita(),
        "/ListadoPaciente": (BuildContext context) => ListPaciente(),
        "/ListadoPersonal": (BuildContext context) => ListPersonalAtencion(),
        "/ListadoCitas": (BuildContext context) => ListCitas(),
        "/ListadoUsuario": (BuildContext context) => ListUsuario(),*/
      },
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        /*  actions: [
          IconButton(
              tooltip: 'Cerrar sesión',
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              }),
        ],*/
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
        child: Column(
          children: <Widget>[
            /*Text('Ajustes',
                style: TextStyle(
                    fontSize: 25, color: Colors.black)),*/
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              height: 110,
              width: 400,
              child: Card(
                elevation: 5,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -50,
                      left: (MediaQuery.of(context).size.width / 2) - 55,
                      child: Container(
                        height: 100,
                        width: 150,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Column(
                              children: [
                                Text('Kevin Gómez Cantillo',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                Text('kevin99@mediclaim.com',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                                Text('CC:1065853708',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/Paciente");
                            },
                            child: SizedBox(
                              width: 400,
                              height: 40,
                              child: Center(
                                child: Text("Información",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: RaisedButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: 400,
                              height: 40,
                              child: Center(
                                child: Text("Seguridad",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: RaisedButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: 400,
                              height: 40,
                              child: Center(
                                child: Text("Contactenos",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: RaisedButton(
                            onPressed: () {},
                            child: SizedBox(
                              width: 400,
                              height: 40,
                              child: Center(
                                child: Text("Soporte",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.logout),
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.brightness_7_rounded,
          Icons.home_rounded,
          Icons.medical_services_rounded,
          Icons.article_outlined,


          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.brightness_7_rounded,
          Icons.home_rounded,
          Icons.medical_services_rounded,
          Icons.article_outlined,

          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BusquedaRecetas(
                    idUsuario: Id);
              }));
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/Receta");
            }
            if (selectedIndex == 3) {
              Navigator.pushNamed(context, "/ListadoPersonal");
            }
          });
        },
        bodyBgColor: _bgColor,
        highlightColor: Color(0xFF00D0D0),
        navFgColor: Colors.black,
        navBgColor: Color(0xFF00D0D0),
      ),
    );
  }
}
