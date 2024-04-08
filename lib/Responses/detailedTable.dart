import 'package:flutter/material.dart';

import '../apis.dart';
import '../model.dart';

class detailedTable extends StatefulWidget {
  const detailedTable({super.key});

  @override
  State<detailedTable> createState() => _detailedTableState();
}

late Future<List<Detailed>> detailedResponse;

class _detailedTableState extends State<detailedTable> {
  @override
  void initState() {
    detailedResponse = Api().getDetailedResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Detailed>>(
      future: detailedResponse,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  const Color.fromARGB(
                    255,
                    245,
                    250,
                    253,
                  ),
                ),
                strokeWidth: 4,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          );
        } else {
          List<dynamic> data = snapshot.data!;
          
          return Container(
            height: 450,
            width: 800,
            child: SingleChildScrollView(
                child: DataTable(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(
                        255, 255, 254, 254)), // Add border around the table
                borderRadius: BorderRadius.circular(
                    10), // Add rounded corners to the table
              ),
              columns: <DataColumn>[
                DataColumn(
                  label: Text('UserName',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Contact',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                DataColumn(
                  label: Text('Answer',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ],
              rows: data
                  .map(
                    (item) => DataRow(
                      color: MaterialStateColor.resolveWith((states) =>
                          Color.fromARGB(
                              0, 197, 22, 22)), // Remove default row color
                      cells: <DataCell>[
                        DataCell(
                          Text(
                            item.name.toString(),
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            item.contact.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            item.response.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            )),
          );
        }
      },
    );
  }
}
