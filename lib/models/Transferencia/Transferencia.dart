class Transferencia {
  final double valor;
  final int numeroconta;

  @override
  String toString() {
    return 'Transferencia { valor $valor na conta $numeroconta }';
  }

  Transferencia(this.numeroconta, this.valor);
}
