import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  List<TextEditingController> textFieldController = [
    TextEditingController(text: ''), //user
    TextEditingController(text: ''), //pwd
  ];
  @override
  Widget build(BuildContext context) {
    getConf();
    return Scaffold(
        appBar: AppBar(title: Text("Configurazione")),
        body: Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Column(children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'ID utente', contentPadding: EdgeInsets.all(5)),
                controller: this.textFieldController[0],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  contentPadding: EdgeInsets.all(5),
                ),
                obscureText: true,
                controller: this.textFieldController[1],
              ),
              Row(children: [
                Spacer(),
                MaterialButton(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Salva '), Icon(Icons.save)]),
                  onPressed: () {
                    saveConf();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Theme.of(context).primaryColor,
                ),
                Spacer()
              ])
            ])));
  }

  saveConf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', this.textFieldController[0].text);
    prefs.setString('pwd', this.textFieldController[1].text);
  }

  getConf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.textFieldController[0].text = prefs.getString('pwd') ?? '';
    this.textFieldController[1].text = prefs.getString('user') ?? '';
  }
}
