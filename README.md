# flutter_application_24

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Model

Model adalah sebauh blueprint atau template atau format yang bisa digunakan pada saat melakukan assignment data dan menampilan data atau mengambil sebuah data.

```dart
Product Model

[
	Product(Judul, Image, Harga, Kuantitas),
	Product(Judul, Image, Harga, Kuantitas),
	Product(Judul, Image, Harga, Kuantitas),
	Product(Judul, Image, Harga, Kuantitas)
]
```

```dart
import 'package:flutter/material.dart';

class Product {
  @required
  String? title;
  @required
  String? imageUrl;
  @required
  int? price;
  @required
  String? description;

  Product(this.title, this.price, this.imageUrl, this.description);
}

```

foto 1

```dart
import 'package:flutter/material.dart';
import 'package:flutter_application_24/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
    );
  }
}

```

foto 2

```dart
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_24/models/product.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Product> myDummy = List.generate(
      20,
      (index) => Product(
            faker.company.name(),
            faker.randomGenerator.integer(1000000, min: 100000),
            "https://picsum.photos/id/$index/200",
            faker.lorem.sentence(),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Market Place"),
        ),
        body: GridView.builder(
          itemCount: myDummy.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GridTile(
              footer: Container(
                alignment: Alignment.center,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "${myDummy[index].title}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rp. ${myDummy[index].price},00",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "${myDummy[index].description}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              child: Image.network(
                "${myDummy[index].imageUrl}",
              ),
            );
          },
        ));
  }
}
```
foto 3