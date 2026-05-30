import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIService {
  static const String _apiKey = String.fromEnvironment('GEMINI_API_KEY');

  String get getApiKey => _apiKey;

  late final model = GenerativeModel(
    model: 'gemini-3.5-flash',
    apiKey: _apiKey,
  );

  Future<String> generateUI(String prompt) async {
    if (_apiKey.isEmpty) {
      throw Exception("API Key is missing! Build the app with --dart-define");
    }
    final response = await model.generateContent([Content.text(prompt)]);
    return response.text ?? '';
  }
}

Future<Map<String, dynamic>> getAiResponse(String prompt) async {
  final ai = AIService();
  final finalPrompt = _promptConverter(prompt);
  final result = await ai.generateUI(finalPrompt);
  debugPrint(result);
  // final finalJsonAIResult = await jsonDecode(result);
  final Map<String, dynamic> finalJsonAIResult =
      jsonDecode(result) as Map<String, dynamic>;
  debugPrint("Decoded JSON Map: ${finalJsonAIResult.toString()}");
  return finalJsonAIResult;
}

String _promptConverter(String userPrompt) {
  final prompt =
      '''
Return ONLY valid JSON.

Prompt :{ $userPrompt. }

Use the above prompt and generate a valid question in json format.


This is the schema of McqsQuestion :
{
  "type": "object",
  "required": [
    "question",
    "choice1",
    "choice2",
    "choice3",
    "choice4",
    "correctOption",
    "explaination",
  ],
  "properties": {
    "question": {"type": "string"},
    "choice1": {"type": "string"},
    "choice2": {"type": "string"},
    "choice3": {"type": "string"},
    "choice4": {"type": "string"},
    "correctOption": {"type": "number"},
    "explaination": {"type": "string"},
  },
};

Example of a valid JSON format:

{
  "widget": "McqsQuestion",
  "props": {
    "question": "What is the capital city of France?",
    "choice1": "London",
    "choice2": "Berlin",
    "choice3": "Paris",
    "choice4": "Madrid",
    "correctOption": 3,
    "explaination":
        "Paris is the capital and most populous city of France.",
  },
},


Do not return explanations.
Do not return markdown.
Only JSON like example format and question should be according to prompt.
''';

  return prompt;
}
