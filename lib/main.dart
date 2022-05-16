import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'ProductsWidget/products_widget.dart';
import 'package:randomquotes/ProductsModel/products_model.dart';
// import 'package:sky_engine/_http/http.dart';

void main() {
  runApp(const MaterialApp(
    home: QuotingHouse(),
  ));
  // print(quoteModel)
}

class QuotingHouse extends StatefulWidget {
  const QuotingHouse({Key? key}) : super(key: key);

  @override
  State<QuotingHouse> createState() => _QuotingHouseState();
}

class _QuotingHouseState extends State<QuotingHouse> {
  final List<QuoteModel> quotes = [];

  int count = 0;

  void fetchQuote() async {
    
    count++;
    final response =
        await get(Uri.parse('https://fakestoreapi.com/products/$count'));
    final quoteModel = QuoteModel.fromjson(json.decode(response.body));
    setState(() {
      quotes.add(quoteModel);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber[300],
          title:const  Text('K-Store'),
          centerTitle: true),
      body: QuoteWidget(quotes),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[300],
        onPressed: () {
          fetchQuote();
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
