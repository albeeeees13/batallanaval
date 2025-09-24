import 'dart:math';

class Punto { 
  final int columna;
  final int fila;

  Punto({required this.columna, required this.fila});



int distancia (Punto otro) {
  int dcolumna = columna - otro.columna;
  int dfila = fila - otro.fila;
  num hipo =  pow(dcolumna, 2) + pow(dfila, 2);
  num raiz = sqrt(hipo);
  
  return raiz.toInt();  



}


}