import 'package:flutter/material.dart';
import 'package:tracker/pages/card_view_page.dart';

import '../model/card_model.dart';
import './card_view.dart';

class CardList extends StatelessWidget {
  final List<CardModel> cards;

  const CardList({ Key? key, required this.cards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(

        scrollDirection: Axis.horizontal,
        children: getChildrenCards(context)
    );
  }

  List<Widget> getChildrenCards(context) {
    return cards.map((card) =>
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => CardViewPage(card: card)));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CardView(cardModel: card),
          ),
        )
    ).toList();
  }
}