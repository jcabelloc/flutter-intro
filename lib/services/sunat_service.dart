import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tipo_cambio_app/models/TipoCambio.dart';

class SunatService {
  Future<TipoCambio> getTipoCambio(String fechaAsString) async {
    try {
      http.Response response =
          (await http.get('https://api.sunat.cloud/cambio/$fechaAsString'));
      if (response.statusCode != 200) {
        // tirar excepcion
      }
      print('response.body: ${response.body}');
      var data = jsonDecode(response.body);
      print('data en el service $data');
      TipoCambio tc = new TipoCambio(
          fecha: fechaAsString,
          compra: data[fechaAsString]['compra'],
          venta: data[fechaAsString]['venta']);
      return tc;
    } catch (e) {
      throw 'No hay TC para la fecha seleccionada';
    }
  }
}
