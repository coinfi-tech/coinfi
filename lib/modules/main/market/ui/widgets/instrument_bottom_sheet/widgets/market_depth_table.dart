import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class MarketDepthTable extends StatelessWidget {
  const MarketDepthTable(
      {Key? key,
      required this.columnNames,
      required this.data,
      this.cellTextColor = AppColors.uiGray_80})
      : super(key: key);

  final List<String> columnNames;
  final List<List<String>> data;
  final Color cellTextColor;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        ///HEADER
        getTableHeaderRow(columnNames),

        ///DATA
        for (List<String> rowValues in data) getTableDataRow(rowValues),
      ],
    );
  }

  TableRow getTableHeaderRow(List<String> columnNames) {
    List<Widget> tableHeaderCells = [];
    tableHeaderCells
        .add(getTableHeaderCell(columnNames[0], Alignment.centerLeft));
    tableHeaderCells
        .add(getTableHeaderCell(columnNames[1], Alignment.centerRight));
    return TableRow(children: tableHeaderCells);
  }

  TableRow getTableDataRow(List<String> rowValues) {
    List<Widget> rowDataCells = [];
    rowDataCells.add(getTableDataCell(rowValues[0], Alignment.centerLeft));
    rowDataCells.add(getTableDataCell(rowValues[1], Alignment.centerRight));
    return TableRow(children: rowDataCells);
  }

  Widget getTableHeaderCell(String columnName, Alignment alignment) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      alignment: alignment,
      child: Text(
        columnName,
        style: AppTextStyles.bodySmall.copyWith(color: AppColors.textGray_60),
      ),
    );
  }

  Widget getTableDataCell(String value, Alignment alignment) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      alignment: alignment,
      child: Text(
        value,
        style: AppTextStyles.bodySmall.copyWith(color: cellTextColor),
      ),
    );
  }
}
