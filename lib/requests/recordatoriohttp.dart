import 'package:http/http.dart' as http;
import 'package:clinica/requests/configurl.dart';

void AdicionarRecordatorio(
  String Nombre,
  String Hora,
  String Observacion,
  String Recordarme,
) async {
  var url = Uri.parse(Url + "AddDataRecordatorio.php");

  await http.post(url, body: {
    'Nombre': Nombre,
    'Hora': Hora,
    'Observacion': Observacion,
    'Recordarme': Recordarme,
  });
}
