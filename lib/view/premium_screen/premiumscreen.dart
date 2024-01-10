import 'package:ecommercesas/controller/apicontroller.dart';
import 'package:ecommercesas/view/cart_screen/cart_screen.dart';
import 'package:ecommercesas/view/details_screen/details_screen.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        title: const Text(
          "Discover",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
            },
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.search,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search anything',
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.horizontal_split_outlined,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GridView.builder(
              itemCount: premiumItems.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                stock: premiumItems[index].p_availability!,
                                details:
                                    premiumItems[index].p_details.toString(),
                                pid: premiumItems[index].p_id!,
                                pic: premiumItems[index].photo.toString(),
                                price: premiumItems[index].p_cost!,
                                product: premiumItems[index].p_name.toString()),
                          )),
                      child: Container(
                        height: 200,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(premiumItems[index]
                                          .photo
                                          .toString()))),
                            ),
                            Text(
                              premiumItems[index].p_name.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Mrp: ${premiumItems[index].p_cost.toString()}',
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.green),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.favorite_border),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
