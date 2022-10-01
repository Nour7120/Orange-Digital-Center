import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../view_model/bloc/terms_conditions_cubit/terms_conditions_cubit.dart';
import '../../components/all.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermsConditionsCubit()..getHtmlContent(),
      child: BlocConsumer<TermsConditionsCubit, TermsConditionsState>(
        listener: (context, state) {},
        builder: (context, state) {
          TermsConditionsCubit obj = BlocProvider.of(context);
          return Scaffold(
            appBar: customAppBar("Terms & Conditions", context, noElevation: true, noFilter: true),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: obj.termsConditions == null? Center(child: CircularProgressIndicator(),)
              :SingleChildScrollView(
                child: Expanded(
                  child: Container(
                    color: Colors.white,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: HTML.toTextSpan(
                        context,
                        obj.htmlContent!,
                        defaultTextStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                          decoration: TextDecoration.none
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
