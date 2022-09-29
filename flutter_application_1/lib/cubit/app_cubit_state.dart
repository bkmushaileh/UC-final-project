//Create State

import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  //[Data that should be changed]
  List<Object?> get props => [];
}

//Trigger new state once the intialization has been done
class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
