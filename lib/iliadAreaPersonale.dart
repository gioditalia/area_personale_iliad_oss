import 'package:flutter/material.dart';

import 'package:area_personale_iliad_oss/widget/iliadWebView.dart';
import 'package:area_personale_iliad_oss/widget/configuration.dart';

class AreaPersonale extends StatefulWidget {
  @override
  _AreaPersonaleState createState() => _AreaPersonaleState();
}

class _AreaPersonaleState extends State<AreaPersonale> {
  int _selectedIndex = 0;
  List<Widget> _widget = [IliadWebView(), Configuration()];

  void _changeTab(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widget[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Area Personale"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Configurazione",
            )
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _changeTab,
        ));
  }
}
