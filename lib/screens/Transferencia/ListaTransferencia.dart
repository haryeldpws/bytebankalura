import 'package:bytebank/components/confirmdialog.dart';
import 'package:bytebank/models/Transferencia/Transferencia.dart';
import 'package:flutter/material.dart';
import 'FormularioTransferencia.dart';

const String _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          return GestureDetector(
            child: ItemTransferencia(widget._transferencias[indice]),
            onTap: () {
              ConfirmDialog('Apagar transferência?').actionConfirm(context).then((apagar) => _removerLista(apagar, indice));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FormularioTransferencia()))
              .then((transferencia) => _atualizar(transferencia));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualizar(Transferencia transferencia) {
    if (transferencia != null && transferencia is Transferencia) {
      setState(() {
        widget._transferencias.add(transferencia);
      });
    }
  }

  void _removerLista(remover, int indice) {
    setState(() {
      if (remover != null && remover) {
        widget._transferencias.removeAt(indice);
      }
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroconta.toString()),
      ),
    );
  }
}