import 'package:flutter/material.dart';
import 'package:orange_digital_center/view/screens/app.dart';
import 'package:orange_digital_center/view_model/database/network/network/dio_helper.dart';

void main() async{
  await DioHelper.init();
  runApp(App());
}