import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'rate_state.dart';
import '../models/rate_model.dart';

class RateCubit extends Cubit<RateState> {
  RateCubit() : super(RateState());

  Future<void> getProductRate({required int productId}) async {
    emit(RateLoadingState());
    try {
      final response = await DioHelper.getData(
        endPoint: 'products/$productId/rates',
      );
      if (response.isSucces) {
        final rates = RateData.fromjson(response.data).rates;
        if (!isClosed) {
          emit(RateSuccessState(rates: rates));
        }
      }
    } on DioException catch (excepton) {
      if (!isClosed) {
        emit(
          RateFailureState(
            errorMessage: excepton.toString(),
          ),
        );
      }
    }
  }
}
