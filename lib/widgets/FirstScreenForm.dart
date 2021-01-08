import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class FirstScreenForm extends StatefulWidget {
  String titleText;
  String _formResult;
  var FormOption;
  Function func;

  FirstScreenForm(this.titleText, this._formResult, this.FormOption, this.func);

  @override
  _FirstScreenFormState createState() => _FirstScreenFormState();
}

class _FirstScreenFormState extends State<FirstScreenForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12), 
      child: DropDownFormField(
        titleText: widget.titleText,
        hintText: 'Please choose one',
        value: widget._formResult,
        onSaved: (value) {
          setState(() {
            widget.func(value);
          });
        },
        onChanged: (value) {
          setState(() {
            widget.func(value);
          });
        },
        dataSource: widget.FormOption,
        textField: 'display',
        valueField: 'value',
      ),
    );
  }
}