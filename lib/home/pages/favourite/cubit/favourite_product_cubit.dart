import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/logic/dio_helper.dart';
import 'favourite_product_state.dart';
import '../../home/products/model/product_model.dart';

class FavouriteProductCubit extends Cubit<FavouriteProductState> {
  FavouriteProductCubit() : super(FavouriteProductState());

  Future<void> getFavourteProduct() async {
    emit(FavouriteProductLoadingState());
    try {
      final response = await DioHelper.getData(
        endPoint: 'client/products/favorites',
      );
      if (response.isSucces) {
        final products = ProductData.fromJson(response.data).list;
        if (!isClosed) {
          emit(FavouriteProductSuccessState(favouriteProduct: products));
        }
      }
    } on DioException catch (e) {
      emit(
        FavouriteProductFailureState(errorMessage: e.response!.data['message']),
      );
    }
  }
}
