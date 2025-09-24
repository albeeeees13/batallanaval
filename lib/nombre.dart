class Nombre {
  final String candidato;

  Nombre(String valor) : candidato = _validar(valor);

  static String _validar(String valor) {
    if (valor.length < longitudMinima) {
      throw LongitudMinimaExcepcion();
    }
    if (valor.length > longitudMaxima) {
      throw LongitudMaximaExcepcion();
    }

    final regex = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$');
    if (!regex.hasMatch(valor)) {
      throw CaracterInvalidoExcepcion();
    }

    return valor;
  }
}

const int longitudMinima = 5;
const int longitudMaxima = 15;

class LongitudMinimaExcepcion extends Error {}
class LongitudMaximaExcepcion extends Error {}
class CaracterInvalidoExcepcion extends Error {}
