import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/constants.dart';
import 'package:orange_digital_center/model/sign_up/grade_model.dart';
import 'package:orange_digital_center/view/screens/login_signup/login_screen.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';

import '../../../model/sign_up/university_model.dart';
import '../../database/network/network/end_points.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();

  List<Data>? universities;
  List<GradeData>? grades;

  Grade? gradeModel;
  University? universityModel;

  void signUp(context) {
    var data = {
      "email": email.text,
      "password": pass.text,
      "name": name.text,
      "gender": "m",
      "phoneNumber": phone.text,
      "universityId": "1",
    };
    DioHelper.postData(url: registerEndPoint, data: data).then(
      (value) {
        emit(SignUp());
      },
    );
  }

  void getGrades() {
    DioHelper.getData(url: gradeEndPoint, token: access_token).then((value) {
      if (value.statusCode == 200) {
        gradeModel = Grade.fromJson(value.data);
        grades = gradeModel!.data;
        emit(GradeFetched());
      }
      ;
    });
  }

  void getUniversities() {
    DioHelper.getData(url: universityEndPoint, token: access_token)
        .then((value) {
      if (value.statusCode == 200) {
        universityModel = University.fromJson(value.data);
        universities = universityModel!.data;
        emit(UniversityFetched());
      }
    });
  }

  void getUniversitiesAndGrades() {
    getUniversities();
    getGrades();
  }

  String currentUniversityItem = "AUC";

  void selectUniversityItem(item) {
    currentUniversityItem = item;
    emit(itemSelected());
  }

  String currentGradeItem = "Admin";

  void selectGradeItem(item) {
    currentGradeItem = item;
    emit(itemSelected());
  }
}
