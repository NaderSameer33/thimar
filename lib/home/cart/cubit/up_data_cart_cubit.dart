import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/home/cart/cubit/up_data_cart_state.dart';

class UpDataCartCubit extends Cubit<UpDataCartState> {
  UpDataCartCubit() : super(UpDataCartState());
  Map<int, int> count = {};
  void increaseCount({required int id}) {
    count[id] = (count[id] ?? 1) + 1;
    emit(IncreaseCount());
  }

  void decreaseCount({required int id}) {
    if ((count[id] ?? 1) > 1) {
      count[id] = count[id]! - 1;

      emit(DecreaseCount());
    }
  }
}
