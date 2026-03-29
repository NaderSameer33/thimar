import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'slider_state.dart';
import '../model/slider.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderState());

  Future<void> getSlider() async {
    emit(SliderLoadingState());
    try {
      final response = await DioHelper.getData(endPoint: 'sliders');
      if (response.isSucces) {
        final list = SliderData.fromJson(response.data).list;
        if (!isClosed) {
          emit(SliderSuccessState(list: list));
        }
      }
    } on DioException catch (exception) {
      if (!isClosed) {
        emit(
          SliderFailureState(
            errorMessage: exception.response?.data['message'] ?? 'حدث خطا ما',
          ),
        );
      }
    }
  }
}
