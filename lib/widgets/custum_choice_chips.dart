import 'package:flutter/material.dart';

class CustomChoiceChips extends StatefulWidget {
  final Map<String, IconData> choices;
  final String? selectedChoice;
  final Function(String)? onSelected;

  const CustomChoiceChips({
    Key? key,
    required this.choices,
    this.selectedChoice,
    this.onSelected,
  }) : super(key: key);

  @override
  _CustomChoiceChipsState createState() => _CustomChoiceChipsState();
}

class _CustomChoiceChipsState extends State<CustomChoiceChips> {
  String? selectedChoice;

  @override
  void initState() {
    super.initState();
    selectedChoice = widget.selectedChoice;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: (1 / .4),
      crossAxisCount: 1, // Display 1 chips in a row
      crossAxisSpacing: 8.0, // Spacing between chips horizontally
      mainAxisSpacing: 25.0, // Spacing between chips vertically
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: widget.choices.keys.map((choice) {
        return buildChoiceChip(
            choice, widget.choices[choice]!, selectedChoice == choice);
      }).toList(),
    );
  }

  Widget buildChoiceChip(String choice, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChoice = isSelected ? null : choice;
        });
        widget.onSelected!(selectedChoice!);
      },
      child: CircleAvatar(
        backgroundColor: isSelected ? Color(0xff7958FE) : Colors.grey[900],
        radius: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 90,
              color: Colors.white,
            ),
            Text(choice)
          ],
        ),
      ),
      // child: Container(
      //   decoration: BoxDecoration(
      //     color: isSelected ? Color(0xff7958FE) : Colors.grey[900],
      //     borderRadius: BorderRadius.circular(4.0),
      //   ),
      //   padding: EdgeInsets.all(8.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(
      //         icon,
      //         color: isSelected ? Colors.white : Colors.grey,
      //       ),
      //       SizedBox(width: 8.0),
      //       Text(
      //         choice,
      //         style: TextStyle(
      //           color: isSelected ? Colors.white : Colors.grey,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
