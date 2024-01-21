

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/domain/model/product_model.dart';
import 'package:store_app/infrastructure/api/apiprovider.dart';

class ProductRepos{


Future <List<ProductModel>>getAllProduct()async{

  final  response = await http.get(Uri.parse(productUrl));

  final List data = jsonDecode(response.body);

try{

  
  if(response.statusCode ==200){

    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
  else{

    throw Exception("failed to get the data");
  }
}catch(e){

  print("error is :$e");
}

throw Exception("some Unexpected Error");



}


}