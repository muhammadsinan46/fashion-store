


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/model/product_model.dart';
import 'package:store_app/domain/repositories/product_repository.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  ProductRepos repos;
  FetchBloc(this.repos) : super(FetchLoadingState()) {
    on<FetchLoadedEvent>((event, emit) async {
      emit(FetchLoadingState());

      try {
        final prod = await repos.getAllProduct();

        emit(FetchLoadedState(productList: prod));
      } catch (e) {
        emit(FetchWErrorState(error: " error is: $e"));
      }
    });
  }
}
