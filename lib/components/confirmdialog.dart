import 'package:flutter/material.dart';

//Retorna apenas true or false
//Usage: ConfirmDialog('Apagar transferência?').actionConfirm(context).then((apagar) => _removerLista(apagar, indice));
class ConfirmDialog {

  final String _dialogTitle;

  ConfirmDialog(this._dialogTitle);

  Future<bool> actionConfirm(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true, //se fecha ou nao com clique fora do alert
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_dialogTitle),
          titlePadding: EdgeInsets.all(16),
          // content: SingleChildScrollView(
          //   child: ListBody(
          //     children: <Widget>[
          //       Text('Confirmar'),
          //     ],
          //   ),
          // ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                color: Colors.green[900],
                child: Text('Cancelar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              RaisedButton(
                color: Colors.red[900],
                child: Text('Apagar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
