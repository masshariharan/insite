import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:insite/model/fleet_model.dart';
import 'package:insite/services/graphql_config.dart';
import 'package:insite/utils/colors.dart';
import 'package:insite/widgets/fleet_widget.dart';

class FleetView extends StatefulWidget {
  const FleetView({Key? key}) : super(key: key);

  @override
  State<FleetView> createState() => _FleetViewState();
}

class _FleetViewState extends State<FleetView> {

  bool dataShow=false;

  List<FleetListData> fleetRecord = [];

    final HttpLink _httpLink=HttpLink(
       'https://spotify-graphql-server.herokuapp.com/graphql',
        defaultHeaders: {
          "X-VisionLink-CustomerUid": "1857723c-ada1-11eb-8529-0242ac130003",
          "Authorization":"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjEifQ.eyJpc3MiOiJodHRwczovL2lkLnRyaW1ibGUuY29tIiwiZXhwIjoxNjYxOTQ4MzA2LCJuYmYiOjE2NjE5NDQ3MDYsImlhdCI6MTY2MTk0NDcwNiwianRpIjoiZDhlYWEzMGI2NzE2NDEwNmI4ZjdlMzdiZjYwYjg2MmEiLCJqd3RfdmVyIjoyLCJzdWIiOiI3ZDhlZWFkOC1lNWE3LTQ1NmYtODdhYS1mYTY4YjFjZjM0NDIiLCJpZGVudGl0eV90eXBlIjoidXNlciIsImFtciI6WyJwYXNzd29yZCIsIm1mYSIsInNtc19tZmEiXSwiYXV0aF90aW1lIjoxNjYxNzU0MTg0LCJhenAiOiI4MjI1NmRmMS0zODk1LTQyYTMtYmU5My01ZDA0MDhiODUwYTYiLCJhdWQiOlsiODIyNTZkZjEtMzg5NS00MmEzLWJlOTMtNWQwNDA4Yjg1MGE2Il0sInNjb3BlIjoiT1NHLUlOLVBVTFNFLUFQUC1QUkUtUFJPRCJ9.jAfTd0ItwgQAQYL00smbsm_YxPFBZsNnSHDebL4CDuu_2vp676yEJ6D-SUTcADx5JNIbYpjSU2OOJfHJifxo4HD0i9JBOvwqAHOxzrmsYnu81B0vxw_o2Yq9fPB28jy7yoWlvlgd-djY-BXmSwPpw8ddUFdCN2sRP2UjD1eHrQ8eD0MWO2U1fH2TxPfGsMqcWs5EgcBYy_C2xt9KExHupOyma0J-T822F_4AKdGZ3weYyauJNZhmvNQfsRAPSLamRJYuEmDSjOfMLxt50mXu4RMHaEdAInwyGTt0whb1nBAnRihTC3gYXbnn-8zBezhnaKzQW9T161tPcJjKxoEcmw"
        }
   );

   GraphQLConfiguration graphQLConfiguration=GraphQLConfiguration();

   GraphQLClient? _client ;

  @override
  void initState() {

    getFleetRecord();

    super.initState();
  }

  Future getFleetRecord() async {
    try {
      return await graphQLConfiguration.getData().then((data) {
        setState(() {
          fleetRecord = data!;
        });
      });
    } catch (error) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            graphQLConfiguration.getData();
            //print(fleetRecord[0].dealerName);
          }
      ),
      backgroundColor: Colour.kDarkGrey,
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset('assets/icons/menu.png'),
        title: Image.asset('assets/logo/insite.png'),
        actions: [
          Image.asset('assets/icons/filter.png'),
          Image.asset('assets/icons/search.png')
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: fleetRecord.length,
            itemBuilder: (context,index){
              FleetListData fleetListData =
              fleetRecord[index];
              return  Padding(
                padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
                child:CustomContainerBox(
                  fleetListData: fleetListData,
                  onTap: (){
                    setState(() {
                      if(dataShow==false){
                        dataShow=true;
                      }else if(dataShow==true){
                        dataShow=false;
                      }
                    });
                  },
                  widget: dataShow? MoreDetails(
                    fleetListData: fleetListData,
                  )
                      :Container(),
                ),
              );
            }),
      ),
    );
  }
}








