import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Catalog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductList(),
    );
  }
}
class Product {
  final String name;
  final double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});
}

final List<Product> products = [
  Product(name: 'Pant', price: 500),
  Product(name: 'Shirt', price: 600),
  Product(name: 'Shoe', price: 700),
  Product(name: 'Watch', price: 200),
  Product(name: 'Laptop', price: 150),
  Product(name: 'Mobile', price: 300),
  Product(name: 'Speaker', price: 400),
  Product(name: 'Camera', price: 800),
  Product(name: 'LedTV', price: 900),
  Product(name: 'Monitor', price: 100),
];

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  ProductListState createState() => ProductListState();
}

class ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartScreen(products: products),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
          );
        },
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name),
      subtitle: Text('\$${widget.product.price}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count: ${widget.product.counter}'),
          SizedBox(
            height: 30,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.product.counter++;
                  if (widget.product.counter == 5) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Congratulations!'),
                          content:
                          Text('You\'ve bought 5 ${widget.product.name}!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<Product> products;

  const CartScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final cart = Cart();
    for (var product in products) {
      if (product.counter > 0) {
        cart.items[product] = product.counter;
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: Center(
          child: Text("${cart.items.keys.length} Product in Cart"),
        )
    );
  }
}

class Cart {
  final Map<Product, int> items = {};

  double get totalPrice {
    double total = 0.0;
    items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}

