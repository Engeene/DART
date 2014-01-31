main() {

  // dichiarazione letterale
  // var dizionario = { 'uno':'one' ; 'due':'two' ; 'tre':'three' } ;

  // costruttore
  Map<String,String> dizionario = new Map();
  dizionario['uno'] = 'one';
  dizionario['due'] = 'two';

  print(dizionario.keys);
  print(dizionario.values);

  for ( var chiave in dizionario.keys ){
    print('La traduzione di $chiave è ${dizionario[chiave]}');
  }

}