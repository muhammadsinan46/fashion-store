import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/applications/product_bloc/bloc/fetch_bloc.dart';

import 'package:store_app/domain/repositories/product_repository.dart';
import 'package:store_app/presentation/widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => FetchBloc(ProductRepos())..add(FetchLoadedEvent()),
      child: Scaffold(
        backgroundColor:Color.fromARGB(255, 156, 171, 179),
        appBar: PreferredSize(
          preferredSize:Size(width, 170),
          child: Column(
            children: [
               SizedBox(
                    height:200,
                      width: width,
                      child: Image.network(
                        'https://cdn.vectorstock.com/i/1000x1000/70/76/cosmetics-bottle-anti-aging-product-tube-banner-vector-27427076.webp',
                        fit: BoxFit.cover,
                      ))
            ],
          ),
        ),
        body: ListView(
          children: [
          
         
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<FetchBloc, FetchState>(
                builder: (context, state) {

                  if(state is FetchLoadingState){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else if(state is FetchLoadedState){

                      
                  return ProductListBuilder(height: height, width: width,productList: state.productList,);
                  }else{
                
                    return const Center(child: Text("Oops.. No products available "));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

