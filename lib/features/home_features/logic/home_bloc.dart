import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:healthcare_flutter/features/home_features/services/home_api_repository.dart';
import 'package:healthcare_flutter/features/public_features/functions/error/error_message_class.dart';
import 'package:meta/meta.dart';

import '../model/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeApiRepository repository;
  HomeBloc(this.repository) : super(HomeInitial()) {
    on<CallHomeEvent>((event, emit) async{
    emit(HomeLoadingState());
    try{
      final HomeModel homeModel = await repository.callHomeApi();
      emit(HomeCompletedState(homeModel: homeModel));
    }
        on DioException catch(e){}
    });
  }
}
