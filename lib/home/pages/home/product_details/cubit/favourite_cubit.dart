import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteState());

  Future<void> addFavouriteProduct({required int productId}) async {
    try {
      final response = await DioHelper.sendData(
        endPoint: 'client/products/$productId/add_to_favorite',
      );
      if (response.isSucces) {
        final succesMessage = response.data['message'];
        emit(FavouriteSuccessState(succesMessage: succesMessage));
      }
    } on DioException catch (e) {
      emit(FavouriteFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> removeFavouriteProduct({required int productId}) async {
    try {
      final response = await DioHelper.sendData(
        endPoint: 'client/products/$productId/remove_from_favorite',
      );
      if (response.isSucces) {
        final succesMessage = response.data['message'];
        emit(FavouriteSuccessState(succesMessage: succesMessage));
      }
    } on DioException catch (e) {
      emit(FavouriteFailureState(errorMessage: e.toString()));
    }
  }
}
