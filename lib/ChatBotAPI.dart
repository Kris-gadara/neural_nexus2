import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatBotAPI {
  static const String apiKey = 'AIzaSyBEN7lWDrHERtV2hNXlphq_yhROna7EWmE'; // Replace with your actual Google Generative AI API key
  static const String apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey';

  // Method to fetch a response from the Gemini chatbot
  Future<String> getResponse(String userInput) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'contents': [
            {
              'parts': [
                {'text': userInput},
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response JSON
        final responseData = json.decode(response.body);
        final String chatbotReply = responseData['candidates'][0]['content']['parts'][0]['text'].trim();
        return chatbotReply;
      } else {
        return 'Error: Unable to fetch response from the chatbot. Status code: ${response.statusCode}, Body: ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}