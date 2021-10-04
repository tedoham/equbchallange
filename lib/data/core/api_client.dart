import 'package:http/http.dart';

import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    const baseUrl = ApiConstants.BASE_URL;

    Response response = await _client.get(
      Uri.parse(baseUrl + path),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return response.body;
      // return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
