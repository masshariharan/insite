
class FleetModel {
  final List<FleetListData>? fleetDataList;

  const FleetModel({
    this.fleetDataList,
  });

  factory FleetModel.fromJson(Map<String, dynamic> json) {
    var list = json['fleetSummary']['fleetRecords'] as List;
    List<FleetListData>? dataList = list
        .map((i) => i == null ? null : FleetListData.fromJson(i))
        .cast<FleetListData>()
        .toList();

    return FleetModel(
      fleetDataList: dataList,
    );
  }

}

class FleetListData {
  final String? assetSerialNumber;
  final String? status;
  final String? customStateDescription;//custom asset state

  final String? lastReportedLocation;//location last reported
  final String? lastReportedTime;
  final double? hourMeter;
  final String? fuelReportedTime;
  final String? dealerName;

  FleetListData({
    this.assetSerialNumber,
    this.lastReportedTime,
    this.hourMeter,
    this.status,
    this.customStateDescription,
    this.lastReportedLocation,
    this.fuelReportedTime,
    this.dealerName
  });

  factory FleetListData.fromJson(Map<String, dynamic> json) {
    return FleetListData(
      assetSerialNumber: json["assetSerialNumber"],
      status: json["status"],
      customStateDescription: json["customStateDescription"],
      lastReportedLocation: json["lastReportedLocation"],
      lastReportedTime: json["lastReportedTime"],
      hourMeter: json["hourMeter"],
      fuelReportedTime: json["fuelReportedTime"],
      dealerName: json["dealerName"]
    );
  }
}




