import 'dart:convert';

import 'package:http/http.dart';

class FetchMeme {
  static fetchnewMeme() async {
    Response response = await get(Uri.parse('https://meme-api.com/gimme'));
    Map json = jsonDecode(response.body);
    return json['url'];
  }
}
