import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/card_view.dart';
import '../model/card_model.dart';
import '../providers/card_provider.dart';


class CardViewPage extends StatefulWidget {
  final CardModel card;

  const CardViewPage({ Key? key, required this.card}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CardViewPageState createState() => _CardViewPageState();
}

class _CardViewPageState extends State<CardViewPage> {

  void onRemove(card) {
    Provider.of<CardProvider>(context).removeCard(card);

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        title:const Text("Card View", style: TextStyle(color: Colors.black),),
        backgroundColor:const Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios, color: Colors.black45, size: 20,),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon:const Icon(
              Icons.delete,
              color: Colors.black45,
            ), onPressed: () {
            onRemove(widget.card);
          },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding:const  EdgeInsets.all(20),
          child: Transform.translate(
            offset: Offset.fromDirection(0, 15),
            child: SizedBox(
              height: 210,
              child: CardView(cardModel: widget.card),
            ),
          ),
        ),
      ),
    );
  }
}
