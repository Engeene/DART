import 'dart:math';

class Punto{
  num x,y;
  String etichetta;
  Punto(this.etichetta, this.x, this.y);

  num distanza(Punto secondo){
    return sqrt(((x - secondo.x)*(x - secondo.x)) + ((y - secondo.y)*(y - secondo.y)));
  }

  String toString() => 'Le coordinate del punto $etichetta sono: x=$x, y=$y.';
}

void main() {

  Punto a = new Punto('A',15,20);
  Punto b = new Punto('B',35,5);

  print(a);
  print(b);

  print('La distanza fra ${a.etichetta} e ${b.etichetta} è ${a.distanza(b)}.');
}