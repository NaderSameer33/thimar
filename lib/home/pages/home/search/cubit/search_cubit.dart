import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import '../model/search_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Timer? _debounce;

  /// Called every time the search field text changes.
  /// Adds a 600 ms debounce before firing the API call.
  void onSearchChanged({
    required String keyword,
    String filter = 'asc',
    num? minPrice,
    num? maxPrice,
  }) {
    // Cancel any pending timer
    _debounce?.cancel();

    // If the field is empty, go back to initial state (show normal products)
    if (keyword.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    // Show loading immediately so the UI can react fast
    emit(SearchLoadingState());

    _debounce = Timer(const Duration(milliseconds: 600), () {
      _search(
        keyword: keyword.trim(),
        filter: filter,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
    });
  }

  Future<void> _search({
    required String keyword,
    String filter = 'asc',
    num? minPrice,
    num? maxPrice,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {
        'keyword': keyword,
        'filter': filter,
      };
      if (minPrice != null) queryParams['min_price'] = minPrice;
      if (maxPrice != null) queryParams['max_price'] = maxPrice;

      final response = await DioHelper.getData(
        endPoint: 'search',
        qweryParameters: queryParams,
      );

      if (isClosed) return;

      final list = SearchData.fromJson(response.data).searchModel;
      emit(SearchSuccessState(list: list));
    } on DioException catch (e) {
      if (!isClosed) {
        emit(SearchFailureState(errorMessage: e.toString()));
      }
    } catch (e) {
      if (!isClosed) {
        emit(SearchFailureState(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
