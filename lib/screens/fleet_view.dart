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








