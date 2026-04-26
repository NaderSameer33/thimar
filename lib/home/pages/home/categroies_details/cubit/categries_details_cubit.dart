import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/logic/dio_helper.dart';
import 'categories_details_state.dart';
import '../../products/model/product_model.dart';

class CategriesDetailsCubit extends Cubit<CategoriesDetailsState> {
  CategriesDetailsCubit() : super(CategoriesDetailsState());

  Timer? _debounce;

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

  /// Called on every keystroke in the category search field.
  /// Resets to the full list when [keyword] is empty.
  void onSearchChanged({
    required int categoryId,
    required String keyword,
    String filter = 'asc',
    num? minPrice,
    num? maxPrice,
  }) {
    _debounce?.cancel();

    if (keyword.trim().isEmpty) {
      // Re-fetch the full category list
      getCategoriesDetails(categoryId: categoryId);
      return;
    }

    emit(CategoriesDetailsLoadingState());

    _debounce = Timer(const Duration(milliseconds: 600), () {
      _searchCategory(
        categoryId: categoryId,
        keyword: keyword.trim(),
        filter: filter,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
    });
  }

  Future<void> _searchCategory({
    required int categoryId,
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
        endPoint: 'search_category/$categoryId/',
        qweryParameters: queryParams,
      );

      if (isClosed) return;

      final list = ProductData.fromJson(response.data).list;
      emit(CategoriesDetailsSuccessState(list: list));
    } on DioException catch (e) {
      if (!isClosed) {
        emit(CategoriesDetailsFailureState(errorMessage: e.toString()));
      }
    } catch (e) {
      if (!isClosed) {
        emit(CategoriesDetailsFailureState(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

