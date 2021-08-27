import 'dart:convert';
import 'package:clinica/pages/perfilmedicamento.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clinica/models/medicamento.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:clinica/requests/configurl.dart';

  Future<List<Medicamento>> ListarMedicamentos(http.Client client) async {
  final response = await http.get(Uri.parse(Url + 'GetDataMedicamento.php'));
  return compute(pasarmedicamentoalista, response.body);
}

List<Medicamento> pasarmedicamentoalista(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Medicamento>((json) => Medicamento.fromJson(json)).toList();
}

void main() {
  runApp(MedicamentoView());
}

class MedicamentoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicamentos',
      theme: ThemeData(primarySwatch: Colors.cyan),
      routes: <String, WidgetBuilder>{
        //"/Personal": (BuildContext context) => ListPersonalAtencion(),
      },
      home: MyHomePage(
        title: 'Medicamentos',
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

        title: Text('Medicamentos'),

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

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: ListarMedicamentos(http.Client()),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.data != null
              ? VistaMedicamentos(medicamentos: snapshot.data)
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

class VistaMedicamentos extends StatelessWidget {
  List<Medicamento> medicamentos;

  VistaMedicamentos({Key? key, required this.medicamentos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: medicamentos == null ? 0 : medicamentos.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PerfilMedicamento(
                          medicamentos: medicamentos, idperfilmedicamento: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Image.network(medicamentos[posicion].Foto),
            ),
            title: Text(medicamentos[posicion].Nombre),
            subtitle: Text(medicamentos[posicion].Presentacion),
            trailing: Container(
              width: 190,
              height: 40,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(medicamentos[posicion].Tipo),
              color: medicamentos[posicion].Tipo == 'Activo'
                  ? Colors.lightGreenAccent
                  : Colors.white,
            ),
          );
        });
  }
}
