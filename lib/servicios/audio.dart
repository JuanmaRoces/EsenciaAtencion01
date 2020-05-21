import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:esencia_de_atencion_01/servicios/prefs_usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:icon_shadow/icon_shadow.dart';

class AudioService with ChangeNotifier {
  String _audio;
  AssetsAudioPlayer _player = new AssetsAudioPlayer();
  bool _sonando = false;
  Duration _duracion;
  Duration _posicion;
  double _avance;
  // ControlAudio _ctrlAudio;
  Widget _ctrlAudio;
  Animacion _controles;
  String titulo;
  int nroTema;

  ////////// Servicio de Audio
  AudioService() {
    _ctrlAudio = new ControlAudio();
    _controles = new Animacion(_ctrlAudio);
    _player.current.listen((onData) {
      _duracion = onData.audio.duration;
      notifyListeners();
    });
    /*
    _player.playlistAudioFinished.listen((onData) {
      print('finalizado $onData');
      _audio = null;
      notifyListeners();
    });
    */
    _player.currentPosition.listen((onData) {
      _posicion = onData;
      _avance = 0;
      if (_posicion != null && _duracion != null)
      _avance = _posicion.inSeconds / _duracion.inSeconds;
      if (_avance > 0.99) {
        final prefs = new PrefsUsuario();
        prefs.marcarTemaLeido(nroTema);
        stop();
      }
      notifyListeners();
    });
  }
  @override
  dispose() {
    _player.dispose();
    super.dispose();
  }
  String get audio => _audio;
  bool get sonando => _sonando;
  bool get enPausa => !_sonando && _audio != null;
  bool get enAudio => _audio != null;
  String get duracion {
    if (_duracion == null)
      return null;
    return _duracion.inMilliseconds == 0 ? '0' : _duracion.toString().substring(2, 7);
  }
  String get posicion {
    if (_posicion == null)
      return null;
    return _posicion.inMilliseconds == 0 ? '0' :_posicion.toString().substring(2, 7);
  }
  double get avance => _avance;
  // Animacion get controles => _controles;
  Widget get controles {
    return _ctrlAudio;
    // if (_sonando) 
    //   return _ctrlAudio;
    // else
    //   return Container();
  }
  void pausa() {
    if (_sonando) {
      _player.pause();
      _sonando = false;
    } else {
      if (_audio != null) {
        _player.play();
        _sonando = true;
      }
    }
    notifyListeners();
  }
  void play() {
    _iniciaAudicion();
  }
  void stop() {
    if (_sonando) {
      _player.stop();
      // _controles.retroceder();
    }
    _sonando = false;
    _audio = null;
    notifyListeners();
  }
  set audio(String valor) {
    _audio = valor;
    _iniciaAudicion();
  }
  void _iniciaAudicion() {
    if (_audio != null) {
      if (_sonando)
        _player.stop();
      // else
      //   _controles.avanzar();
      _player.open(Audio(_audio));
      _sonando = true;
    }
    notifyListeners();
  }
}
//// Animación
class Animacion extends StatefulWidget {
  ControlAudio controlAudio;
  AnimationController ctrl;
  Animation<double> pos;
  Animacion(this.controlAudio);
  void avanzar() {
    this.ctrl.forward();
  }
  void retroceder() {
    ctrl.reverse();
    //ctrl.reset();
  }
  @override
  _AnimacionState createState() => _AnimacionState();
}
class _AnimacionState extends State<Animacion> with SingleTickerProviderStateMixin{
  @override
  void initState() { 
    super.initState();
    widget.ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    widget.ctrl.addListener(() {
      print(widget.ctrl.status);
    });
    widget.pos = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: widget.ctrl, 
      curve: Curves.easeOutQuart)
    );
  }
  @override
  void dispose() { 
    widget.ctrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.ctrl,
      child: widget.controlAudio,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(0, widget.pos.value),
          child: child,
        );
      },
    );
  }
}

////////// Control de Audio
class ControlAudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AudioService>(context);
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    double opaco = 1;
    final stText = TextStyle(
      color: Colors.white,
      fontSize: ancho * 0.03,
      shadows: [
        Shadow(
          color: Colors.black,
          blurRadius: 3,
        ),
      ]
    );
    if (prov == null) {
      // return Container();
      opaco = 0.0;
    } else if (!prov.enAudio) {
        opaco = 0.0;
      //  return Container();
    }
    return AnimatedOpacity(
      opacity: opaco,
      duration: Duration(milliseconds: 800),
      child: Container(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: ancho*0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${prov.posicion}', style: stText,),
                  Expanded(child: Container()),
                  Text('${prov.duracion}', style: stText,),
                ],
              ),
            ),
            Text('${prov.titulo}', style: stText,),
            Transform.scale(
              scale: 0.4,
              child: RoundedProgressBar(
                style: RoundedProgressBarStyle(
                  borderWidth: 0.0,
                  widthShadow: 0.0,
                  ),
                percent: prov.avance*100,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () => prov.pausa(), 
                  icon: prov.enPausa ?
                    IconShadowWidget(Icon(Icons.play_arrow, color: Colors.white,),
                      shadowColor: Colors.black,
                    ) :
                    IconShadowWidget(Icon(Icons.pause, color: Colors.white,),
                      shadowColor: Colors.black,
                    ),
                ),
                IconButton(
                  onPressed: () => prov.stop(), 
                  icon: IconShadowWidget(Icon(Icons.stop, color: Colors.white),
                    shadowColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
