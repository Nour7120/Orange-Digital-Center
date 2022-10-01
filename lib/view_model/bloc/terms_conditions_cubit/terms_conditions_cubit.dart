import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/constants.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';

import '../../../model/terms_model.dart';
import '../../database/network/network/end_points.dart';

part 'terms_conditions_state.dart';

class TermsConditionsCubit extends Cubit<TermsConditionsState> {
  TermsConditionsCubit() : super(TermsConditionsInitial());

  String ? htmlContent;

  TermsConditionsModel ? termsConditions;

  void getHtmlContent(){
    DioHelper.getData(url: termsEndPoint, token: access_token)
        .then((value) {
      termsConditions = TermsConditionsModel.fromJson(value.data);
      htmlContent = termsConditions!.data!.terms;
      emit(ParsedSuccessful());
    });
  }
}
