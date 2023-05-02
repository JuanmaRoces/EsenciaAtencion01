import 'dart:async';

import 'package:esencia_de_atencion_01/pages/menu_page.dart';
import 'package:esencia_de_atencion_01/servicios/prefs_usuario.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class PushNotif {
  static final PushNotif _singleton = new PushNotif._internal();
  // final FirebaseMessaging _fireMess = FirebaseMessaging();
  // final _leerCatalogo = StreamController<bool>.broadcast();
  FirebaseMessaging _fireMess;
  StreamController<bool> _leerCatalogo;
  factory PushNotif() {
    return _singleton;
  }
  PushNotif._internal() {
    _fireMess = FirebaseMessaging();
    _leerCatalogo = StreamController<bool>.broadcast();
  }
  void catalogoLeido() {
    _leerCatalogo.sink.add(false);
  }
  Stream<bool> get leerCatalogo => _leerCatalogo.stream;
  initNotif() async {
    _fireMess.requestNotificationPermissions();
    final _token = await _fireMess.getToken();
    print('TOKEN: $_token');  
    // dukwF95beGI:APA91bEYPWMqrGjXk1hw5Zc38B8V9lUvz9TPa_qkeLz9pcBQQUDlyvHDHpF2uc1QAGlqGcfegC9vH304Tc5e6JhmP7eEcbXI6R3FcC3DTUukL5rIX4K5NGrC8Et7vE6z0xORb7pcuP0Y
    // evLXhvQW7Uw9v2fsb8UjXL:APA91bHXpOU-gPxOsH1S2YQbWzj_8bypr2oQVIzHOVWUXoMiN_m0uQ5Yu3Ex871YTF_2xtpHjSQt8871wftrf-kbGE5S88mzpyIOq1XL4FWe0wtel-6psUhgA8xNjQlvuT3diFzNiRdA
    _fireMess.configure(
      onMessage: (Map<String, dynamic> info) async {
        print('===========ON MESSAGE');
        print(info);
        showToast(
          info['notification']['body'],
        );
        _activaMarcaCatalogo();
      },
      onLaunch: (Map<String, dynamic> info) async {
        print('=========== ON LAUNCH');
        _activaMarcaCatalogo();
      },
      onResume: (Map<String, dynamic> info) async {
        print(info);
        print('============= ON RESUME');
        _activaMarcaCatalogo();
      }
    );
  }
  void dispose() { 
    _leerCatalogo?.close();
  }
  void _activaMarcaCatalogo () {
    final prefs = PrefsUsuario();
    prefs.mensajeNuevoCatalogo();
    _leerCatalogo.sink.add(true);
  }
}


void _procData(dynamic data) {
  String _url;
  if (Platform.isIOS || Platform.isMacOS) {
    _url = data['url_ios'];
  } else if (Platform.isWindows || Platform.isAndroid) {
    _url = data['url_android'];
  }
  _abreNavegador(_url);
}

void _abreNavegador (String url) async {
  // const url = 'http://www.rocesit.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se puede abrir la url: $url';
  }
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