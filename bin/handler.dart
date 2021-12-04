import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'model/post_request_model.dart';
import 'model/response_model.dart';

class AppHandlers {
  AppHandlers();

  Response helloWorld(Request request) {
    return Response.ok('Privet, from DartUP 2021 Conf!!');
  }

  Response reqInfo(Request request) {
    print('Inside reqInfo ✅');

    final reqHeaders = request.headers;

    // CREATING RESPONSE
    final resp = {
      'handlerPath': '${request.handlerPath}',
      'method': '${request.method}',
      'httpProtocol': '${request.protocolVersion}',
      'userAgent': '${reqHeaders['user-agent']}',
      'host': '${reqHeaders['host']}',
    };

    return Response.ok(
      const JsonEncoder.withIndent(' ').convert(resp),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  Future<Response> postRequest(Request request) async {
    print('Inside postRequest ✅');

    final body = await request.readAsString();

    try {
      final requestBody = postRequestModelFromJson(body);

      // ignore: unnecessary_null_comparison
      if (requestBody.name == null || requestBody.name.isEmpty) {
        return Response(
          HttpStatus.badRequest,
          body: 'Please provide name',
        );
      }

      final responseBody = ResponseModel(
        message: 'Privet ${requestBody.name}! from DartUP 2021 Conf!!',
      );

      return Response.ok(
        responseModelToJson(responseBody),
        headers: {
          'content-type': 'application/json',
        },
      );
    } catch (e) {
      print('Error in postRequest ${e.toString()}');

      return Response.internalServerError(
        body: 'Something went wrong. Please try again.',
      );
    }
  }
}
