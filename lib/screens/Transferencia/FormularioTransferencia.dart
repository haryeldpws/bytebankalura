import 'package:bytebank/components/Editor.dart';
import 'package:bytebank/models/Transferencia/Transferencia.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Criando transferência';

const String _rotuloConta = 'Número conta';
const String _hintConta = '0000';

const String _rotuloValor = 'Valor';
const String _hintValor = '0.00';

const String _buttonConfirmar = 'Confirmar';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String _validator(String value) {
  if (value == null || value.isEmpty)
    return 'Digite um valor';
  else
    return null;
}

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
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Editor(
                _controllerNroConta,
                _rotuloConta,
                _hintConta,
                validator: _validator,
              ),
              Editor(
                _controllerValor,
                _rotuloValor,
                _hintValor,
                icon: Icons.monetization_on,
                validator: _validator,
              ),
              RaisedButton(
                child: Text(_buttonConfirmar),
                onPressed: () => _criarTransferencia(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    if (_formKey.currentState.validate()) {
      final int conta = int.tryParse(_controllerNroConta.text);
      final double valor = double.tryParse(_controllerValor.text);

      if (conta != null && valor != null) {
        Transferencia _transfer = Transferencia(conta, valor);
        // Scaffold.of(context).showSnackBar(SnackBar(
        //   content: Text('$_transfer'),
        // ));

        Navigator.pop(context, _transfer);
      }
    }
  }
}
