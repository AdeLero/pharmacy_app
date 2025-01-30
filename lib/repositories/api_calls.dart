import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pebble_pharmacy/repositories/get_endpoints.dart';

Future<void> registerUser({
  required String name,
  required String phoneNumber,
  required String pin,
  required String role,
}) async {
  try {
    final response = await http.post(
      Uri.parse(EndPoint.register),
      body: jsonEncode({
        'name': name,
        'phone_number': phoneNumber,
        'pin': pin,
        'role': role,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print("✅ User Created: ${data['user']}");
      print("🔑 Token: ${data['token']}");
      return data;
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    throw Exception('Failed to register user');
  }
}
