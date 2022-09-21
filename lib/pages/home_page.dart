import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/pages/add_card_page.dart';
import 'package:tracker/providers/card_provider.dart';

import '../component/card_list.dart';
import '../component/trasaction_view.dart';
import '../model/transaction_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(230, 241, 242, 1),
      appBar: AppBar(
        // systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarBrightness: Brightness.dark
        // ),

        backgroundColor: const Color.fromRGBO(230, 241, 242, 1),
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) =>  AddCardPage()));
            },
            icon: const Icon(Icons.add),
            color: Colors.black38,
          ),
        ],
        leading: null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (
              Provider.of<CardProvider>(context).getCardLength()>0?

              Container(
                 margin: const EdgeInsets.only(right: 8.0),
                height: 210,
                child: Consumer<CardProvider>(
                  builder: (context,cards,child)=>CardList(cards:cards.allCards),
                )
                // CardView(
                //     cardModel: CardModel(
                //         available: 100,
                //         name: 'MasterCard',
                //         currency: 'Us',
                //         number: '1234 **** **** 4321')),
              ):
              Container(

                height: 210,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:const Align(
                  alignment: Alignment.center,
                  child: Text("Add your New Card Click the Button \n\n in the top right",style: TextStyle(
                    color: Colors.white,fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                  ),
                ),
              )),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Last Transactions",
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              TransactionView(
                transactionModel: TransactionModel(
                  currency: "us",
                  name: "shopping",
                  price: "1200",
                  type: "-",
                ),
              ),
              TransactionView(
                transactionModel: TransactionModel(
                  currency: "us",
                  name: "Salary",
                  price: "1220",
                  type: "+",
                ),
              ),
              TransactionView(
                transactionModel: TransactionModel(
                  currency: "us",
                  name: "Receive",
                  price: "1550",
                  type: "-",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
