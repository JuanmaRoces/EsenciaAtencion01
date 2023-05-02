import 'package:esencia_de_atencion_01/pages/biblioteca.dart';
import 'package:esencia_de_atencion_01/pages/menu_page.dart';
import 'package:esencia_de_atencion_01/pages/modulo_page.dart';
import 'package:esencia_de_atencion_01/servicios/audio.dart';
import 'package:esencia_de_atencion_01/servicios/notificaciones.dart';
import 'package:esencia_de_atencion_01/servicios/prefs_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() async {
  final prefs = new PrefsUsuario();
  // final push = new PushNotif();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await push.initNotif();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AudioService>(create: (_) => AudioService()),
      ],
      child: MyApp()
    ),
  );
}



class MyApp extends StatelessWidget  {
  @override
  Widget build (BuildContext contex) {
    return OKToast(
      child: Builder(
        builder: (BuildContext context) {
          // final push = new PushNotif();
          // push.initNotif();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Título',
            initialRoute: 'menu',
            onGenerateRoute: (RouteSettings settings) {
              var routes = <String, WidgetBuilder>{
                'menu': (ctx) => MenuPage(),
                'modulo': (ctx) => ModuloPage2(settings.arguments),
                'catalogo': (ctx) => Catalogo(),
              };
              WidgetBuilder builder = routes[settings.name];
              return MaterialPageRoute(builder: (ctx) => builder(ctx));
            },
            /*
            initialRoute: 'menu',
            routes: {
              'menu': (BuildContext context) => MenuPage(),
              'modulo': (BuildContext context) => ModuloPage2(),
            },
            */

          );
        }
      ),
    );
  }
}