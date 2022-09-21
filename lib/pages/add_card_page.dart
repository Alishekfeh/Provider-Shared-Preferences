import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/model/card_model.dart';
import 'package:tracker/providers/card_provider.dart';

class AddCardPage extends StatefulWidget {
  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController bankNameController = TextEditingController();

  TextEditingController availableController = TextEditingController();

  TextEditingController currencyController = TextEditingController();

  void onAdd() {
    CardModel cardModel = CardModel(
        available: int.parse(availableController.text),
        name: nameController.text,
        number: numberController.text,
        currency: currencyController.text);
    Provider.of<CardProvider>(context,listen: false).addCard(cardModel);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {




    Provider.of<CardProvider>(context).initialState();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 241, 242, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(230, 241, 242, 1),
        title: const Text(
          "Add Card",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(

                    enabled: true,

                    controller: nameController,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    autocorrect: true,
                    decoration: const InputDecoration(
                        border: InputBorder.none,

                        hintText: "Card Name",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Card Number",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: bankNameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Bank Name",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: availableController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Available Balance",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: currencyController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Currency",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                MaterialButton(
                  onPressed: () => onAdd(),
                  elevation: 0,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.all(15),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
