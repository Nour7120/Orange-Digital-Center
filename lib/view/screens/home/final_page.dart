import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/view/components/home_body_components.dart';

import '../../../view_model/bloc/exams_cubit/exams_cubit.dart';
import '../../components/all.dart';

class finalPage extends StatelessWidget {
  finalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamsCubit()..getExamsData(),
      child: BlocConsumer<ExamsCubit, ExamsState>(
          listener: (context, state) {},
          builder: (context, state) {
            ExamsCubit obj = BlocProvider.of(context);
            return Scaffold(
              appBar: customAppBar("Finals", context,
                  pop1: "All Finals",
                  pop2: "Finished Finals",
                  pop3: "Remaining Finals"),
              body: Padding(
                padding: const EdgeInsets.all(25.0),
                child: obj.exams == null
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        child: ListView.separated(
                          itemBuilder: (context, index) => customListCard(
                            lectureName:
                                obj.finals[index].examSubject.toString(),
                            dayLabel: "Exam Date",
                            day: obj.finals[index].examDate.toString(),
                            startTime:
                                obj.finals[index].examStartTime.toString(),
                            EndTime: obj.finals[index].examEndTime.toString(),
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20),
                          itemCount: obj.finals.length,
                        ),
                      ),
              ),
            );
          }),
    );
  }
}
