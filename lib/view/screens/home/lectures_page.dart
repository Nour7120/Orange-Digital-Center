import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/view/components/home_body_components.dart';

import '../../../view_model/bloc/lectures_cubit/lectures_cubit.dart';
import '../../components/all.dart';

class lecturesPage extends StatelessWidget {
  lecturesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LecturesCubit()..getLecturesData(),
      child: BlocConsumer<LecturesCubit, LecturesState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          LecturesCubit s = LecturesCubit.get(context);
          return Scaffold(
            appBar: customAppBar("Lectures", context, pop1: "All Lectures",
                pop2: "Finished Lectures",
                pop3: "Remaining Lectures"),
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: s.lectureData == null ? Center(child: CircularProgressIndicator()) :
              Container(
                child: ListView.separated(
                  itemBuilder: (context, index) => customListCard(
                    lectureName: s.lectureData!.data![index].lectureSubject.toString(),
                    dayLabel: "Lecture Day",
                    day: s.lectureData!.data![index].lectureDate.toString(),
                    startTime: s.lectureData!.data![index].lectureStartTime.toString(),
                    EndTime: s.lectureData!.data![index].lectureEndTime.toString(),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: LecturesCubit.get(context).lectureData!.data!.length,
                  physics: BouncingScrollPhysics(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
