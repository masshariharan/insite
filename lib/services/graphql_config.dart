
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:insite/model/fleet_model.dart';


class GraphQLConfiguration {

  String body=r"""
            query ($pageNumber:Int,$pageSize:Int){fleetSummary(pageNumber: $pageNumber, pageSize: $pageSize, startDateLocal: "", 
            endDateLocal: "", sort: "AssetSerialNumber", productfamily: "",
             model: "", assetstatus: "", fuelLevelPercentLT: "", 
             idleEfficiencyGT: null, idleEfficiencyLTE: null, assetIDContains: "", 
             latitude: null, longitude: null, radiuskm: null, 
             snContains: "", manufacturer: "", location: ""){
    fleetRecords{
      hourMeter,
      dealerName,
      assetSerialNumber,
      status,
      customStateDescription,
      lastReportedLocation,
      lastReportedTime,
      fuelReportedTime
    
    }
  }}
""";
   GraphQLClient client = GraphQLClient(
      link: HttpLink(
     'https://cloud.api.trimble.com/osg-in/gateway-gql-pre-prod/1.0/graphql',
        defaultHeaders: {
          "X-VisionLink-CustomerUid": "1857723c-ada1-11eb-8529-0242ac130003",
          "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjEifQ.eyJpc3MiOiJodHRwczovL2lkLnRyaW1ibGUuY29tIiwiZXhwIjoxNjYxOTUyNjAwLCJuYmYiOjE2NjE5NDkwMDAsImlhdCI6MTY2MTk0OTAwMCwianRpIjoiNmE4Y2Y5NWZkM2FmNDc0ZjhlMWQxZGYxZjkxMzNjODIiLCJqd3RfdmVyIjoyLCJzdWIiOiI3ZDhlZWFkOC1lNWE3LTQ1NmYtODdhYS1mYTY4YjFjZjM0NDIiLCJpZGVudGl0eV90eXBlIjoidXNlciIsImFtciI6WyJwYXNzd29yZCIsIm1mYSIsInNtc19tZmEiXSwiYXV0aF90aW1lIjoxNjYxNzU0MTg0LCJhenAiOiI4MjI1NmRmMS0zODk1LTQyYTMtYmU5My01ZDA0MDhiODUwYTYiLCJhdWQiOlsiODIyNTZkZjEtMzg5NS00MmEzLWJlOTMtNWQwNDA4Yjg1MGE2Il0sInNjb3BlIjoiT1NHLUlOLVBVTFNFLUFQUC1QUkUtUFJPRCJ9.c3r4Feo6Vm0P8Yk5uwk-g9HjNuIcDgqwHVjJ10XaRmqsPr_M8tHjVLeDFfDSIkze1ToYwK2nAgHYXza9FfX_4OdfNpihoNPZ_x05N1dZTUr-rQlwEMM5f3yDjJyc3Isij-rPoEyJn6ygnExCljsorawnxnb4xvfnSM6E27wx8Fbbq53U2W59ydfFCCjvJ6JABCoAWdbbAKDgi7RcythuNFbn7J0QdOVE6xfBpFpHTs6q9vDVgyq_UBe92dZAfdsWZ0mBcjz-EbCpCI26iu9tv7-9jDPvLh6I64IKG-4THWkscv862oeh3_bwGs_FU-KVvyRHBvTM1Jdr2yDxmqLTEw"
        }
   ),

  cache: GraphQLCache(store: HiveStore()),
    );


  Future<List<FleetListData>?> getData() async{

    QueryResult queryResult=await client.query(
        QueryOptions(
            document: gql(body
            ),
            variables: const {
              "pageNumber":1,
              "pageSize":10,
            }

        )
    );

    FleetModel fleetData=FleetModel.fromJson(queryResult.data!);

    return fleetData.fleetDataList;

  }

}




