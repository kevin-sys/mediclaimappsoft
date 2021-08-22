class Receta {
  final String CodigoReceta;
  final String NombresPaciente;
  final String ApellidosPaciente;
  final String IdentificacionPaciente;
  final String CodigoMedicamento1;
  final String NombreMedicamento1;
  final String CantidadMedicamento1;
  final String CodigoMedicamento2;
  final String NombreMedicamento2;
  final String CantidadMedicamento2;
  final String CodigoMedicamento3;
  final String NombreMedicamento3;
  final String CantidadMedicamento3;
  final String Disponible1;
  final String Disponible2;
  final String Disponible3;
  final String HoraConsumo1;
  final String HoraConsumo2;
  final String HoraConsumo3;
  final String Fecha;
  final String TipoAfiliado;
  final String Eps;
  final String CentroAsistencial;
  final String NombreMedico;
  final String EstadoReceta;
  final String Observacion;

  Receta({
    required this.CodigoReceta,
    required this.NombresPaciente,
    required this.ApellidosPaciente,
    required this.IdentificacionPaciente,
    required this.CodigoMedicamento1,
    required this.NombreMedicamento1,
    required this.CantidadMedicamento1,
    required this.CodigoMedicamento2,
    required this.NombreMedicamento2,
    required this.CantidadMedicamento2,
    required this.CodigoMedicamento3,
    required this.NombreMedicamento3,
    required this.CantidadMedicamento3,
    required this.Disponible1,
    required this.Disponible2,
    required this.Disponible3,
    required this.HoraConsumo1,
    required this.HoraConsumo2,
    required this.HoraConsumo3,
    required this.Fecha,
    required this.TipoAfiliado,
    required this.Eps,
    required this.CentroAsistencial,
    required this.NombreMedico,
    required this.EstadoReceta,
    required this.Observacion,

  });

  factory Receta.fromJson(Map<String, dynamic> json) {
    return Receta(
      CodigoReceta: json['CodigoReceta'],
      NombresPaciente: json['NombresPaciente'],
      ApellidosPaciente: json['ApellidosPaciente'],
      IdentificacionPaciente: json['IdentificacionPaciente'],
      CodigoMedicamento1: json['CodigoMedicamento1'],
      NombreMedicamento1: json['NombreMedicamento1'],
      CantidadMedicamento1: json['CantidadMedicamento1'],
      CodigoMedicamento2: json['CodigoMedicamento2'],
      NombreMedicamento2: json['NombreMedicamento2'],
      CantidadMedicamento2: json['CantidadMedicamento2'],
      CodigoMedicamento3: json['CodigoMedicamento3'],
      NombreMedicamento3: json['NombreMedicamento3'],
      CantidadMedicamento3: json['CantidadMedicamento3'],
      Disponible1: json['Disponible1'],
      Disponible2: json['Disponible2'],
      Disponible3: json['Disponible3'],
      HoraConsumo1: json['HoraConsumo1'],
      HoraConsumo2: json['HoraConsumo2'],
      HoraConsumo3: json['HoraConsumo3'],
      Fecha: json['Fecha'],
      TipoAfiliado: json['TipoAfiliado'],
      Eps: json['Eps'],
      CentroAsistencial: json['CentroAsistencial'],
      NombreMedico: json['NombreMedico'],
      EstadoReceta: json['EstadoReceta'],
      Observacion: json['Observacion'],

    );
  }
}
