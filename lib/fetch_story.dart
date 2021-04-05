import 'dart:convert';
import 'package:http/http.dart' as http;

Future fetchStory() async {
  final url = Uri.http('192.168.1.67:5000', '/');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      
      return jsonResponse;
    }
  }
  catch (err) {
    print('Server error: $err');
    
    return '';
  }
}