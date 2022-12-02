import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MarketStatsTable extends StatelessWidget {
  const MarketStatsTable({Key? key, required this.data}) : super(key: key);

  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        ///DATA
        for (int i = 0; i < data.length; i++)
          getTableDataRow(
              data[i], i % 2 == 0 ? AppColors.uiGray_20 : AppColors.bgWhite),
      ],
    );
  }

  TableRow getTableDataRow(List<String> rowValues, Color rowColor) {
    List<Widget> rowDataCells = [];
    rowDataCells.add(getTableKeyCell(rowValues[0]));
    rowDataCells.add(getTableValueCell(rowValues[1]));
    return TableRow(
        children: rowDataCells, decoration: BoxDecoration(color: rowColor));
  }

  Widget getTableKeyCell(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      alignment: Alignment.centerLeft,
      child: Text(
        value,
        style: AppTextStyles.bodyRegular.copyWith(color: AppColors.textGray_60),
      ),
    );
  }

  Widget getTableValueCell(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      alignment: Alignment.centerRight,
      child: Text(
        value,
        style:
            AppTextStyles.bodyRegular.copyWith(color: AppColors.textGray_100),
      ),
    );
  }
}
