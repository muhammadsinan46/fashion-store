part of 'fetch_bloc.dart';

sealed class FetchState extends Equatable {
  const FetchState();
  
  @override
  List<Object> get props => [];
}

final class FetchLoadingState extends FetchState {}

final class FetchLoadedState extends FetchState{

  final List<ProductModel> productList;

  FetchLoadedState({required this.productList});

  @override
  List<Object> get props => [productList];

  

}


final class FetchWErrorState extends FetchState{

final String error;

  FetchWErrorState({required this.error});

  List<Object> get props =>[];

}