import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/constants.dart';
import 'package:orange_digital_center/model/faq_model.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';

import '../../database/network/network/end_points.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqInitial());

  FAQ ? model;

  void getFaqs() {
    DioHelper.getData(url: faqEndPoint, token: access_token)
    .then((value) {
      if (value.statusCode == 200)
        {
          model = FAQ.fromJson(value.data);
          emit(FaqFetchedSuccessfully());
        }
    });
  }

}
