import 'package:frontend_mobile/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Requests {
  static String url = dotenv.env['URL'].toString();
  Map<String, String> headers = {"Content-Type": "application/json"};

  Map<String, String> getHeaders(context) {
    final token = Provider.of<Auth>(context, listen: false).getToken;
    if (token != null) {
      return {
        ...headers,
        "Authorization": "Bearer $token",
      };
    }
    return headers;
  }
}
