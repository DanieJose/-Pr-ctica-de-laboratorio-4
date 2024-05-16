import 'package:http/http.dart' as http;
import 'package:main/type/post.dart';

void main(List<String> arguments) async {
  var url = Uri.https(
      'https://newsapi.org/v2/everything?q=tesla&from=2024-04-16&sortBy=publishedAt&apiKey=8e53607e392c4ee980143585192befc0');

  try {
    var jsonPost = await http.get(url);
    if (jsonPost.statusCode == 200) {
      final post = postFromJson(jsonPost.body);
      for (var post in post) {
        print("author: ${post.author}");
        print("title: ${post.title}");
        print("description: ${post.description}");
        print("url: ${post.url}");
        print("urlToImage: ${post.urlToImage}");
        print("publishedAt: ${post.publishedAt}");
        print("content: ${post.content}");
        print("======================================");
      }
    } else {
      print("No se pudo conectar con el servidor");
    }
  } catch (e) {
    print(e.toString());
  }
}
