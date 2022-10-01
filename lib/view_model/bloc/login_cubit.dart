import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:orange_digital_center/view/screens/home_layout.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../constants.dart';
import '../database/network/network/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool visible = false;

  void login(context){
    var data = {"email": email.text, "password": pass.text};
    DioHelper.postData(
      url: loginEndPoint,
      data: data,
    ).then((value) {
      if(value.statusCode == 200){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeLayout()));
        emit(LoginSuccess());
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message:
            "Login Success",
          ),
        );
    }}).catchError((error){
      emit(LoginFailed());
    });
  }

  void isVisible(){
    visible = !visible;
    emit(IsVisible());
  }
}
