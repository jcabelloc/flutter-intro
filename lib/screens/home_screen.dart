import 'package:flutter/material.dart';
import 'package:tipo_cambio_app/screens/tipo_cambio_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TuCambioPe')),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'imgs/dollar.png',
                scale: 0.5,
              ),
              SizedBox(
                height: 36,
                width: double.infinity,
              ),
              Text(
                'Bienvenidos a \n TuCambioPe!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 36,
                width: double.infinity,
              ),
              RaisedButton(
                child: Text(
                  'Ingresa',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TipoCambioScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
