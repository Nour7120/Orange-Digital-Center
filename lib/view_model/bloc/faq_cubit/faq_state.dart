part of 'faq_cubit.dart';

@immutable
abstract class FaqState {}

class FaqInitial extends FaqState {}

class FaqFetchedSuccessfully extends FaqState {}
