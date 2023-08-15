import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WheelTile extends StatefulWidget {
  int starts, itemcount, selectedValue;
  final void Function(int) onSelectedValueChanged;
  WheelTile(
      {required this.starts,
      required this.itemcount,
      required this.onSelectedValueChanged,
      // required this.onSelected,
      required this.selectedValue});

  @override
  State<WheelTile> createState() => _WheelTileState();
}

class _WheelTileState extends State<WheelTile> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      overAndUnderCenterOpacity: 0.5,
      useMagnifier: true,
      onSelectedItemChanged: (value) {
        // widget.onSelected;

        setState(() {
          widget.selectedValue = value;
          widget.onSelectedValueChanged(value);
          print('Value:-$value');
        });
      },
      magnification: 1.4,
      itemExtent: 50,
      perspective: 0.005,
      diameterRatio: 1.1,
      physics: FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildBuilderDelegate(
        childCount: widget.itemcount,
        builder: (context, index) {
          final printValue = widget.starts + index;

          return Center(
            child: Text(
              printValue.toString(),
              style: TextStyle(
                fontSize: 40,
                color: widget.selectedValue == index
                    ? Colors.deepPurple
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}


// class _WheelTileState extends State<WheelTile> {
//   int selectedValue = 0;
//   @override
//   Widget build(BuildContext context) {
//     return ListWheelScrollView.useDelegate(
//         overAndUnderCenterOpacity: 0.5,
//         useMagnifier: true,
//         onSelectedItemChanged: (value) {
//           setState(() {
//             selectedValue = value;
//           });
//         },
//         magnification: 1.4,
//         itemExtent: 50,
//         perspective: 0.005,
//         diameterRatio: 1.1,
//         physics: FixedExtentScrollPhysics(),
//         childDelegate: ListWheelChildBuilderDelegate(
//           childCount: widget.itemcount,
//           builder: (context, index) {
//             widget.value++;
//             return Center(
//               child: Text(
//                 widget.value.toString(),
//                 style: TextStyle(
//                     fontSize: 40,
//                     color: selectedValue == index
//                         ? Colors.deepPurple
//                         : Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             );
//           },
//         ));
//   }
// }
