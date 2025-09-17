import 'package:day17_abi_app/api_provider/api_provider.dart';
import 'package:day17_abi_app/custom_chat_widget.dart';
import 'package:day17_abi_app/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Products? productsModel;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductsFromApiProvider();
  }

  getProductsFromApiProvider() async {
    productsModel = await ApiProvider().getProducts();
    print(productsModel!.products![0].title);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color.fromARGB(255, 255, 196, 215),
              child: Icon(Icons.shopping_bag_outlined),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Products",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 234, 226, 232),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  Text("Search"),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            isLoading == true
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomProductWidget(
                          title: productsModel!.products![index].title!,
                          thumbnail: productsModel!.products![index].thumbnail,
                          price: productsModel!.products![index].price,
                          category: productsModel!.products![index].category,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 3),
                      itemCount: productsModel!.products!.length,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
