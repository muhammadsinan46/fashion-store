part of 'fetch_bloc.dart';

abstract class FetchEvent extends Equatable {
  const FetchEvent();

  @override
  List<Object> get props => [];
}


class FetchLoadedEvent extends FetchEvent{
  
}

