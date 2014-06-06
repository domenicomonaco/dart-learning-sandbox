Writing web servers
dart:io makes it easy to write HTTP servers and clients. To write a simple web server, all you have to do is create an HttpServer and hook up a listener to its stream of HttpRequests.

Here is a simple web server that just answers ‘Hello, world’ to any request.
		
		import 'dart:io';
		
		main() {
		  HttpServer.bind('127.0.0.1', 8080).then((server) {
		    server.listen((HttpRequest request) {
		      request.response.write('Hello, world');
		      request.response.close();
		    });
		  });
		}

Running this application and pointing your browser to ‘http://127.0.0.1:8080’ gives you ‘Hello, world’ as expected.

Let’s add a bit more and actually serve files. The base path for every file that we serve will be the location of the script. If no path is specified in a request we will serve index.html. For a request with a path, we will attempt to find the file and serve it. If the file is not found we will respond with a ‘404 Not Found’ status. We make use of the streaming interface to pipe all the data read from a file directly to the response stream.

			import 'dart:io';
			
			_sendNotFound(HttpResponse response) {
			  response.statusCode = HttpStatus.NOT_FOUND;
			  response.close();
			}
	
	startServer(String basePath) {
	  HttpServer.bind('127.0.0.1', 8080).then((server) {
	    server.listen((HttpRequest request) {
	      final String path = request.uri.toFilePath();
	      // PENDING: Do more security checks here.
	      final String resultPath = path == '/' ? '/index.html' : path;
	      final File file = new File('${basePath}${resultPath}');
	      file.exists().then((bool found) {
	        if (found) {
	          file.openRead()
	              .pipe(request.response)
	              .catchError((e) { });
	        } else {
	          _sendNotFound(request.response);
	        }
	      });
	    });
	  });
	}
	
	main() {
	  // Compute base path for the request based on the location of the
	  // script and then start the server.
	  File script = new File(Platform.script.toFilePath());
	  startServer(script.parent.path);
	}
Writing HTTP clients is very similar to using the HttpClient class.