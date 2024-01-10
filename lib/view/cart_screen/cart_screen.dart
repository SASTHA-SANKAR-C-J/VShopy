import 'package:ecommercesas/controller/apicontroller.dart';
import 'package:ecommercesas/view/provider/my_provider.dart';
import 'package:ecommercesas/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<MyCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: InkWell(
                onTap: () {
                  String updatedJson = updateJsonWithQuantityFromItems(
                      publicApiResponseJson, providers.itemlist);
                  showJsonDialog(context, updatedJson);
                  // print(updatedJson);
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.purple, Colors.deepPurple],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
          itemBuilder: (context, index) => CartScreenWidget(
              productName: providers.itemlist[index].name!,
              productPrice: providers.itemlist[index].price!,
              productQuantity: providers.itemlist[index].quantity!,
              productImage: providers.itemlist[index].image!,
              index: index),
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemCount: providers.itemlist.length),
    );
  }
}

void showJsonDialog(BuildContext context, String jsonStr) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Updated JSON"),
        content: SingleChildScrollView(
          child: Text(jsonStr),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
