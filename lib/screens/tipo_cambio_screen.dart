import 'package:flutter/material.dart';
import 'package:tipo_cambio_app/components/mi_boton.dart';
import 'package:tipo_cambio_app/screens/home_screen.dart';
import 'package:tipo_cambio_app/services/sunat_service.dart';

class TipoCambioScreen extends StatefulWidget {
  @override
  _TipoCambioScreenState createState() => _TipoCambioScreenState();
}

class _TipoCambioScreenState extends State<TipoCambioScreen> {
  DateTime hoy = DateTime.now();
  DateTime selectedDate = DateTime.now();
  String tipoCambioCompra;
  String tipoCambioVenta;
  SunatService _sunatService = new SunatService();

  String selectedDateAsString;

  @override
  void initState() {
    super.initState();
    //traerTipoCambio();
  }

  void traerTipoCambio() async {
    var tc = await _sunatService.getTipoCambio(selectedDateAsString);
    print('Data obtenida al cargar pantalla: $tc');
    setState(() {
      tipoCambioCompra = tc.compra;
      tipoCambioVenta = tc.venta;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 8, 15),
        lastDate: DateTime(hoy.year, hoy.month, hoy.day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        selectedDateAsString = selectedDate.toString().substring(0, 10);
        print('fecha Seleccionada: $selectedDateAsString');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TuCambioPe'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'dollar',
                child: Image.asset(
                  'imgs/dollar.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 64,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Ingrese Fecha:'),
                  Text(selectedDateAsString ?? '-->'),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Icon(
                      Icons.calendar_today,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              MiBoton(texto: 'Consultar', onTap: traerTipoCambio),
              SizedBox(
                height: 16,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Compra: ' + (tipoCambioCompra ?? ''),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Venta: ' + (tipoCambioVenta ?? ''),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
