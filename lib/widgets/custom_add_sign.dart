import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Corrected import
import 'package:quotes_app/views/add_quotes_view.dart';

class CustomAddSign extends StatelessWidget {
  const CustomAddSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddQuotesView(),
              ),
            );
          },
          icon: const Icon(FontAwesomeIcons.plus),
          color: Colors.black,
        ),
      ),
    );
  }
}
