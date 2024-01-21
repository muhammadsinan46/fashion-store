// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:store_app/domain/model/product_model.dart';
class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({
    super.key,
    required this.height,
    required this.width,
    required this.productList,
  });

  final double height;
  final double width;
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 156, 171, 179),
      height: height,
      width: width,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container( 
              clipBehavior: Clip.antiAliasWithSaveLayer,

              decoration: BoxDecoration(
                image: DecorationImage(
                   
                  image: NetworkImage('${productList[index].image.toString()}'),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
               // border: Border.all()
                
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: width,
                    height: 60,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                          
                            "${productList[index].title}", style:const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                        ),

                        Text("${productList[index].price}", style:const TextStyle(fontSize: 17, color: Colors.green, fontWeight: FontWeight.w500),)
                      ],
                    ))
                  
                ],
              )
            );
          }),
    );
  }
}
