import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'simailar_state.dart';
import '../../products/model/product_model.dart';

class SimialrCubit extends Cubit<SimailarState> {
  SimialrCubit() : super(SimailarState());

  Future<void> getSimialrProduct({required int productId}) async {
    emit(SimailarLoadingState());
    try {
      final response = await DioHelper.getData(
        endPoint: 'categories/$productId',
      );
      if (response.isSucces) {
        final products = ProductData.fromJson(response.data).list;
        if (!isClosed) {
          emit(SimailarSuccessState(products: products));
        }
      }
    } on DioException catch (e) {
      if (!isClosed) {
        emit(SimilarFailureState(errorMessage: e.toString()));
      }
    }
  }
}
