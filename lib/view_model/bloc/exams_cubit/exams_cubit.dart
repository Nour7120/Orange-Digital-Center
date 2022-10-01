import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/model/exams_model.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';

import '../../../constants.dart';
import '../../database/network/network/end_points.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  List midterms = [];
  List finals = [];

  ExamsModel? exams;

  void getExamsData() {
    DioHelper.getData(url: examsEndPoint, token: access_token)
        .then((value) {
          exams = ExamsModel.fromJson(value.data);
          print(exams!.data);
          midtermsOrFinals(exams);
          emit(DataRetrieved());
    });
  }

  void midtermsOrFinals(exams)
  {
    for(int i = 0; i<exams!.data!.length; i++)
      {
        if(exams!.data![i].toJson()["final"] == true)
          finals.add(exams.data![i]);
        else
          midterms.add(exams.data![i]);
      }

  }
}
