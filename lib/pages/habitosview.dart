import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';

import 'dart:math';

class HabitosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: <String, WidgetBuilder>{
        //"/Personal": (BuildContext context) => ListPersonalAtencion(),
      },
      home: MyHomePage(
        title: 'Estilos de vida saludables',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;
  final _bgColor = Color(0xFFF6F6F6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estilos de vida saludables'),
      ),
      body: HabitosVista(),
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.home_rounded,
          Icons.medical_services_rounded,
          Icons.article_outlined,
          Icons.brightness_7_rounded,

          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.home_rounded,
          Icons.medical_services_rounded,
          Icons.article_outlined,
          Icons.brightness_7_rounded,

          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/Menu");
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/ListadoPaciente");
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

class HabitosVista extends StatefulWidget {
  @override
  _HabitosVistaState createState() => _HabitosVistaState();
}

class _HabitosVistaState extends State<HabitosVista> {
  List? data;
  Future<List> getData() async {
    final response = await http.get(
        Uri.parse('http://localhost/ClinicaServidorApp/GetDataHabito.php'));

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new GestureDetector(
                /*  onTap: () => Navigator.of(context).push(
                  new MaterialPage(
                      builder: (BuildContext context) => new DetailUser(
                            List: list,
                            index: i,
                            list: [],
                          )),
                ),*/
                child: new Card(
                  child: Container(
                    //color: Colors.black,

                    height: 100.3,
                    child: new Card(

                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // add this
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list![i]['Nombre'].toString(),
                                    style: TextStyle(
                                        fontSize: 25.0, color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    list![i]['Descripcion'].toString(),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
