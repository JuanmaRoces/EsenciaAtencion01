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
}