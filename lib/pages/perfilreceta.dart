import 'package:clinica/models/receta.dart';
import 'package:flutter/material.dart';

var contextoppal;

class PerfilReceta extends StatelessWidget {
  final idperfilreceta;
  final List<Receta> perfilrecetas;
  PerfilReceta({Key? key, required this.perfilrecetas, this.idperfilreceta});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receta médica',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detalles de la receta médica'),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text('Receta',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Fecha'),
                                      Text(
                                        perfilrecetas[idperfilreceta].Fecha,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Código'),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .CodigoReceta,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Medico'),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .NombreMedico,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Centro asistencial'),
                                      Text(perfilrecetas[idperfilreceta]
                                          .CentroAsistencial),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Usuario',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Identificacion'),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .IdentificacionPaciente,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Nombres'),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .NombresPaciente,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Apellidos'),
                                      Text(perfilrecetas[idperfilreceta]
                                          .ApellidosPaciente),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('régimen social'),
                                      Text(perfilrecetas[idperfilreceta]
                                          .TipoAfiliado),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text('Medicamentos',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Nombre'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .NombreMedicamento1,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .NombreMedicamento2,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .NombreMedicamento3,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Cantidad'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .CantidadMedicamento1,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .CantidadMedicamento2,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .CantidadMedicamento3,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Indicaciones'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .HoraConsumo1,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .HoraConsumo2,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .HoraConsumo3,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('¿disponible?'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .Disponible1,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .Disponible2,
                                      ),
                                      Text(
                                        perfilrecetas[idperfilreceta]
                                            .Disponible3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Observación',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.cyan)),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("El estado de su receta es: "+
                                        perfilrecetas[idperfilreceta]
                                            .EstadoReceta,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: 700,
                                height: 50,
                                child: Text(
                                    perfilrecetas[idperfilreceta].Observacion),
                              ),

                              SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Volver al listado',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white))),
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
