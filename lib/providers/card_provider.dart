import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/card_model.dart';

class CardProvider extends ChangeNotifier{
List<CardModel> cards=[];
UnmodifiableListView<CardModel>get allCards=>UnmodifiableListView(cards);

void initialState(){
  syncDataWithProvider();

}

void addCard(CardModel cardModel){
  cards.add(cardModel);
  updateSharedPreferences();
  notifyListeners();
}

void removeCard(CardModel cardModel){
  cards.removeWhere((cardModel) => cardModel.number==cardModel.number);
  updateSharedPreferences();
  notifyListeners();

}
int getCardLength(){
  return cards.length;
}
Future updateSharedPreferences()async{
List<String> myCard=cards.map((e) => json.encode(e.toJson())).toList();
SharedPreferences preferences=await SharedPreferences.getInstance();

await preferences.setStringList('cards', myCard);

}


Future syncDataWithProvider()async{
  SharedPreferences preferences=await SharedPreferences.getInstance();
  var result=preferences.getStringList('cards');

  if (result !=null) {
    cards=result.map((e) => CardModel.fromJson(json.decode(e))).toList();

  }
  notifyListeners();
}
}