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
