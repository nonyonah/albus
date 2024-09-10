import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

final geminiAllocationProvider = FutureProvider.family<Map<String, String>, double>((ref, amount) async {
  final geminiModel = ref.watch(geminiModelProvider);

  // Example categories and timeframe, you'd get these from the user's input
  final List<String> categories = ["Rent", "Groceries", "Utilities", "Entertainment"];
  const String timeframe = "monthly";

  // Construct the prompt for the Gemini AI
  String prompt = '''
  I am a budgeting assistant helping a user allocate their income based on the 50/30/20 rule of budgeting. 
  The rule suggests 50% for "Needs," 30% for "Wants," and 20% for "Savings." 
  The user has provided the following information:
  - Income: \$${amount.toStringAsFixed(2)}
  - Timeframe: $timeframe
  - Categories: ${categories.join(", ")}

  Please follow these instructions:
  1. First, allocate 20% of the user's income for savings. If none of the provided categories fit "savings"
     (like emergency fund, retirement, etc.), subtract this amount and do not allocate it to any other category.
  2. Allocate 50% of the remaining income to the "Needs" categories (such as rent, groceries, utilities, etc.).
  3. Allocate 30% of the remaining income to the "Wants" categories (such as entertainment, dining out, etc.).
  4. Ensure the output reflects the correct amounts based on the user's timeframe (monthly or weekly).
  5. Provide the output as a list of categories with their corresponding allocated amounts.

  Here are the user's categories: ${categories.join(", ")}.
  ''';

  try {
    // Send the request to the Gemini AI model
    final response = await geminiModel.generateContent([Content.text(prompt)]);
    final responseText = response.text;

    if (responseText == null) {
      throw Exception('Empty response from Gemini AI');
    }

    // Process and return the response from Gemini AI
    Map<String, String> allocations = processGeminiResponse(responseText);
    return allocations;
  } catch (e) {
    // Handle the error and return an empty map or a specific error message
    print('Error in Gemini allocation: $e');
    return {'error': 'Failed to get allocation from Gemini AI. Please try again later.'};
  }
});

Map<String, String> processGeminiResponse(String response) {
  // This function should parse the Gemini AI response and convert it to a Map<String, String>
  // You'll need to implement the logic based on the expected format of the Gemini AI response
  // For now, we'll return a dummy map
  return {
    'Savings': '\$200.00',
    'Rent': '\$500.00',
    'Groceries': '\$300.00',
    'Utilities': '\$200.00',
    'Entertainment': '\$300.00',
  };
}

final geminiModelProvider = Provider((ref) {
  final apiKey = dotenv.env['key.env']!;
  return GenerativeModel(
    model: 'gemini-1.5-pro',
    apiKey: const String.fromEnvironment('api_key'),
  );
});

final allocationsProvider = StateProvider<Map<String, Map<String, String>>>((ref) => {});

void _updateAllocations(WidgetRef ref, double amount) async {
  try {
    final geminiAllocation = await ref.read(geminiAllocationProvider(amount).future);
    ref.read(allocationsProvider.notifier).update((state) => {
      ...state,
      'Gemini': geminiAllocation,
    });
  } catch (e) {
    // Handle errors, e.g., show a snackbar
    ScaffoldMessenger.of(ref.context).showSnackBar(
      SnackBar(content: Text('Error fetching allocations: $e')),
    );
  }
}
