import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'categories_details_state.dart';
import '../../products/model/product_model.dart';

class CategriesDetailsCubit extends Cubit<CategoriesDetailsState> {
  CategriesDetailsCubit() : super(CategoriesDetailsState());

  Future<void> getCategoriesDetails({required int categoryId}) async {
    emit(CategoriesDetailsLoadingState());
    try {
      final response = await DioHelper.getData(
        endPoint: 'products?category_id=$categoryId',
      );
      final list = ProductData.fromJson(response.data).list;
      emit(CategoriesDetailsSuccessState(list: list));
    } on DioException catch (exception) {
      emit(CategoriesDetailsFailureState(errorMessage: exception.toString()));
    }
  }
}
