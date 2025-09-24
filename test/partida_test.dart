import 'package:test/test.dart';
import 'package:battleship/partida.dart';

void main() {
  test('Al crearse debe marcarse creada', () {
    // Arrange
    Partida partida = Partida();
    expect(partida.estado, equals(Estado.creada));
  });
}