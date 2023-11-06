import 'package:flutter/material.dart';
import 'package:flutter_assignment/class/product.dart';
import '../style/button_style.dart';
import '../style/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 Product product = Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            const Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 6,
                child: Text(
                  "My Bag",
                  style: headerTextStyle(),
                )),
            Expanded(
              flex: 80,
              child: ListView.separated(
                itemCount: product.productList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                          height: 120,
                          width: 60,
                          child: Image.network(
                            product.productList[index]["img"],
                            fit: BoxFit.fill,
                          )),
                      title: Text(product.productList[index]["title"]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Color: ${product.productList[index]["color"]}"),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("Color: ${product.productList[index]["size"]}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (product.productList[index]["qty"] > 0) {
                                    product.productList[index]["qty"]--;
                                    setState(() {});
                                    product.totalAmount = product.totalAmount -
                                        int.parse(product.productList[index]["price"]
                                            .toString());
                                    setState(() {});
                                  }
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                                style: elevatedButtonStyle(),
                              ),
                              Text("${product.productList[index]["qty"].toString()}"),
                              ElevatedButton(
                                onPressed: () {
                                  product.productList[index]["qty"]++;
                                  setState(() {});
                                  product.totalAmount = product.totalAmount +
                                      int.parse(
                                          product.productList[index]["price"].toString());
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                                style: elevatedButtonStyle(),
                              ),
                            ],
                          )
                        ],
                      ),
                      trailing: Column(
                        children: [
                          const Icon(Icons.more_vert),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("${product.productList[index]["price"]}\$")
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
            Expanded(
              flex: 14,
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Total amount:     "),
                      Text(
                        "${product.totalAmount.toString()}\$",
                        style: subTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        product.totalAmount == 0
                            ? mySnackBar("add product")
                            : mySnackBar("Congratulation");
                      },
                      child: const Text("Check Out"),
                      style: elevatedButtonStyle2(),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
  mySnackBar(text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }
}
