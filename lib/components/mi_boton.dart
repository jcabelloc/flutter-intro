import 'package:flutter/material.dart';

class MiBoton extends StatelessWidget {
  Function onTap;
  String texto;
  MiBoton({@required this.texto, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Container(
        width: double.infinity,
        child: RawMaterialButton(
          child: Text(
            texto,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: onTap,
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
