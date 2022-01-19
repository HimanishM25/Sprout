import 'package:http/http.dart' as http;

// Function to return resource data requested
fetchData(String url) async {
  // response => needs a Uri value
  // We pass a String value => Parse it into Uri
  http.Response response = await http.get(Uri.parse("uri"));
  return response.body;
}
