class Medicamento {
  final String Nombre;
  final String Foto;
  final String Descripcion;
  final String Presentacion;
  final String Tipo;
  final String Laboratorio;
  final String Eficaz;
  final String Confiable;
  final String Seguro;

  Medicamento({
    required this.Nombre,
    required this.Foto,
    required this.Descripcion,
    required this.Presentacion,
    required this.Tipo,
    required this.Laboratorio,
    required this.Eficaz,
    required this.Confiable,
    required this.Seguro,
  });

  factory Medicamento.fromJson(Map<String, dynamic> json) {
    return Medicamento(
      Nombre: json['Nombre'],
      Foto: json['Foto'],
      Descripcion: json['Descripcion'],
      Presentacion: json['Presentacion'],
      Tipo: json['Tipo'],
      Laboratorio: json['Laboratorio'],
      Eficaz: json['Eficaz'],
      Confiable: json['Confiable'],
      Seguro: json['Seguro'],
    );
  }
}
