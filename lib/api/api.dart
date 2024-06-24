import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:healthbot/utils/utils.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // final String baseUrl = 'http://127.0.0.1:8000';
  final String baseUrl = 'https://healthbot-api-production.up.railway.app';

  Future<Map<String, dynamic>> getPrediction(List<int> symptoms) async {
    try {
      final response = await Future.delayed(
        const Duration(seconds: 1),
        () => http
            .post(
              Uri.parse('$baseUrl/predict'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                'symptoms': symptoms,
              }),
            )
            .timeout(const Duration(seconds: 8)),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load prediction');
      }
    } on TimeoutException catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
