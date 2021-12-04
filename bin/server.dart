import 'dart:io';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

import 'router.dart';

void main() async {
  // For Google Cloud Run, we respect the PORT environment variable
  var portStr = Platform.environment['PORT'] ?? '8080';
  var port = int.tryParse(portStr);

  final cascade = shelf.Cascade()
      // Serve the files from public dir
      .add(_staticHandler)
      // Add the app routes
      .add(AppRoutes().routes());

  final server = await io.serve(
    shelf.logRequests().addHandler(cascade.handler),
    InternetAddress.anyIPv4,
    port!,
  );

  print('Serving at http://${server.address.host}:${server.port}');
}

// Serving static files.
final _staticHandler = shelf_static.createStaticHandler(
  'public',
  defaultDocument: 'index.html',
);
