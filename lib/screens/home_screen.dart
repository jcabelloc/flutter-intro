import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tipo_cambio_app/components/mi_boton.dart';
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
              Hero(
                tag: 'dollar',
                child: Image.asset(
                  'imgs/dollar.png',
                  scale: 0.5,
                ),
              ),
              SizedBox(
                height: 36,
                width: double.infinity,
              ),
              SizedBox(
                width: 250.0,
                child: ScaleAnimatedTextKit(
                    repeatForever: true,
                    scalingFactor: 2,
                    onTap: () {
                      print("Tap Event");
                    },
                    text: ["Bienvenidos a TuCambioPe", "Soles / Dolares"],
                    textStyle: TextStyle(
                      fontSize: 24.0,
                      fontFamily: "Canterbury",
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ),
              /*
              Text(
                'Bienvenidos a \n TuCambioPe!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),*/
              SizedBox(
                height: 36,
                width: double.infinity,
              ),
              MiBoton(
                texto: 'Ingresar',
                onTap: () {
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
