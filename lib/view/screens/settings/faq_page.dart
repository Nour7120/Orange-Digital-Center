import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_digital_center/view_model/bloc/faq_cubit/faq_cubit.dart';
import 'package:toggle_list/toggle_list.dart';

import '../../components/all.dart';
import '../../components/faq/faq.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getFaqs(),
      child: BlocConsumer<FaqCubit, FaqState>(
        listener: (context, state) {},
        builder: (context, state) {
          FaqCubit obj = BlocProvider.of(context);
          return Scaffold(
            appBar:
                customAppBar("FAQ", context, noFilter: true, noElevation: true),
            body: obj.model == null?
            Center(child: CircularProgressIndicator(),)
                :ToggleList(
              children: List.generate(
                  obj.model!.data!.length,
                      (index) => customToggleItem(
                          title: obj.model!.data![index].question,
                        content: obj.model!.data![index].answer,
                        context: context
                      ),
              ),
              innerPadding: EdgeInsets.all(10),
            ),
          );
        },
      ),
    );
  }
}
