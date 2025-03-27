import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/cubit/add_quote_cubit/add_quotes_cubit.dart';
import 'package:quotes_app/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int selectedColorIndex = 0;
  List<Color> colors = [
    const Color(0xff6B4B3E),
    const Color(0xffC49E85),
    const Color(0xffFFD6AF),
    const Color(0xffF8F4F9),
    const Color(0xffBEA7E5),
    const Color(0xff7A6C5D),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2, // 38 is the radius of the circle
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) // index here is the index of each item in the list
            {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                selectedColorIndex =
                    index; // assigning the index of the item to the selectedColorIndex

                BlocProvider.of<AddQuotesCubit>(context).color =
                    colors[index]; // changing the color of the quote

                setState(() {});
              },
              child: ColorItem(
                color: colors[index], // the color of the item
                isActive: selectedColorIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
