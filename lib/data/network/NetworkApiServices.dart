import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:myapp/data/app_excaptions.dart';
import 'package:myapp/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet COnnection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet COnnection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExpection(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException('Error while communicating with server' +
            'with status code' +
            response.statusCode.toString());
    }
  }
}
