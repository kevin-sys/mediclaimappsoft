import 'package:clinica/models/medicamento.dart';
import 'package:flutter/material.dart';

var contextoMedicamento;

class PerfilMedicamento extends StatelessWidget {
  final idperfilmedicamento;
  final List<Medicamento> medicamentos;
  PerfilMedicamento(
      {Key? key, required this.medicamentos, this.idperfilmedicamento});

  @override
  Widget build(BuildContext context) {
    contextoMedicamento = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detalles del medicamento',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Medicamento'),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 550,
            width: double.maxFinite,
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
                      width: 100,
                      //color: Colors.blue,

                      child: Card(
                        elevation: 2,
                        child: Image.network(
                            medicamentos[idperfilmedicamento].Foto),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                          medicamentos[idperfilmedicamento]
                                              .Nombre,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Presentacion',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(
                                        medicamentos[idperfilmedicamento]
                                            .Presentacion,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Tipo',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(medicamentos[idperfilmedicamento]
                                          .Tipo),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Laboratorio',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      Text(medicamentos[idperfilmedicamento]
                                          .Laboratorio),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              /*   Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Eficaz',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      CircleAvatar(
                                          child: Text(
                                              medicamentos[idperfilmedicamento]
                                                  .Eficaz)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Confiable',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      CircleAvatar(
                                          child: Text(
                                              medicamentos[idperfilmedicamento]
                                                  .Confiable)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Seguro',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      CircleAvatar(
                                          child: Text(
                                              medicamentos[idperfilmedicamento]
                                                  .Seguro)),
                                    ],
                                  )
                                ],
                              ),*/

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Eficaz',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () => {},
                                        child: Icon(Icons.check),
                                        elevation: 50.0,
                                        backgroundColor: Colors.pinkAccent,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Confiable',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () => {},
                                        child: Icon(Icons.check),
                                        elevation: 50.0,
                                        backgroundColor: Colors.greenAccent,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Seguro',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.cyan)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () => {},
                                        child: Icon(Icons.check),
                                        elevation: 50.0,
                                        backgroundColor: Colors.yellowAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 400,
                                height: 130,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Text(
                                  medicamentos[idperfilmedicamento].Descripcion,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Volver a mis medicamentos',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white))),
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
        ]),
      ),
    );
  }
}
