import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_apps/device_apps.dart';
import 'package:esencia_de_atencion_01/pages/menu_page.dart';
import 'package:esencia_de_atencion_01/servicios/notificaciones.dart';
import 'package:esencia_de_atencion_01/servicios/prefs_usuario.dart';
import 'package:flutter/material.dart';

class AppItem {
  String titulo;
  String descripcion;
  String androidUrl;
  String iosUrl;
  String id;
  bool instalada = false;
  AppItem(this.id, this.titulo, this.descripcion, this.androidUrl, this.iosUrl);
}

/*
final List<AppItem> listaApps = [
  AppItem('com.rocesit.esencia0', 'Esencia 0', 'Primera aplicación', 
    'https://play.google.com/store/apps/details?id=com.rocesit.esencia0',
    'https://apps.apple.com/us/app/esencia-de-atenci%C3%B3n-cap-0/id1515680884?l=es&ls=1'),
  AppItem('com.rocesit.esencia1', 'Esencia 1', 'Segunda aplicación', 
    'https://apple.co/305XGOy',
    'https://apple.co/305XGOy'),
  AppItem('com.rocesit.esencia2', 'Esencia 2', 'Tercera aplicación', 
    'https://play.google.com/store/apps/details?id=com.rocesit.esencia0',
    'https://apps.apple.com/us/app/esencia-de-atenci%C3%B3n-cap-0/id1515680884?l=es&ls=1'),
];
*/

class Record {
  final String codigo;
  final String nombre;
  final String titulo;
  final String subtitulo;
  final String urlAndroid;
  final String ulrIos;
  bool instalada;
  final DocumentReference reference;
  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : codigo = map['codigo'],
        nombre = map['nombre'],
        titulo = map['titulo'],
        subtitulo = map['subtitulo'],
        urlAndroid = map['url_android'],
        ulrIos = map['url_ios'],
        instalada = false 
  {
    DeviceApps.isAppInstalled(codigo).then((value) {
      this.instalada = value;
      print(value);
    });
  }
  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
  // @override
  // String toString() => "Record<$name:$votes>";
}


class Catalogo extends StatelessWidget {
  const Catalogo({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de aplicaciones'),
      ),
      // body: _buildBody(context),
      // body: ListaApps()
      body: ListaApps2()
    );
  }
}

class ListaApps2 extends StatefulWidget {
  ListaApps2({Key key}) : super(key: key);
  @override
  _ListaApps2State createState() => _ListaApps2State();
}
class _ListaApps2State extends State<ListaApps2> {
  @override
  void initState() { 
    super.initState();
    PrefsUsuario().mensajeLeido();
    PushNotif().catalogoLeido();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('apps').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }
}

/*
Widget _buildBody(BuildContext context) {
 return StreamBuilder<QuerySnapshot>(
   stream: Firestore.instance.collection('apps').snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) return LinearProgressIndicator();
     return _buildList(context, snapshot.data.documents);
   },
 );
}
*/

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

Widget _buildListItem(BuildContext context, DocumentSnapshot data)  {
  final record = Record.fromSnapshot(data);
  return Padding(
    key: ValueKey(record.titulo),
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text('${record.titulo}'),
        subtitle: Text('${record.subtitulo}'),
        trailing: FutureBuilder<bool>(
          future: DeviceApps.isAppInstalled(record.codigo),
          builder: (BuildContext context, AsyncSnapshot<bool> data) {
            bool _instal = false;
            if (data.hasData) {
              _instal = data.data;
            }
            return (_instal) 
              ? Icon(Icons.check_box)
              : Icon(Icons.check_box_outline_blank);
          }
        ), 
        // trailing: record.instalada 
        //   ? Icon(Icons.check_box)
        //   : Icon(Icons.check_box_outline_blank),
        //  trailing: Text(record.votes.toString()),
        //  onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)}),       ),
        onTap: () {
          String url;
          if (Platform.isIOS) {
            url = record.ulrIos;
          } else if (Platform.isAndroid) {
            url = record.urlAndroid;
          }
          abreNavegador(url);
        },
      ),
    ),
  );
}

/*
class ListaApps extends StatefulWidget {
  @override
  _ListaAppsState createState() => _ListaAppsState();
}
class _ListaAppsState extends State<ListaApps> {
  @override
  void initState() { 
    super.initState();
    PrefsUsuario().mensajeLeido();
    PushNotif().catalogoLeido();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listaApps.length,
      itemBuilder: (BuildContext context, int index) {
        DeviceApps.isAppInstalled(listaApps[index].id).then((value) {
          setState(() {
            listaApps[index].instalada = value;
          });
        });
        return ListTile(
          title: Text('${listaApps[index].titulo}'),
          subtitle: Text('${listaApps[index].descripcion}'),
          // trailing: _instal ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank),
          trailing: listaApps[index].instalada
            ? Icon(Icons.check_box) 
            : Icon(Icons.check_box_outline_blank),
          onTap: () async {
            String url;
            if (Platform.isIOS) {
              url = listaApps[index].iosUrl;
            } else if (Platform.isAndroid) {
              url = listaApps[index].androidUrl;
            }
            abreNavegador(url);
            // DeviceApps.openApp(listaApps[index].id);
            // print(_instal);
            // List<Application> apps = 
            // await DeviceApps.getInstalledApplications(
            //   onlyAppsWithLaunchIntent: true, includeSystemApps: false
            // );
            // print(apps.toString());
          },
        );
      }
    );
  }
}
*/