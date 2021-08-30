import 'dart:convert';
import 'package:clinica/pages/recetaview.dart';
import 'package:clinica/pages/recordatorioadd.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clinica/models/recordatorio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:clinica/requests/configurl.dart';

import 'medicamentoview.dart';
import 'menu.dart';

Future<List<Recordatorio>> ListarRecordatorio(http.Client client) async {
  final response = await http.get(Uri.parse(Url + 'GetDataRecordatorio.php'));
  return compute(pasarrecordatorioalista, response.body);
}

List<Recordatorio> pasarrecordatorioalista(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar
      .map<Recordatorio>((json) => Recordatorio.fromJson(json))
      .toList();
}

void main() {
  runApp(RecordatorioView());
}

class RecordatorioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recordatorio',
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: <String, WidgetBuilder>{
        "/Receta": (BuildContext context) => BusquedaRecetas(idUsuario: '',),
        "/Ajustes": (BuildContext context) => MenuAdministrador(idUsuario: ''),
        "/Medicamento": (BuildContext context) => MedicamentoView(),
      },
      home: MyHomePage(
        title: 'Recordatorio',
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
        title: Text("Mis recordatorios",
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.left),
        actions: [
          IconButton(
              tooltip: 'Nuevo recordatorio',
              icon: Icon(Icons.add,
                color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPersonalAtencion()),
                );
              }),
        ],
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo(context);
          });
        },
        tooltip: 'Actualizar',
        child: Icon(Icons.refresh),
      ),
      bottomNavigationBar: AwesomeBottomNav(
        icons: [
          Icons.article_outlined,
          Icons.home_rounded,
          Icons.medical_services_rounded,
          Icons.brightness_7_rounded,

          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.article_outlined,
          Icons.home_rounded,
          Icons.medical_services_rounded,
          Icons.brightness_7_rounded,

          // Icons.settings,
        ],
        onTapped: (int value) {
          setState(() {
            selectedIndex = value;
            if (selectedIndex == 1) {
              Navigator.pushNamed(context, "/Receta");
            }
            if (selectedIndex == 2) {
              Navigator.pushNamed(context, "/Medicamento");
            }
            if (selectedIndex == 3) {
              Navigator.pushNamed(context, "/Ajustes");
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

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: ListarRecordatorio(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaRecordatorio(recordatorios: snapshot.data)
              : Text(
                  'No hay datos',
                  style: TextStyle(color: Colors.black),
                );

        default:
          return Text('Actualizar');
      }
    },
  );
}

class VistaRecordatorio extends StatelessWidget {
  List<Recordatorio> recordatorios;

  VistaRecordatorio({Key? key, required this.recordatorios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recordatorios == null ? 0 : recordatorios.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            /*   onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilMedicamento(
                          medicamentos: medicamentos, idperfilmedicamento: posicion)));
            },*/
            leading: Container(
              padding: EdgeInsets.all(1.0),
              width: 75,
              height: 75,
              child: Image.network(recordatorios[posicion].Foto),
            ),
            title: Text(recordatorios[posicion].Hora),
            subtitle: Text(recordatorios[posicion].Nombre +
                " " +
                recordatorios[posicion].Observacion),
            trailing: Container(
              width: 130,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child:
                  Text("Evento activo: " + recordatorios[posicion].Recordarme),
              color: recordatorios[posicion].Recordarme == 'Si'
                  ? Colors.blue
                  : Colors.pink,
            ),
          );
        });
  }
}
