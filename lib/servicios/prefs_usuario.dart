import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUsuario {
  static final PrefsUsuario _singleton = PrefsUsuario._();
  SharedPreferences _prefs;
  factory PrefsUsuario() {
    return _singleton;
  }
  PrefsUsuario._();
  Future initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }
  void marcarTemaLeido(int nro) {
    _prefs.setBool(nro.toString(), true);
  }
  bool seHaLeido(int nro) {
    return _prefs.getBool(nro.toString())?? false;
  }
  void cambiaEstado(int nro) {
    _prefs.setBool(nro.toString(), !seHaLeido(nro));
  }
  void mensajeNuevoCatalogo() {
    _prefs.setBool('NuevoCatalogo', true);
  }
  bool nuevoCatalogo() {
    return _prefs.getBool('NuevoCatalogo');
  }
  void mensajeLeido() {
    _prefs.setBool('NuevoCatalogo', false);
  }
}

class EstadoService with ChangeNotifier {
  bool _nuevo;
  set nuevo(valor) {
    _nuevo = valor;
    notifyListeners();
  }
  bool get nuevo => _nuevo;
}

// class MessageService with ChangeNotifier {
//   String _titulo;
//   String _texto;
//   String _url;
//   String get titulo => _titulo;
//   set titulo(valor) {
//     _titulo = valor;
//     notifyListeners();
//   }
//   String get texto => _texto;
//   set texto(valor) {
//     _texto = valor;
//     notifyListeners();
//   }
//   String get url => _url;
//   set url(valor) {
//     _url = valor;
//     notifyListeners();
//   }
// }