import 'dart:io';

err404(HttpResponse response) {
  response.statusCode = HttpStatus.NOT_FOUND;
  response.outputStream.writeString("Pagina non trovata");
  response.outputStream.close();
}

avviaServer(String basePath) {
  var server = new HttpServer();
  String host = '127.0.0.1';
  int port = 8080;
  server.listen(host,port);

  log("Server in ascolto all'indirizzo http://${host}:${port}");
  server.defaultRequestHandler = (HttpRequest request, HttpResponse response) {
    log('${new Date.now()} ${request.method} ${request.uri}');
    final String path = request.path == '/' ? '/index.html' : request.path;
    final File file = new File('${basePath}${path}');
    file.exists().then((bool trovato) {
      if (trovato) {
        file.fullPath().then((String fullPath) {
          if (!fullPath.startsWith(basePath)) {
            err404(response);
          } else {
            file.openInputStream().pipe(response.outputStream);
          }
        });
      } else {
        err404(response);
      }
    });
  };
}

log(msg){
  var script = new File(new Options().script);
  File logFile = new File('${script.directorySync().path}/log.txt');
  OutputStream output;
  output = logFile.openOutputStream(FileMode.APPEND);
  output.writeString('$msg \n');
}

main() {
  Directory dir = new Directory.current();
  avviaServer(dir.path);
}