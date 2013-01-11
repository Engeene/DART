main() {
  List<String> browsers = ['Chrome', 'Firefox' , 'Opera' , 'Dolphin'];

  // primo modo
  for ( var i = 0 ; i < browsers.length ; i++){
    print('${browsers[i]} ha indice $i');
  }

  // secondo modo
  for ( var browser in browsers ){
    print(browser);
  }

}