//white fade table
// DataTable(
//   headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[300]!), // Color for heading row
//   columns: <DataColumn>[
//     DataColumn(
//       label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold)),
//     ),
//     DataColumn(
//       label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
//     ),
//   ],
//   rows: data
//       .asMap() // Using asMap() to access index for alternate row colors
//       .entries
//       .map(
//         (entry) => DataRow(
//           color: MaterialStateColor.resolveWith((states) => entry.key % 2 == 0 ? Colors.grey[100]! : Colors.white), // Alternate row colors
//           cells: <DataCell>[
//             DataCell(
//               Text(
//                 entry.value.answer.toString(),
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//             ),
//             DataCell(
//               Text(
//                 entry.value.frequency.toString(),
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ],
//         ),
//       )
//       .toList(),
// )


//table colum white text
// DataTable(
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.black), // Add border around the table
//     borderRadius: BorderRadius.circular(10), // Add rounded corners to the table
//   ),
//   columns: <DataColumn>[
//     DataColumn(
//       label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//     ),
//     DataColumn(
//       label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//     ),
//   ],
//   rows: data
//       .map(
//         (item) => DataRow(
//           color: MaterialStateColor.resolveWith((states) => Colors.transparent), // Remove default row color
//           cells: <DataCell>[
//             DataCell(
//               Text(
//                 item.answer.toString(),
//                 style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
//               ),
//             ),
//             DataCell(
//               Text(
//                 item.frequency.toString(),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       )
//       .toList(),
// )
