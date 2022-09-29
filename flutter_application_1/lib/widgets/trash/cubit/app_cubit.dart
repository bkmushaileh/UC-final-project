import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/widgets/trash/cubit/app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits() : super(InitialState()) {
    //Emit a new State to show the welcome Page
    emit(WelcomeState());
  }
}
