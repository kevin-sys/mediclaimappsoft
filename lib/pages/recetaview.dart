import 'dart:convert';
import 'package:clinica/pages/perfilreceta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clinica/models/receta.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:clinica/requests/configurl.dart';
import 'package:clinica/main.dart';


String Id = '';
String Name = '';

Future<List<Receta>> ListarReceta(http.Client client, Id, Name) async {
  final response = await http.post(Uri.parse(Url + 'FindRecetaId.php'), body: {
    "IdentificacionPaciente": Id,
  });
  return compute(pasarreceta, response.body);
}

List<Receta> pasarreceta(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Receta>((json) => Receta.fromJson(json)).toList();
}

class BusquedaRecetas extends StatelessWidget {
  String idUsuario = '';
  String nameUsuario = '';

  BusquedaRecetas({required this.idUsuario, nameUsuario});
  factory BusquedaRecetas.Asignar(Map JsonMap) {
    Id = JsonMap['idUsuario'];
    Name = JsonMap['nameUsuario'];
    return BusquedaRecetas(idUsuario: JsonMap[Id], nameUsuario: JsonMap[Name]);
  }

  @override
  Widget build(BuildContext context) {
    Id = idUsuario;
    Name = nameUsuario;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recetas medicas' + Name,
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: <String, WidgetBuilder>{
       // "/Personal": (BuildContext context) => ListPersonalAtencion(),
       // "/Cita": (BuildContext context) => ListCitas(),
        //"/Menu": (BuildContext context) => MenuAdministrador(),
      },
      home: MyHomePage(
        title: 'Recetas',
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
        title: Text('Recetas médicas'),
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
          Icons.home_rounded,
          Icons.medical_services_rounded,
          Icons.brightness_7_rounded,

          // Icons.settings_outlined,
        ],
        highlightedIcons: [
          Icons.home_rounded,
          Icons.medical_services_rounded,
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

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: ListarReceta(http.Client(), Id, Name),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaRecetas(recetas: snapshot.data)
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

class VistaRecetas extends StatelessWidget {
  List<Receta> recetas;

  VistaRecetas({Key? key, required this.recetas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recetas == null ? 0 : recetas.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilReceta(
                          perfilrecetas: recetas, idperfilreceta: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 140,
              height: 180,
              child: Text(recetas[posicion].CentroAsistencial +
                  " Fecha " +
                  recetas[posicion].Fecha),
            ),
            title:
                Text("Codigo de la receta " + recetas[posicion].CodigoReceta),
            subtitle: Text("Dr: " + recetas[posicion].NombreMedico),
            trailing: Container(
              width: 120,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(recetas[posicion].EstadoReceta),
              color: recetas[posicion].EstadoReceta == 'No reclamada'
                  ? Colors.redAccent
                  : Colors.lightGreenAccent,
            ),
          );
        });
  }
}
