import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final geminiAllocationProvider = FutureProvider.family<Map<String, String>, double>((ref, amount) async {
  final geminiModel = ref.watch(geminiModelProvider);
  
  try {
    // Assuming GenerativeModel has a method to process requests
    final response = await geminiModel.generateAllocation(amount);
    
    // Parse the response to extract allocation percentages
    // This is a placeholder; actual implementation depends on the API response structure
    return {
      'Needs': response['60%'],
      'Wants': response['20%'],
      'Savings': response['20%'],
    };
  } catch (e) {
    // Handle exceptions and possibly return default values or rethrow
    throw Exception('Failed to fetch Gemini allocation: $e');
  }
});

class GenerativeModel {
  final String model;
  final String apiKey;

  GenerativeModel({required this.model, required this.apiKey});

  Future<Map<String, dynamic>> generateAllocation(double amount) async {
    final uri = Uri.parse('https://api.gemini.com/v1/allocate'); // Replace with actual endpoint
    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': model,
        'amount': amount,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to generate allocation');
    }
  }
}

final geminiModelProvider = Provider((ref) => GenerativeModel(
  model: 'gemini-pro',
  apiKey: dotenv.env['key.env']!,
));