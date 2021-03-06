import 'package:esencia_de_atencion_01/pages/menu_lateral.dart';
import 'package:esencia_de_atencion_01/pages/modulo_page.dart';
import 'package:esencia_de_atencion_01/servicios/audio.dart';
import 'package:esencia_de_atencion_01/servicios/contenido.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    // final prov = Provider.of<AudioService>(context);
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text('Menú'),
      ),
      */
      drawer: MenuLateral(),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  PortadaCard(),
                  CursoCard(modulos[0]),
                  CursoCard(modulos[1]),
                  CursoCard(modulos[2]),
                  CreditosCard(),
                ],
              ),
            ),
          ),
          // Controles de audio
          Positioned(
            top: 30,
            child: Container(
              width: ancho,
              height: alto*0.30,
              // child: prov.controles,
              child: ControlAudio(),
            ),
          )
          /*
          Positioned(
            top: alto*0.03,
            child: Transform.scale(
              scale: 0.9,
              origin: Offset(0, -100.0),
              child: Container(
                // color: Colors.red,
                width: ancho,
                height: alto*0.30,
                child: ControlAudio(),
              ),
            ),
          ),
          */
        ],
      )
    );
  }
}

class PortadaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ancho*0.05, vertical: alto*0.01),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(alto*0.03)),
        elevation: alto*0.005,
        child: Column(
          children: <Widget>[
            SizedBox(width: double.infinity, height: alto*0.01,),
            Image(image: AssetImage('assets/logo-esencia.jpg'),
              height: alto*0.05,
              width: ancho*0.9,
              // fit: BoxFit.cover,
            ),
            SizedBox(width: double.infinity, height: alto*0.01,),
            Text('Módulos y prácticas de Mindfulness',
              style: TextStyle(fontSize: ancho*0.03, fontWeight: FontWeight.bold),
            ),
            Text('Practica la satisfacción en tu vida',
              style: TextStyle(fontSize: ancho*0.03),
            ),
            Text('https://esenciadeatencion.com',
              style: TextStyle(fontSize: ancho*0.03, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8), 
              child: Text('Cambia la inquietud y el sufrimiento por la satisfacción '
                'con mis propuestas de Mindfulness, atención consciente y '
                'desarrollo personal.\n'
                'Aquí encontrarás 22 audios que te ayudarán en ese proyecto.',
                style: TextStyle(fontSize: ancho*0.03),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CursoCard extends StatelessWidget {
  final Modulo curso;
  // final Audicion tema;
  CursoCard(this.curso);
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    // final Modulo curso = modulos[tema.idModulo];
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ancho*0.05, vertical: alto*0.01),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(alto*0.03)),
          elevation: alto*0.005,
          child: Column(
            children: <Widget>[
              Hero(
                tag: curso.id,
                child: Image(
                  image: AssetImage(curso.pathImg),
                  height: alto*0.3,
                  width: ancho*0.9,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(curso.titulo, 
                  style: TextStyle(fontSize: ancho*0.06, fontWeight: FontWeight.bold),
                ),
              ),   
              Divider(),  
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Text(curso.subtitulo, 
                  style: TextStyle(fontSize: ancho*0.03),
                ),
              ),   
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'modulo', arguments: Argumentos(curso));
      },
    );
  }
}

class CreditosCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ancho*0.05, vertical: alto*0.01),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(alto*0.03)),
        elevation: alto*0.005,
        child: Column(
          children: <Widget>[
            SizedBox(width: double.infinity, height: alto*0.01,),
            Image(image: AssetImage('assets/roces-it.png'),
              height: alto*0.05,
              width: ancho*0.9,
              // fit: BoxFit.cover,
            ),
            SizedBox(width: double.infinity, height: alto*0.01,),
            Text('https://www.rocesit.com',
              style: TextStyle(fontSize: ancho*0.03, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
