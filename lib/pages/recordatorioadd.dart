import 'package:clinica/pages/recordatorioview.dart';
import 'package:clinica/requests/recordatoriohttp.dart';
import 'package:flutter/material.dart';

class AddPersonalAtencion extends StatefulWidget {
  AddPersonalAtencion({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _AddPersonalAtencionState createState() => _AddPersonalAtencionState();
}

class _AddPersonalAtencionState extends State<AddPersonalAtencion> {
  final TextEditingController NombreController = new TextEditingController();
  final TextEditingController HoraController = new TextEditingController();

  final TextEditingController ObservacionController =
      new TextEditingController();

  bool RecordarmeController = false;
  String? RecordarmeTxt = "No";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agregar nuevo recordatorio',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: IconButton(
                  tooltip: 'Ir a menu',
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecordatorioView()),
                    );
                  }),
            ),
            title: Text("Agregar nuevo recordatorio",
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left)),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 20, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: NombreController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Recordatorio',
                    hintText: 'Escribe que quieres recordar...',
                    icon: new Icon(Icons.add_alert),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: ObservacionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Observación',
                    hintText: 'Escribe una observación...',
                    icon: new Icon(Icons.assignment_outlined),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: HoraController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Hora',
                    hintText: 'Escribe una hora...',
                    icon: new Icon(Icons.access_alarms_sharp),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new SwitchListTile(
                  title: Text('Recordarme'),
                  value: RecordarmeController,
                  onChanged: (bool value) {
                    setState(() {
                      RecordarmeController = value;
                    });
                  },
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                  height: 40,
                  child: ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: new RaisedButton(
                      onPressed: () {
                        AdicionarRecordatorio(
                          NombreController.text.trim(),
                          HoraController.text.trim(),
                          ObservacionController.text.trim(),
                          RecordarmeController == true
                              ? RecordarmeTxt = "Si"
                              : RecordarmeTxt = "No",
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RecordatorioView()));
                      },
                      child: SizedBox(
                        width: 350,
                        height: 30,
                        child: Center(
                          child: Text("Guardar recordatorio",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.left),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
