import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final List<Map<String, dynamic>> tableData;

  final selectedMuscleType;
  Details({
    super.key,
    required this.selectedMuscleType,
    required this.tableData,
  });
  @override
  Widget build(BuildContext context) {
    // Sort the tableData based on the date in descending order (from endDate to startDate)
    tableData.sort((a, b) => b['Date'].compareTo(a['Date']));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calories Burned Log'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: DataTable(
          horizontalMargin: 5,
          columns: [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Muscle Type')),
            DataColumn(label: Text('Calories Burned')),
          ],
          rows: tableData
              .map(
                (data) => DataRow(
                  cells: [
                    DataCell(Text(data['Date'])),
                    DataCell(Text(selectedMuscleType)),
                    DataCell(Text(data['Total'].toString())),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
