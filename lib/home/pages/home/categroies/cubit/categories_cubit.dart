import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'categories_state.dart';
import '../models/categories.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesState());

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    try {
      final response = await DioHelper.getData(endPoint: 'categories');

      final list = CategoriesData.fromjson(response.data).list;
      if (!isClosed) {
        emit(CategoriesSuccessState(list: list));
      }
    } on DioException catch (excepion) {
      if (!isClosed) {
        emit(
          CategoriesFailureState(
            errorMessage:
                excepion.response?.data['message'] ??
                'حدص خطا ما حاول مره اخري ',
          ),
        );
      }
    }
  }
}
