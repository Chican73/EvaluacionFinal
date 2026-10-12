import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyDTD-VJPOHmvTe9Fwcqyt9j2IUybFbvcpY';

  Future<String?> login(String email, String password) =>
      _authRequest('/v1/accounts:signInWithPassword', email, password);

  Future<String?> create(String email, String password) =>
      _authRequest('/v1/accounts:signUp', email, password);

  /// Devuelve null si todo salió bien, o el código de error en caso contrario.
  Future<String?> _authRequest(
    String path,
    String email,
    String password,
  ) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    };
    final url = Uri.https(_baseUrl, path, {'key': _firebaseToken});
    try {
      final response = await http
          .post(
            url,
            body: json.encode(authData),
            headers: {'Content-Type': 'application/json'},
          )
          .timeout(const Duration(seconds: 15));
      final Map<String, dynamic> decodeResponse = json.decode(response.body);
      if (decodeResponse.containsKey('idToken')) return null;
      return decodeResponse['error']?['message']?.toString() ??
          'UNKNOWN_ERROR';
    } catch (e) {
      debugPrint('Error de autenticación: $e');
      return 'NETWORK_ERROR';
    }
  }
}
