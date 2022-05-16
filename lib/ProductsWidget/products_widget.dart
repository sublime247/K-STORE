import 'package:flutter/material.dart';
import 'package:randomquotes/ProductsModel/products_model.dart';

class QuoteWidget extends StatelessWidget {
  // const QuoteWidget({Key? key}) : super(key: key);

  final List<QuoteModel> quotes;

   QuoteWidget(this.quotes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (BuildContext context, int index) {
          return quoteBuilder(quotes[index]);
        });
  }

  Widget  quoteBuilder(QuoteModel quotes) {
    return Card(
        margin:const  EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Image.network(
              quotes.image,
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0, bottom: 5.0),
              child: Text(quotes.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              
              ))
              ,
            ),
            Text('£'+ quotes.price.toString(),
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.green
            ),)
          ]),
        ));
  }
}
