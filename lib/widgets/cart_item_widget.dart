import 'package:ecommercesas/view/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatefulWidget {
  final String productName;
  final int productPrice;
  final int productQuantity;
  final String productImage;
  final int index;
  const CartScreenWidget(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productImage,
      required this.index});

  @override
  State<CartScreenWidget> createState() => _CartScreenWidgetState();
}

class _CartScreenWidgetState extends State<CartScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<MyCartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin:
                    Alignment.topLeft, // Define the start point of the gradient
                end: Alignment
                    .bottomRight, // Define the end point of the gradient
                colors: [
                  Colors.purple,
                  Colors.deepPurple
                ], // Specify your two colors here
              ),
              borderRadius: BorderRadius.circular(20)),
          height: 150,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(widget.productImage),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Total Price : ${widget.productPrice}",
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${widget.productQuantity}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[300]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {
                                providers.deleteitem(widget.index);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
