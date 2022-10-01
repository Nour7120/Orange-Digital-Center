import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';

import '../../../constants.dart';
import '../../../model/lectures_model.dart';
import '../../database/network/network/end_points.dart';

part 'lectures_state.dart';

class LecturesCubit extends Cubit<LecturesState> {
  LecturesCubit() : super(LecturesInitial());

  static LecturesCubit get(context) => BlocProvider.of(context);

  LecturesModel? lectureData;

  void getLecturesData() {
    DioHelper.getData(
      url: lectureEndPoint,
      token: access_token
    ).then((value) {
      lectureData = LecturesModel.fromJson(value.data);
      emit(DataRetrieved());
    });
  }
}
