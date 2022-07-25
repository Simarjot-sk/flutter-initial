import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:zumi_app/data/local/shared_pref_helper.dart';
import 'package:zumi_app/data/remote/endpoints.dart';
import 'package:zumi_app/data/remote/model/response_dto.dart';
import 'package:zumi_app/data/utils/response_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:zumi_app/ui/utils/log_tags.dart';

///calls POST api and returns json decoded http.Response
dynamic _callPostApi(
    final String path,
    final Map<String, dynamic> requestBody, [
      final String? baseUrl,
    ]) async {
  //common headers
  final Map<String, String> header = {
    if (Prefs.isLoggedIn.get())
      'Authorization': "Bearer ${Prefs.authToken.get()}",
    'Content-Type': 'application/json'
  };

  //creating the REST Endpoint Url
  final baseUrlNonNull = baseUrl ?? Endpoints.baseUrl;
  final completeUrl = "$baseUrlNonNull/$path";

  log('>>>calling api: $completeUrl', name: LogTags.apiCall);
  //calling the REST API
  final http.Response res = await http.post(
    Uri.parse(completeUrl),
    body: jsonEncode(requestBody),
    headers: header,
  );
  log(res.body.toString(), name: LogTags.apiCall);
  log('<<<api call completed', name: LogTags.apiCall);

  return jsonDecode(res.body);
}

///calls GET api and returns json decoded http.Response
dynamic _callGetApi(
    final String path,
    final Map<String, String> queryParams, [
      final String? baseUrl,
    ]) async {
  //common headers
  final Map<String, String> header = {
    if (Prefs.isLoggedIn.get())
      'Authorization': "Bearer ${Prefs.authToken.get()}",
    'Content-Type': 'application/json'
  };

  //creating the REST Endpoint Url
  final uri = Uri(
    scheme: 'https',
    host: baseUrl ?? Endpoints.authority,
    path: '${Endpoints.path}/$path',
    queryParameters: queryParams,
  );

  log('>>>calling api: $uri', name: LogTags.apiCall);
  //calling the REST API
  final http.Response res = await http.get(
    uri,
    headers: header,
  );
  log(res.body.toString(), name: LogTags.apiCall);
  log('<<<api call completed', name: LogTags.apiCall);

  return jsonDecode(res.body);
}

///Sends a POST request to [path].
///
///
Future<ResponseDto<DATA>> httpPost<DATA>(
  final String path,
  final Map<String, dynamic> requestBody, [
  final String? baseUrl,
]) async {
  final response = await _callPostApi(path, requestBody, baseUrl);
  return parseResponseDto<DATA>(response);
}

Future<ResponseDto<BuiltList<DATA>>> httpPostList<DATA>(
  final String path,
  final Map<String, dynamic> requestBody, [
  final String? baseUrl,
]) async {
  final response = await _callPostApi(path, requestBody, baseUrl);
  return parseResponseList<DATA>(response);
}

Future<ResponseDto<T>> httpGet<T>(
  final String path,
  final Map<String, String> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callGetApi(path, queryParams, baseUrl);
  return parseResponseDto<T>(response);
}

Future<ResponseDto<BuiltList<T>>> httpGetList<T>(
  final String path,
  final Map<String, String> queryParams, [
  final String? baseUrl,
]) async {
  final response = await _callGetApi(path, queryParams, baseUrl);
  return parseResponseList<T>(response);
}
