import 'package:esencia_de_atencion_01/pages/modulo_page.dart';
import 'package:esencia_de_atencion_01/servicios/contenido.dart';
import 'package:esencia_de_atencion_01/servicios/prefs_usuario.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Container(
      width: ancho*0.6,
      child: Drawer(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: modulos.length+2,
          itemBuilder: (BuildContext context, int i) {
            if (i == 0) {
              return  Container(
                height: alto*0.30,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/geni-portada-2.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        offset: Offset.fromDirection(3),
                      )
                    ]
                  ),
                  child: Container(),
                ),
              );
            } else if (i <= modulos.length) {
              return ModuloItem(modulos[i-1]);
            } else {
              return MenuCatalogo();
            }
          }
        ),
      ),
    );
  }
}

class ModuloItem extends StatelessWidget {
  final Modulo mod;
  ModuloItem(this.mod);
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    return ExpansionTile(
      title: Text('${this.mod.titulo}',
        style: TextStyle(fontSize: ancho*0.03),
      ),
      children: mod.temas.map(( tema ) => AudicionItem(tema)).toList(),
    );
  }
}

class MenuCatalogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;
    return ListTile(
      title: Text('Catálogo de aplicaciones',
        style: TextStyle(fontSize: ancho*0.03),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'catalogo');
      },
    );
  }
}

class AudicionItem extends StatefulWidget {
  Audicion aud;
  AudicionItem(this.aud);
  @override
  _AudicionItemState createState() => _AudicionItemState();
}
class _AudicionItemState extends State<AudicionItem> {
  @override
  Widget build(BuildContext context) {
    final Modulo curso = modulos[widget.aud.idModulo];
    final pref = PrefsUsuario();
    final ancho = MediaQuery.of(context).size.width;
    return ListTile(
      title: Text('${widget.aud.titulo}',
        style: TextStyle(fontSize: ancho*0.03),
      ),
      onTap: () {
        ModuloPage2.pagInic = widget.aud.posic;
        Navigator.pushNamed(context, 'modulo', 
        arguments: Argumentos(curso, widget.aud.posic));
      },
      trailing: 
        Checkbox(
          value: pref.seHaLeido(widget.aud.id), 
          onChanged: (_) { 
            setState(() {
              pref.cambiaEstado(widget.aud.id);
            });
          }
        )
    );
  }
}
