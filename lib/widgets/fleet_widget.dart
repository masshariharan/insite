import 'package:flutter/material.dart';
import 'package:insite/model/fleet_model.dart';
import 'package:insite/utils/colors.dart';

class CustomContainerBox extends StatefulWidget {
  const CustomContainerBox({
    Key? key,required this.widget,required this.onTap,required this.fleetListData
  }) : super(key: key);
  final Widget? widget;
  final void Function()? onTap;
  final FleetListData? fleetListData;
  @override
  State<CustomContainerBox> createState() => _CustomContainerBoxState();
}

class _CustomContainerBoxState extends State<CustomContainerBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colour.kGrey,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap:widget.onTap,
                            child: Image.asset('assets/icons/downArrow.png')),
                        Image.asset('assets/icons/rectangle.png'),
                      ],
                    ),
                  ),
                  Container(
                    width: 2,
                    color:  Colour.kBorderLine,
                  ),
                  Expanded(
                    child: Table(
                      border: const TableBorder(
                          horizontalInside: BorderSide(color: Colour.kBorderLine, width: 2),
                          verticalInside: BorderSide(color: Colour.kBorderLine, width: 2)),
                      children:  [
                        TableRow(
                            children: [
                              ListTile(
                                dense:true,
                                contentPadding: const EdgeInsets.only(left: 10,top:7),
                                leading: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colour.kWhite,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                                      child: Image.asset('assets/images/img.png'),
                                    )),
                                title: Transform.translate(
                                  offset: const Offset(-10, 0),
                                  child: const Text('TATA HITACHI SHINRAI BX80',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colour.kWhite
                                    ),),
                                ),
                              ),
                               ReusableListTile(
                                titleText: 'Last Known Status',
                                subTitleText:'${widget.fleetListData!.status}',
                              ),
                            ]
                        ),
                         TableRow(
                            children: [
                              ListTile(
                                dense:true,
                                contentPadding: const EdgeInsets.only(left: 10,top:7),
                                leading: const Text('Serial No . ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colour.kWhite
                                    )),
                                title: Transform.translate(
                                  offset: const Offset(-10, 0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 1.0, color: Colour.kOrange),
                                      ),
                                    ),
                                    child: Text('${widget.fleetListData!.assetSerialNumber}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colour.kOrange
                                      ),),
                                  ),
                                ),
                              ),
                               ReusableListTile(
                                titleText: 'Custom Asset State',
                                subTitleText:'${widget.fleetListData!.customStateDescription}',
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            widget.widget!
          ],
        )
    );
  }
}

class MoreDetails extends StatelessWidget {
 const MoreDetails({
    Key? key,required this.fleetListData
  }) : super(key: key);

 final FleetListData? fleetListData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          color: Colour.kBorderLine,
        ),
        Table(
          border: const TableBorder(
              horizontalInside: BorderSide(color: Colour.kBorderLine, width: 2),
              verticalInside: BorderSide(color: Colour.kBorderLine, width: 2)),
          children: [
            TableRow(
                children: [
                  ReusableListTile(
                    titleText: 'Location-Last Reported',
                    subTitleText: '${fleetListData!.lastReportedLocation}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Expanded(
                        child: ReusableListTile(
                          titleText: 'Last Reported Time',
                          subTitleText: '${fleetListData!.lastReportedTime}',
                        ),
                      ),
                      Container(
                        height: 68,
                        width: 2,
                        color: Colour.kBorderLine,
                      ),
                       Expanded(
                        child: ReusableListTile(
                          titleText: 'Hr Meter',
                          subTitleText: '${fleetListData!.hourMeter} Hrs',
                        ),
                      )
                    ],
                  )
                ]
            ),
            TableRow(
                children: [
                  const ReusableListTile(
                    titleText: 'Location',
                    subTitleText: '-',
                  ),
                  ListTile(
                    dense:true,
                    contentPadding: const EdgeInsets.only(left: 10,),
                    title: const Text('Signal Strength',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colour.kWhite
                        )),
                    subtitle: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset('assets/icons/signal.png',height: 10,width: 10,)),
                  ),

                ]
            ),
             TableRow(
                children: [
                  ReusableListTile(
                    titleText: 'Fuel-Last Reported',
                    subTitleText:'${fleetListData!.fuelReportedTime}',
                  ),
                  const ReusableListTile(
                    titleText: 'Fuel Level%',
                    subTitleText:'45%',
                  )

                ]
            ),
            const TableRow(
                children: [
                  ReusableListTile(
                    titleText: 'Network Provider',
                    subTitleText:'Vodafone',
                  ),
                  ReusableListTile(
                    titleText: 'Customer Name',
                    subTitleText:'-',
                  )

                ]
            ),
             TableRow(
                children: [
                  const ReusableListTile(
                    titleText:'Asset Commissioning Date',
                    subTitleText:'08/02/2020',
                  ),
                  ReusableListTile(
                    titleText:'Dealer Name',
                    subTitleText:'${fleetListData!.dealerName}',
                  )

                ]
            ),
          ],
        )
      ],
    );
  }
}

class ReusableListTile extends StatelessWidget {
  const ReusableListTile({
    Key? key,required this.titleText, required this.subTitleText
  }) : super(key: key);

  final String? titleText;
  final String? subTitleText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense:true,
      contentPadding: const EdgeInsets.only(left: 10,),
      title: Text(titleText!,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colour.kWhite
          )),
      subtitle: Text(subTitleText!,
          style: const TextStyle(
              fontSize: 12,
              color: Colour.kWhite
          )),
    );
  }
}