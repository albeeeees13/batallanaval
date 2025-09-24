import 'package:test/test.dart';
import 'package:battleship/nombre.dart';

void main() {
  test('debe lanzar LongitudMinimaExcepcion si es demasiado corto', () {
    expect(() => Nombre('a' * 3), throwsA(isA<LongitudMinimaExcepcion>()));
  });

  test('debe lanzar LongitudMaximaExcepcion si es demasiado largo', () {
    expect(() => Nombre('a' * 16), throwsA(isA<LongitudMaximaExcepcion>()));
  });

  test('debe aceptar un nombre con ñ', () {
    expect(() => Nombre('Peñaa'), returnsNormally); // válido con ñ
  });

  test('debe aceptar un nombre con acento', () {
    expect(() => Nombre('Joséa'), returnsNormally);
    expect(() => Nombre('Ángela'), returnsNormally);
  });

  test('debe lanzar CaracterInvalidoExcepcion si tiene caracteres especiales', () {
    expect(() => Nombre('Juan@'), throwsA(isA<CaracterInvalidoExcepcion>()));
    expect(() => Nombre('María!'), throwsA(isA<CaracterInvalidoExcepcion>()));
    expect(() => Nombre('Ana#Luz'), throwsA(isA<CaracterInvalidoExcepcion>()));
  });

  test('debe lanzar CaracterInvalidoExcepcion si tiene espacios', () {
    expect(() => Nombre('José Ángel'), throwsA(isA<CaracterInvalidoExcepcion>()));
  });
}

