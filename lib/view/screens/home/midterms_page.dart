import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/view/components/home_body_components.dart';

import '../../../view_model/bloc/exams_cubit/exams_cubit.dart';
import '../../components/all.dart';

class midtermsPage extends StatelessWidget {
  midtermsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamsCubit()..getExamsData(),
      child: BlocConsumer<ExamsCubit, ExamsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ExamsCubit obj = BlocProvider.of(context);
          return Scaffold(
            appBar: customAppBar("Midterms", context,
                pop1: "All Midterms",
                pop2: "Finished Midterms",
                pop3: "Remaining Midterms"),
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: obj.exams == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      child: ListView.separated(
                        itemBuilder: (context, index) => customListCard(
                          lectureName:
                              obj.midterms[index].examSubject.toString(),
                          dayLabel: "Exam Date",
                          day: obj.midterms[index].examDate.toString(),
                          startTime:
                              obj.midterms[index].examStartTime.toString(),
                          EndTime:
                              obj.midterms[index].examEndTime.toString(),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        itemCount: obj.midterms.length,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
