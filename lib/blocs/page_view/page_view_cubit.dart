import 'package:bloc/bloc.dart';

class PageViewCubit extends Cubit<int> {
  PageViewCubit() : super(0);

  void select(int index) => emit(index);
}
