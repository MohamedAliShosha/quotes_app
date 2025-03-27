import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quotes_app/cubit/add_quote_cubit/add_quotes_cubit.dart';
import 'package:quotes_app/models/quote_model_data_base.dart';
import 'package:quotes_app/widgets/colors_list_view.dart';
import 'package:quotes_app/widgets/custom_add_quote_button.dart';
import 'package:quotes_app/widgets/custom_text_field.dart';

class AddQuoteForm extends StatefulWidget {
  const AddQuoteForm({
    super.key,
  });

  @override
  State<AddQuoteForm> createState() => _AddQuoteFormState();
}

class _AddQuoteFormState extends State<AddQuoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled; //

  String? quote, author;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField1(
            onSaved: (value) {
              quote = value;
            },
            hintText: 'Enter Quote',
            maxLines: 5, // used to set the number of lines in the text field
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField1(
            onSaved: (valu) {
              author = valu;
            },
            hintText: 'Enter Author',
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddQuotesCubit, AddQuotesState>(
            builder: (context, state) {
              return CustomAddQuoteButton(
                isLoading: state is AddQuotesLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat('dd MMMM yyyy').format(currentDate);

                    var dataBaseQuoteModel = DataBaseQuoteModel(
                      color: Colors.blue.value,
                      date: formattedCurrentDate,
                      quote: quote!,
                      author: author!,
                    );
                    BlocProvider.of<AddQuotesCubit>(context)
                        .addQuote(dataBaseQuoteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
