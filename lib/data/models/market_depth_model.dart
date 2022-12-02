class MarketDepthModel {
  final List<BidDataModel> bidData;
  final List<AskDataModel> askData;
  MarketDepthModel(this.bidData, this.askData);
  List<List<String>> getBidTableData() {
    List<List<String>> data = [];
    for (BidDataModel bidDataModel in bidData) {
      data.add(bidDataModel.getBidRowData());
    }
    return data;
  }

  List<List<String>> getAskTableData() {
    List<List<String>> data = [];
    for (AskDataModel askDataModel in askData) {
      data.add(askDataModel.getAskRowData());
    }
    return data;
  }
}

class BidDataModel {
  final double bidValue;
  final double quantity;
  BidDataModel(this.bidValue, this.quantity);
  List<String> getBidRowData() {
    List<String> rowData = [];
    rowData.add(bidValue.toStringAsFixed(2));
    rowData.add(quantity.toStringAsFixed(2));
    return rowData;
  }
}

class AskDataModel {
  final double askValue;
  final double quantity;
  AskDataModel(this.askValue, this.quantity);
  List<String> getAskRowData() {
    List<String> rowData = [];
    rowData.add(askValue.toStringAsFixed(2));
    rowData.add(quantity.toStringAsFixed(2));
    return rowData;
  }
}
