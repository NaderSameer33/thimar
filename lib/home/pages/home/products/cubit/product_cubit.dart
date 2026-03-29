import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'product_state.dart';
import '../model/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());

  Future<void> getProuct() async {
    emit(ProdcutLoadingState());
    try {
      final response = await DioHelper.getData(endPoint: 'products');
      final list = ProductData.fromJson(response.data).list;
      if (!isClosed) {
        emit(ProdcutSuccessState(list: list));
      }
    } on DioException catch (exception) {
      if (!isClosed) {
        emit(
          ProdcutFailureState(
            errorMessage: exception.toString(),
          ),
        );
      }
    }
  }
}
