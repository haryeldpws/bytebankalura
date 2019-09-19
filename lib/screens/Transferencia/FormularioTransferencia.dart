import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/Transferencia/Transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloConta = 'Número conta';
const _hintConta = '0000';

const _rotuloValor = 'Valor';
const _hintValor = '0.00';

const _buttonConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerNroConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(_controllerNroConta, _rotuloConta, _hintConta),
            Editor(_controllerValor, _rotuloValor, _hintValor,
                icon: Icons.monetization_on),
            RaisedButton(
              child: Text(_buttonConfirmar),
              onPressed: () => _criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int conta = int.tryParse(_controllerNroConta.text);
    final double valor = double.tryParse(_controllerValor.text);

    if (conta != null && valor != null) {
      Transferencia _transfer = Transferencia(conta, valor);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('$_transfer'),
      ));

      Navigator.pop(context, _transfer);
    }
  }
}