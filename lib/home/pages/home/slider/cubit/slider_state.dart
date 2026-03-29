
import '../model/slider.dart';

class SliderState {}

class SliderLoadingState extends SliderState {}


class SliderSuccessState extends SliderState {
  final List <SliderModel> list ; 
  SliderSuccessState({required this.list}); 

}

class SliderFailureState extends SliderState {
  final String errorMessage ; 
  SliderFailureState({required this.errorMessage}) ; 
}