import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_digital_center/view/components/home_body_components.dart';
import 'package:orange_digital_center/view_model/bloc/sections_cubit/sections_cubit.dart';

import '../../components/all.dart';

class sectionsPage extends StatelessWidget {
  sectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SectionsCubit()..getSectionsData(),
      child: BlocConsumer<SectionsCubit, SectionsState>(
        listener: (context, state) {},
        builder: (context, state) {
          SectionsCubit object = BlocProvider.of(context);
          return Scaffold(
            appBar: customAppBar("Sections", context,
                pop1: "All Sections",
                pop2: "Finished Sections",
                pop3: "Remaining Sections"),
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: object.sections == null? Center(child: CircularProgressIndicator()):
              Container(
                child: ListView.separated(
                  itemBuilder: (context, index) => customListCard(
                    lectureName: object.sections!.data![index].sectionSubject,
                    dayLabel: "Section Day",
                    day: object.sections!.data![index].sectionDate,
                    startTime: object.sections!.data![index].sectionStartTime,
                    EndTime: object.sections!.data![index].sectionEndTime,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: object.sections!.data!.length,
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
