import 'package:battleship/flotilla.dart';
import 'package:test/test.dart';
import 'package:battleship/punto.dart';  

void main() {
  test('cuando creo una flotilla con menos de 5 tipos de barcos lanza FlotillaCantidadExcepcion', () {
    expect(
      () => Flotilla([
        Barco(tipo: TiposBarcos.bote, puntoinicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.arriba),
        Barco(tipo: TiposBarcos.crucero, puntoinicial: Punto(columna: 1, fila: 1), direccion: DireccionesHacia.abajo),
      ]),
      throwsA(isA<FlotillaCantidadExcepcion>()),
    );
  });

  test('flotilla con tipos de barcos repetidos lanza FlotillaTipos', () {
    expect(
      () => Flotilla([
        Barco(tipo: TiposBarcos.bote, puntoinicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.arriba),
        Barco(tipo: TiposBarcos.bote, puntoinicial: Punto(columna: 1, fila: 1), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.submarino, puntoinicial: Punto(columna: 2, fila: 2), direccion: DireccionesHacia.arriba),
        Barco(tipo: TiposBarcos.crucero, puntoinicial: Punto(columna: 3, fila: 3), direccion: DireccionesHacia.abajo),
        Barco(tipo: TiposBarcos.portaaviones, puntoinicial: Punto(columna: 4, fila: 4), direccion: DireccionesHacia.derecha),
      ]),
      throwsA(isA<FlotillaTipos>()),
    );
  });

  test('los barcos están pegados en la lista si son consecutivos', () {
    final flotilla = Flotilla([
      Barco(tipo: TiposBarcos.bote, puntoinicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.arriba),
      Barco(tipo: TiposBarcos.lancha, puntoinicial: Punto(columna: 1, fila: 0), direccion: DireccionesHacia.abajo),
      Barco(tipo: TiposBarcos.submarino, puntoinicial: Punto(columna: 2, fila: 0), direccion: DireccionesHacia.derecha),
      Barco(tipo: TiposBarcos.crucero, puntoinicial: Punto(columna: 3, fila: 0), direccion: DireccionesHacia.arriba),
      Barco(tipo: TiposBarcos.portaaviones, puntoinicial: Punto(columna: 4, fila: 0), direccion: DireccionesHacia.abajo),
    ]);

    // Consideramos "pegados" si están uno al lado del otro en la lista
    bool estanPegados(int i, int j) => (j - i).abs() == 1;

    expect(estanPegados(0, 1), isTrue); // bote y lancha están pegados
    expect(estanPegados(1, 3), isFalse); // lancha y crucero no están pegados
  });
}

