import 'package:http/http.dart';


class QuoteModel {
  late String image;
  late int id;
  late String title;
  late num price;
  late String description;

  QuoteModel(this.id, this.title, this.price, this.description, this.image);

  QuoteModel.fromjson(Map<String, dynamic> response) {
    id = response['id'];
    title = response['title'];
    price = response['price'];
    description = response['description'];
    image = response['image'];
  }
}
