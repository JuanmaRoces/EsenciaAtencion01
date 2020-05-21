import 'package:esencia_de_atencion_01/labs/expansion_tite.dart';
import 'package:esencia_de_atencion_01/pages/menu_lateral.dart';
import 'package:esencia_de_atencion_01/servicios/audio.dart';
import 'package:esencia_de_atencion_01/servicios/contenido.dart';
import 'package:esencia_de_atencion_01/servicios/prefs_usuario.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Argumentos {
  final Modulo modulo;
  final int posic;
  Argumentos(this.modulo, [this.posic]);
}


class ModuloPage2 extends StatelessWidget {
  static int pagInic;
  final Argumentos argumentos;
  ModuloPage2(this.argumentos);
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);
  PageController _controller;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    _controller = _controller ?? new PageController(initialPage: pagInic??0);
    final Modulo modulo = argumentos.modulo;
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _drawerKey,
      drawer: MenuLateral(),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemCount: modulo.temas.length,
            physics: AlwaysScrollableScrollPhysics(),
            controller: _controller,
            itemBuilder: (BuildContext context, int i) {
              return PaginaTema(modulo.temas[i], _drawerKey);
            }
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container (
              padding: EdgeInsets.all(ancho*0.05),
              child: Center (
                child: SmoothPageIndicator(
                  controller: _controller,  // PageController
                  count:  modulo.temas.length,
                  effect:  WormEffect(
                    activeDotColor: Colors.lightBlue,
                  ),  // your preferred effect
                )
                // child: DotsIndicator(
                //   controller: _controller,
                //   itemCount: modulo.temas.length,
                //   onPageSelected: (int page) {
                //     _controller.animateToPage(page, duration: _kDuration, curve: _kCurve);
                //   },
                // )
              )
            )
          ),
          // Controles de audio
          Positioned(
            top: 30,
            child: Container(
              width: ancho,
              height: alto*0.30,
              //child: Provider.of<AudioService>(context).controles,
              child: ControlAudio(),
            ),
          )
        ],
      ),
    );
  }
}

class PaginaTema extends StatelessWidget {
  final Audicion tema;
  final GlobalKey<ScaffoldState> scafKey;
  PaginaTema(this.tema, this.scafKey);
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image(
                height: alto*0.25,
                image: AssetImage(tema.pathImg),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0+alto*0.03,
              left: ancho*0.02,
              child: Text(
                tema.titulo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ancho*0.06,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 10,
                    ),
                  ]
                ),
              )
            ),
            Positioned(
              top: alto*0.03,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, 'menu');
                },
              ),
            ),
            Positioned(
              top: alto*0.03,
              right: ancho*0.00,
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  scafKey.currentState.openDrawer();
                  /*
                  if (scafKey.currentState.isEndDrawerOpen)
                    scafKey.currentState.openDrawer();
                  else
                    scafKey.currentState.openEndDrawer();
                  */
                },
              ),
            ),
          ],
        ),
        Container(
          height: alto*0.6,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ancho*0.05),
                child: Text(tema.subtitulo,
                  style: TextStyle(
                    fontSize: ancho*0.04
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ancho*0.05),
                // child: Text('texto  ñlksad fñlkas dj fñlkasj dfñklasjdfñklas jdfñlkajsdf ñkla jjdfñlka sjdfñlaksd f ñalksd fñaslkdf ñaslkdf ñaslkdf jañslkdfj ñasldkf jñaslkdfj ñaslkdjf ñalskdfj ñaslkdfj ñalksdf jñaslkdf',
                child: Text(tema.descripcion,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Times',
                    fontSize: ancho*0.046,
                  ),
                )
              ),
              Player(tema.pathAudio, tema.titulo, tema.id),
            ],
          ),
        ),
        // SingleChildScrollView(
        //   child: Column(
        //     children: <Widget>[
        //       Text(tema.subtitulo,
        //         style: TextStyle(
        //           fontSize: ancho*0.04
        //         ),
        //       ),
        //       Divider(),
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: ancho*0.05),
        //         child: Text('texto  ñlksad fñlkas dj fñlkasj dfñklasjdfñklas jdfñlkajsdf ñkla jjdfñlka sjdfñlaksd f ñalksd fñaslkdf ñaslkdf ñaslkdf jañslkdfj ñasldkf jñaslkdfj ñaslkdjf ñalskdfj ñaslkdfj ñalksdf jñaslkdf',
        //           textAlign: TextAlign.justify,
        //           style: TextStyle(
        //             fontFamily: 'Times',
        //             fontSize: ancho*0.046,
        //           ),
        //         )
        //       ),
        //       Player(tema.pathAudio, tema.titulo, tema.id),
        //     ],
        //   ),
        // )
      ], 
    );
  }
}

class Player extends StatelessWidget {
  final String audio;
  final String titulo;
  final int id;
  final prefs = PrefsUsuario();
  Player(this.audio, this.titulo, this.id);
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AudioService>(context, listen: false);
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    final temaLeido = prefs.seHaLeido(this.id) ?? false;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ancho*0.05,
        vertical: alto*0.02),
      width: double.infinity,
      color: temaLeido ?
        Colors.grey :
        Colors.lightBlue,
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.play_arrow, color: Colors.white,),
            temaLeido ?
              Text('Repetir audio',
                style: TextStyle(color: Colors.white),
              ) :
              Text('Iniciar audio',
                style: TextStyle(color: Colors.white),
              )
          ],
        ),
        onPressed: (){
          prov.audio = audio;
          // prov.stop();
          prov.titulo = titulo;
          prov.nroTema = id;
        },
      ),
    );
  }
}

class TituloModulo extends StatelessWidget {
  final Modulo modulo;
  TituloModulo(this.modulo);
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return SliverAppBar(
      elevation: alto*0.005,
      // backgroundColor: Colors.indigoAccent,
      expandedHeight: alto*0.2,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          modulo.titulo, 
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        background: Hero(
          tag: modulo.id,
          child: Image(
            image: AssetImage(modulo.pathImg), 
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.black26,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;


  Widget _buildDot(int index) {
    print(controller.toString());
    // return Container();
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}


// bool isSelected = controller.hasClients ? controller.page == index : controller.initialPage == index;
// Color color = isSelected ? Colors.orange[200] : Colors.orange[100];