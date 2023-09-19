// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<dynamic> invokeChatGPT(
  String apiKey,
  List<dynamic> messages,
) async {
  final data = {
    'messages': messages,
    'model': "gpt-3.5-turbo-0613",
  };

  final headers = {
    'Authorization': 'Bearer ' + apiKey,
    'Content-Type': 'application/json',
  };

  final request = http.Request(
    'POST',
    Uri.parse('https://api.openai.com/v1/chat/completions'),
  );
  request.body = json.encode(data);
  request.headers.addAll(headers);

  final httpResponse = await request.send();

  if (httpResponse.statusCode == 200) {
    final jsonResponse = json.decode(await httpResponse.stream.bytesToString());

    return jsonResponse;
  } else {
    print(httpResponse.reasonPhrase);
    return {};
  }
}
