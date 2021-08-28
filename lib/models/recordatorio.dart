class Recordatorio {

  final String Nombre;
  final String Hora;
  final String Observacion;
  final String Recordarme;
  final String Foto;


  Recordatorio({
    required this.Nombre,
    required this.Hora,
    required this.Observacion,
    required this.Recordarme,
    required this.Foto,

  });

  factory Recordatorio.fromJson(Map<String, dynamic> json) {
    return Recordatorio(
      Nombre: json['Nombre'],
      Hora: json['Hora'],
      Observacion: json['Observacion'],
      Recordarme: json['Recordarme'],
      Foto: json['Foto'],

    );
  }
}
