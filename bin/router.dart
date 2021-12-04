import 'package:shelf_router/shelf_router.dart' as shelf_router;

import 'handler.dart';

class AppRoutes {
  shelf_router.Router routes() {
    final handler = AppHandlers();

    return shelf_router.Router()
      ..get('/helloworld', handler.helloWorld)
      ..get('/reqInfo', handler.reqInfo)
      ..post('/postName', handler.postRequest);
  }
}
