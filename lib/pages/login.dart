import 'dart:convert';
import 'dart:math';
import 'package:clinica/pages/recetaview.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:clinica/requests/configurl.dart';

void main() => runApp(LoginApp());
String? usuario;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LogIn',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        //  '/menuadministrador': (BuildContext context) => new MenuAdministrador(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController Usuario = new TextEditingController();
  TextEditingController Pass = new TextEditingController();

  var mensaje = '';

  Future<List> _login() async {
    final response = await http.post(Uri.parse(Url + 'Login.php'), body: {
      "Usuario": Usuario.text,
      "Pass": Pass.text,
    });

    var jsonlogin = json.decode(response.body);

    if (jsonlogin.length == 0) {
      setState(() {
        mensaje = "¡Usuario o contraseña incorrecta!";
      });
    } else {
      if (jsonlogin[0]['TipoUsuario'] == 'Administrador') {
        Navigator.pushReplacementNamed(context, '/menuadministrador');
      } else if (jsonlogin[0]['TipoUsuario'] == 'Paciente') {
        String IdUsuario = jsonlogin[0]['Identificacion'];
        String NameUsuario = jsonlogin[0]['Usuario'];
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BusquedaRecetas(
              idUsuario: IdUsuario, nameUsuario: NameUsuario);
        }));
      }
    }

    return jsonlogin;
  }

  /* Future<void> guardar_datos(Identificacion, Usuario, TipoUsuario, Pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Identificacion', Identificacion);
    await prefs.setString('Usuario', Usuario);
    await prefs.setString('TipoUsuario', TipoUsuario);
    await prefs.setString('Pass', Pass);
  }

  String? IdentificacionVar;
  String? UsuarioVar;
  String? TipoUsuarioVar;
  String? PassVar;

  Future<void> mostrar_datos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    IdentificacionVar = await prefs.getString('Identificacion');
    UsuarioVar = await prefs.getString('Usuario');
    TipoUsuarioVar = await prefs.getString('TipoUsuario');
    PassVar = await prefs.getString('Pass');
    print(IdentificacionVar);
    if (IdentificacionVar != '') {
      if (IdentificacionVar != null) {
        Navigator.pushReplacementNamed(context, '/menuadministrador');
      }
    }
  }
  @override
  void initState() {
    super.initState();
   // mostrar_datos();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://st1.uvnimg.com/dc/2b/dced53c345a598e275cde9113899/medicina-web3.jpg'),
                  fit: BoxFit.cover)),
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 50),
              Card(
                elevation: 0,
                color: Colors.white,
                margin: EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.all(16.0),
                  child: Form(
                      child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: LogoApp(),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Iniciar sesión en",
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "MediClaim",
                          style: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: Usuario,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.person),
                              labelText: 'Usuario',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  Usuario.clear();
                                },
                              )
                              //probar suffix
                              ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: Pass,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              icon: Icon(Icons.lock),
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0)),
                              suffix: GestureDetector(
                                child: Icon(Icons.close),
                                onTap: () {
                                  Pass.clear();
                                },
                              )),
                        ),
                        SizedBox(height: 15),
                        /*  ElevatedButton(
                          onPressed: () {
                            if (Usuario.text.isNotEmpty &&
                                Pass.text.isNotEmpty) {
                              _login();
                            } else {
                              cajaerror(
                                  context, 'Todos los campos son obligatorios');
                            }
                          },
                          child: Text('Iniciar Sesión',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black)),
                        ),*/
                        ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0)),
                          child: RaisedButton(
                            onPressed: () {
                              if (Usuario.text.isNotEmpty &&
                                  Pass.text.isNotEmpty) {
                                _login();
                              } else {
                                cajaerror(context,
                                    'Todos los campos son obligatorios');
                              }
                            },
                            child: SizedBox(
                              width: 250,
                              height: 40,
                              child: Center(
                                child: Text("Iniciar Sesión",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "¿Olvidó su contraseña?",
                          style: TextStyle(fontSize: 15.0, color: Colors.blue),
                        ),
                        Text(
                          mensaje,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
            ],
          )),
    );
  }

  Future<dynamic> cajaerror(BuildContext context, String user) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Error al iniciar sesión'),
              content: Text('$user'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginApp()),
                      );
                    },
                    child: Text(
                      'Aceptar',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ));
  }

  Widget LogoApp() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 5, constraints.maxWidth / 5);
        return Center(
          child: CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(
              "https://scontent.fbaq8-1.fna.fbcdn.net/v/t1.15752-9/fr/cp0/e15/q65/206607291_426492431652148_3815552429703026363_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=58c789&efg=eyJpIjoidCJ9&_nc_ohc=j6067QrDqc8AX8VitGe&tn=teuR1qKioX3N703a&_nc_ht=scontent.fbaq8-1.fna&oh=aa3d3a6dae7679e865935a935fd90286&oe=61458E11",
            ),
          ),
        );
      },
    );
  }
}
