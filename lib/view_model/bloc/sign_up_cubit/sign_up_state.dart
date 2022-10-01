part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUp extends SignUpState {}

class UniversityFetched extends SignUpState {}

class GradeFetched extends SignUpState {}

class itemSelected extends SignUpState {}