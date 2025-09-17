import 'package:day17_abi_app/models/products_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Products? productsModel;

  getProducts() async {
    Response productResponse = await Dio().get("https://dummyjson.com/products",
        queryParameters: {
          "select": "title,description,category,price,thumbnail"
        });

    productsModel = Products.fromJson(productResponse.data);

    print(productsModel!.products![0].title);

    return productsModel;
  }
}
