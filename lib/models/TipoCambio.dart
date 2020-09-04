class TipoCambio {
  String fecha;
  String compra;
  String venta;

  TipoCambio({this.fecha, this.compra, this.venta});

  @override
  String toString() {
    return 'TipoCambio{fecha: $fecha, compra: $compra, venta: $venta}';
  }
}
