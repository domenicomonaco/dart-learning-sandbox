import 'package:http/http.dart' as http;
import 'dart:io';

/**
 * Read, save and provide output to HttpClient with external source.
 **/

main(){
  http.read("http://www.google.com/").then(print);

    HttpServer.bind('127.0.0.1', 9999).then((server) {
      server.listen((HttpRequest request) {
          http.read("http://m.google.it/").then(
          (String test){
            request.response.write(test);
            request.response.close();
          
     });
      
    });
  });
}