
import 'package:battleship/punto.dart';

enum TiposBarcos {bote,lancha,submarino,crucero,portaaviones}
enum DireccionesHacia {arriba,abajo,izquierda,derecha}
class Barco {
  final TiposBarcos tipo;
  final DireccionesHacia direccion;
  final Punto puntoinicial;

  Barco({
    required this.tipo,
    required this.puntoinicial,
    required this.direccion,
  });
}

class Flotilla {
  final List<Barco> _barcos;
  

  List<Barco> get barcos => List.unmodifiable(_barcos); 

  int get cantidad => _barcos.length;

  Flotilla(this._barcos) {
    if (_barcos.length != 5) throw FlotillaCantidadExcepcion();
    if (_barcos.map((e) => e.tipo).toSet().length < 5) throw FlotillaTipos();
  }
}


  

  get barcos => null;


class FlotillaCantidadExcepcion extends Error{}
class FlotillaTipos extends Error{}


