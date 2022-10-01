import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/constants.dart';
import 'package:orange_digital_center/model/sections_model.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';

import '../../database/network/network/end_points.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());

  // Model Object.
  SectionsModel? sections;

  void getSectionsData() {
    // Get data from API, url = endpoint, token = access token generated while login.
    DioHelper.getData(url: sectionEndPoint, token: access_token)
        // "then" means "if success".
        .then((value) {
      // Assign response data into your model through parameterized constructor.
      sections = SectionsModel.fromJson(value.data);
      // Change state.
      emit(DataRetrieved());
    });
  }
}
