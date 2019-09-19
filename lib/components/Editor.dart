import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _rotulo;
  final String _hint;
  final IconData icon;
  final Function(String) validator;

  Editor(this._controller, this._rotulo, this._hint, {this.icon, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 18.0),
        validator: validator == null ? null : validator,
        decoration: InputDecoration(
          icon: icon == null ? null : Icon(icon),
          labelText: _rotulo,
          hintText: _hint,
        ),
      ),
    );
  }
}
