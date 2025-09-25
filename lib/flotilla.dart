
import 'package:battleship/elemento.dart';
import 'package:battleship/punto.dart';

enum TiposBarcos {bote,lancha,submarino,crucero,portaaviones}
enum DireccionesHacia {arriba,abajo,izquierda,derecha}
class Barco {
  final TiposBarcos tipo;
  final DireccionesHacia direccion;
  final Punto puntoinicial;
  final List<Elemento> _elementos = [];

  Barco({
    required this.tipo,
    required this.puntoinicial,
    required this.direccion,
  }) {
int Cuantasveces = MapaTamanos[tipo]!;
int columna = puntoinicial.columna;
int fila = puntoinicial.fila;
while (Cuantasveces > 0) {
  _elementos.add(
    Elemento(
      punto: Punto(columna: columna, fila: fila),
    ),
  );
  columna = columna + dcolumna[direccion]!;
  fila = fila + dfila[direccion]!;
  Cuantasveces--;
}
    
  
  }
}


var MapaTamanos = {
  TiposBarcos.bote: 1,
  TiposBarcos.lancha: 2,
  TiposBarcos.submarino: 3,
  TiposBarcos.crucero: 4,
  TiposBarcos.portaaviones: 5,

};
var dfila = {
  DireccionesHacia.arriba: -1,
  DireccionesHacia.abajo: 1,
  DireccionesHacia.izquierda: 0,
  DireccionesHacia.derecha: 0,
};

var dcolumna = {
  DireccionesHacia.abajo: 0,
  DireccionesHacia.arriba: 0,
  DireccionesHacia.izquierda: 1,
  DireccionesHacia.derecha: -1,
};

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
class FlotillaFueraDelMapa extends Error{}
class FlotillaBarcosSuperpuestos extends Error{}
class FlotillaBarcosNoConsecutivos extends Error{}

