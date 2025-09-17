// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
    final List<Product>? products;
    final int? total;
    final int? skip;
    final int? limit;

    Products({
        this.products,
        this.total,
        this.skip,
        this.limit,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    final int? id;
    final String? title;
    final String? description;
    final String? category;
    final double? price;
    final String? thumbnail;

    Product({
        this.id,
        this.title,
        this.description,
        this.category,
        this.price,
        this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "thumbnail": thumbnail,
    };
}
