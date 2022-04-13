import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import '../api/All_get_api.dart';
import '../model/Oshipment.dart';
import '../model/user.dart';
import 'detailPages/shipmentdetails.dart';

class ShipmentData extends StatefulWidget {
  const ShipmentData({Key? key}) : super(key: key);

  @override
  State<ShipmentData> createState() => _ShipmentDataState();
}

class _ShipmentDataState extends State<ShipmentData> {
  @override
  Widget build(BuildContext context) {
    var data = "http://172.29.1.208:2016/api/CustomerDetails/121";
    var api = getData();
    var apiData = api.fetchUsers(data);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          "ShipmentData Page",
          textScaleFactor: 1.2,
        )),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder<List<User>>(
              future: apiData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DataTable2(
                       columnSpacing: 10,
                      // horizontalMargin: 30,
                      // minWidth: 100,
                      columns: const [
                        DataColumn2(
                          label: Text('DELIVERY NO.'),
                          size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('STATUS'),
                           size: ColumnSize.M,
                        ),
                        DataColumn2(
                          label: Text('DELIVERY DATE'),
                           size: ColumnSize.L,
                          numeric: true,
                        ),
                        DataColumn2(
                          label: Text('SHIP TO ADDRESS'),
                           size: ColumnSize.M,
                          numeric: true,
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          snapshot.data![0].userShipment!.oShipment!.length, (index) {
                        var user = (snapshot.data as List<User>)[0];
                        final userShipment =
                            user.userShipment!.oShipment as List<OShipment>;

                        return DataRow(cells: [
                          DataCell(
                            Text('${userShipment[index].dELIERYNAME}'),
                            onTap: () {
                              print("pressed${index}");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShipmentDetail(
                                            itemIndex: index,
                                          )));
                            },
                          ),
                          DataCell(Text('${userShipment[index].sTATUSNAME}')),
                          DataCell(
                              Text('${userShipment[index].dELIERYNAME}-items')),
                          DataCell(Text('${userShipment[index].shipToAddress}')),
                        ]);
                      }));
                }
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
