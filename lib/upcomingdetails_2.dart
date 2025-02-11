
// import 'package:avoota/apiservice.dart';
// import 'package:avoota/tableFilters.dart';
// import 'package:avoota/upcomingbookings.dart';
// import 'package:flutter/material.dart';

// class UpcomingBookings extends StatefulWidget {
//   @override
//   _UpcomingBookingsState createState() => _UpcomingBookingsState();
// }

// class _UpcomingBookingsState extends State<UpcomingBookings> {
//   List<bool> _selectedRows =
//       List<bool>.generate(5, (index) => false); // Track row selection
//   int currentPage = 1;
//   int totalEntries = 25; // Total number of bookings
//   int entriesPerPage = 5; // Number of entries per page
// Widget _currentPage = Center(
   
//   ); 

//   // Default entries per page
//   String searchQuery = ""; // Search filter

//   void _updateEntries(int entries) {
//     setState(() {
//       entriesPerPage = entries;
//     });
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _selectedRows = List<bool>.generate(entriesPerPage, (index) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     int totalPages = (totalEntries / entriesPerPage).ceil();
//     int startEntry = ((currentPage - 1) * entriesPerPage) + 1;
//     int endEntry = (startEntry + entriesPerPage - 1).clamp(0, totalEntries);

//     return Container(
//         margin: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
          
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Upcoming Bookings",
//                       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   "Dashboard / Upcoming Bookings",
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: const Color.fromARGB(255, 59, 99, 243)),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment
//                       .spaceBetween, // Distribute the space evenly
//                   children: [
//                     // Wrap for date filters and bulk actions
//                     Wrap(
//                       spacing: 10, // Space between elements
//                       runSpacing: 10, // Space between rows when wrapping
//                       children: [
//                         _dateFilterField(
//                           "From Date",
//                           screenWidth,
//                           _fromDateController,
//                         ),
//                         _dateFilterField(
//                           "To Date",
//                           screenWidth,
//                           _toDateController,
//                         ),
//                         _dropdownField("Bulk Actions", screenWidth),
//                       ],
//                     ),
            
//                     // Download Reports button
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor:
//                             const Color(0xFF003572), // Background color
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 30,
//                             vertical:
//                                 20), // Adjust padding to increase button size
//                         minimumSize: Size(200,
//                             60), // Set minimum width and height // Padding for the button
//                         shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.circular(30), // Rounded corners
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize
//                             .min, // Ensures the row takes minimum space needed
//                         children: [
//                           Text(
//                             "Download Reports",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold, // Bold text
//                             ),
//                           ),
//                           SizedBox(
//                               width:
//                                   8), // Optional: add space between text and icon
//                           Icon(
//                             Icons.arrow_drop_down,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
            
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: TableFilters(
//                     onEntriesChanged: _updateEntries,
//                     onSearchChanged: _updateSearch,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 SingleChildScrollView(
//                   scrollDirection: Axis
//                       .horizontal, // Enable horizontal scrolling for the table
//                   child: Center(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                             color: Color(0xFFD4D4D4),
//                             width: 2.0), // Four-sided border
//                         borderRadius: BorderRadius.circular(
//                             8.0), // Optional rounded corners
//                       ),
//                       child: DataTable(
//                         headingRowColor: WidgetStateProperty.resolveWith<Color>(
//                           (states) => const Color(0xFFE4F0FF),
//                         ),
//                         columns: [
//                           // Master checkbox in the header
//                           DataColumn(
//                             label: Center(
//                               child: Checkbox(
//                                 value: _selectedRows.every((selected) =>
//                                     selected), // Check if all rows are selected
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     // Select or deselect all rows based on the checkbox state
//                                     _selectedRows = List<bool>.generate(
//                                         5, (index) => value ?? false);
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                           DataColumn(
//                               label: Expanded(
//                             child: Text(
//                               "S.No",
//                               textAlign: TextAlign.center,
//                             ),
//                           )),
//                           DataColumn(
//                               label: Expanded(
//                             child: Text(
//                               "Booking ID",
//                               textAlign: TextAlign.center,
//                             ),
//                           )),
//                           DataColumn(
//                               label: Expanded(
//                             child: Text(
//                               "Guest Name",
//                               textAlign: TextAlign.center,
//                             ),
//                           )),
//                           DataColumn(
//                               label: Expanded(
//                             child: Text(
//                               "Phone",
//                               textAlign: TextAlign.center,
//                             ),
//                           )),
//                           DataColumn(
//                               label: Expanded(
//                             child: Text(
//                               "Updated At",
//                               textAlign: TextAlign.center,
//                             ),
//                           )),
//                           DataColumn(
//                               label: Expanded(
//                             child: Text(
//                               "Actions",
//                               textAlign: TextAlign.center,
//                             ),
//                           )),
//                         ],
//                         rows: List.generate(5, (index) {
//                           return DataRow(
//                             selected: _selectedRows[
//                                 index], // Mark the row as selected if the checkbox is true
//                             cells: [
//                               DataCell(
//                                 Center(
//                                   child: Checkbox(
//                                     value: _selectedRows[
//                                         index], // Bind the row checkbox to the selected state
//                                     onChanged: (bool? value) {
//                                       setState(() {
//                                         _selectedRows[index] = value ?? false;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               DataCell(Center(child: Text("${index + 1}"))),
//                               DataCell(Center(child: Text("TJS207601102940 "))),
//                               DataCell(Center(child: Text("User ${index + 1}"))),
//                               DataCell(Center(child: Text("80XXXXXXXX"))),
//                               DataCell(Center(child: Text("18/11/2024"))),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     TextButton.icon(
//                                       onPressed: () {
//                                        Navigator.push(context,
//                                        MaterialPageRoute(builder: (context)=> UpcomingBookingDetails()));
//                                       },
//                                       icon: Icon(Icons.visibility,
//                                           color: Colors.blue),
//                                       label: Text("View"),
//                                     ),
//                                     TextButton.icon(
//                                       onPressed: () {},
//                                       icon: Icon(Icons.download,
//                                           color: const Color.fromARGB(
//                                               255, 2, 75, 136)),
//                                       label: Text("Download"),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     // Text(
//                     //     "Showing $startEntry to $endEntry of $totalEntries entries"),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Color(0xFFD0D5DD),
//                                   width: 2.0), // Border color and width
//                               borderRadius: BorderRadius.circular(
//                                   8.0), // Optional: Rounded corners
//                             ),
//                             child: TextButton(
//                               onPressed: currentPage > 1
//                                   ? () {
//                                       setState(() {
//                                         currentPage--;
//                                         _updateSelectionState();
//                                       });
//                                     }
//                                   : null,
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.arrow_back),
//                                   Text("Previous"),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),
//                           Text(
//                             "$currentPage",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(width: 10),
//                           Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: Color(0xFFD0D5DD),
//                                   width: 2.0), // Border color and width
//                               borderRadius: BorderRadius.circular(
//                                   8.0), // Optional: Rounded corners
//                             ),
//                             child: TextButton(
//                               onPressed: currentPage < totalPages
//                                   ? () {
//                                       setState(() {
//                                         currentPage++;
//                                         _updateSelectionState();
//                                       });
//                                     }
//                                   : null,
//                               child: Row(
//                                 children: [
//                                   Text("Next"),
//                                   Icon(Icons.arrow_forward),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }

//   TextEditingController _fromDateController =
//       TextEditingController(); // Controller for 'From Date'
//   TextEditingController _toDateController =
//       TextEditingController(); // Controller for 'To Date'

//   Widget _dateFilterField(
//       String hint, double screenWidth, TextEditingController controller) {
//     return SizedBox(
//         width: screenWidth > 600
//             ? 200
//             : double.infinity, // Use full width for smaller screens
//         child: TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             hintText: hint,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             suffixIcon: IconButton(
//               icon: Icon(Icons.calendar_today),
//               onPressed: () async {
//                 // Use context directly from the build method
//                 DateTime? selectedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2100),
//                 );
//                 if (selectedDate != null) {
//                   controller.text = "${selectedDate.toLocal()}".split(' ')[0];
//                 }
//               },
//             ),
//           ),
//         ));
//   }

//   Widget _dropdownField(String hint, double screenWidth) {
//     return SizedBox(
//       width: screenWidth > 600
//           ? 200
//           : double.infinity, // Use full width for smaller screens
//       child: DropdownButtonFormField<String>(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//         ),
//         items: ["Option 1", "Option 2", "Option 3"]
//             .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//             .toList(),
//         onChanged: (value) {},
//         hint: Text(hint),
//       ),
//     );
//   }

//   void _updateSelectionState() {
//     _selectedRows = List<bool>.generate(entriesPerPage, (index) => false);
//   }
// }  UpcomingBookings    Upcoming Bookings 

import 'package:avoota/apiservice.dart';
import 'package:avoota/booking_details.dart';
import 'package:avoota/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:avoota/tableFilters.dart';


class UpcomingBookings extends StatefulWidget {
  final void Function(Widget) onPageChange;

  const UpcomingBookings({super.key, required this.onPageChange});
  @override
  _UpcomingBookingsState createState() => _UpcomingBookingsState();
}

class _UpcomingBookingsState extends State<UpcomingBookings> {
  List<bool> _selectedRows = [];
  int currentPage = 1;
  int entriesPerPage = 5;
  String searchQuery = "";
  final ApiService _apiService = ApiService();
  TextEditingController _fromDateController = TextEditingController();
  TextEditingController _toDateController = TextEditingController();
  List<Booking> _bookings = [];
  List<Booking> _filteredBookings = [];

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    try {
      List<Booking>? transactions = await _apiService.getAllhBookings("upcoming");
      if (transactions != null) {
        setState(() {
          _bookings = transactions;
          _filteredBookings = transactions;
          _selectedRows = List<bool>.generate(transactions.length, (index) => false);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error fetching bookings: $e')));
    }
  }

  void _applyFilters() {

    List<Booking> filtered = _bookings;
    if (_fromDateController.text.isNotEmpty && _toDateController.text.isNotEmpty) {
      DateTime fromDate = DateTime.parse(_fromDateController.text);
      DateTime toDate = DateTime.parse(_toDateController.text);

      filtered = filtered.where((transaction) {
        DateTime? bookingDate = transaction.createdTime;
        if (bookingDate == null) return false;
        return bookingDate.isAfter(fromDate.subtract(Duration(days: 1))) && 
         bookingDate.isBefore(toDate.add(Duration(days: 1)));
      }).toList();
    }


    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((transaction) {
        return transaction.bookingId.contains(searchQuery)||
               transaction.fullName.contains(searchQuery) ||
               transaction.contact.contains(searchQuery) ;
      }).toList();

    }
    setState(() {
      _filteredBookings = filtered;
      currentPage = 1; 
    });
  }

  void _updateEntries(int entries) {
    setState(() {
      entriesPerPage = entries;
      currentPage = 1;
    });
  }

  void _updateSearch(String query) {
    setState(() {
      searchQuery = query;
      _applyFilters();
    });
  }

 

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int totalPages = (_filteredBookings.length / entriesPerPage).ceil();
    int startEntry = ((currentPage - 1) * entriesPerPage);
    int endEntry = (startEntry + entriesPerPage).clamp(0, _filteredBookings.length);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Upcoming Bookings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Dashboard / Upcoming Bookings", style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 59, 99, 243))),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _dateFilterField("From Date", screenWidth, _fromDateController),
                          _dateFilterField("To Date", screenWidth, _toDateController,applyFilter:true),
                          _dropdownField("Bulk Actions", screenWidth),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF003572),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          minimumSize: Size(200, 60),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Download Reports", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_drop_down, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TableFilters(onEntriesChanged: _updateEntries, onSearchChanged: _updateSearch),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                      child: Container(
                         width: MediaQuery.of(context).size.width * 0.78,  // Adjust width to your preference
                        // height: 300, // Fixed table height
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD4D4D4), width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DataTable(
                          columnSpacing: 20,
                          headingRowColor: MaterialStateProperty.resolveWith<Color>(
                            (states) => const Color(0xFFE4F0FF),
                          ),
                          columns: [
          DataColumn(label: SizedBox(width: 50, child: Center(child: Text("S.No")))),
          DataColumn(label: SizedBox(width: 120, child: Center(child: Text("Booking ID")))),
          DataColumn(label: SizedBox(width: 150, child: Center(child: Text("Guest Name")))),
          DataColumn(label: SizedBox(width: 100, child: Center(child: Text("Phone")))),
          DataColumn(label: SizedBox(width: 150, child: Center(child: Text("Updated At")))),
        //  DataColumn(label: SizedBox(width: 100, child: Center(child: Text("Amount")))),
          DataColumn(label: SizedBox(width: 120, child: Center(child: Text("Actions")))),
        ],
                          rows: List.generate(endEntry - startEntry, (index) {
                            final booking = _filteredBookings[startEntry + index];
                            return DataRow(
                              selected: _selectedRows[index],
                              cells: [
              DataCell(SizedBox(width: 50, child: Center(child: Text("${startEntry + index + 1}")))),
              DataCell(SizedBox(
                width: 120,
                child: Center(child: Text(booking.bookingId, overflow: TextOverflow.ellipsis)),
              )),
              DataCell(SizedBox(
                width: 150,
                child: Center(child: Text(booking.fullName, overflow: TextOverflow.ellipsis)),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Center(child: Text(booking.contact, overflow: TextOverflow.ellipsis)),
              )),
              DataCell(SizedBox(
                width: 150,
                child: Center(child: Text(booking.createdTime != null
                                    ? "${booking.createdTime!.day}/${booking.createdTime!.month}/${booking.createdTime!.year}"
                                    : "N/A",)),
              )),
             // DataCell(SizedBox(
             //   width: 100,
             //  child: Center(child: Text("${transaction.amount?.toStringAsFixed(2) ?? "N/A"}")),
             // )),
              DataCell(SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.visibility, color: Colors.blue),
                      onPressed: () {
                                      widget.onPageChange(BookingDetailsScreen(
                                        bookingId: booking.bookingId,
                                        
                                      ));
                                    },
                    ),
                  ],
                ),
              )),
            ],
          );
        }),
      ),
    ),
  ),
),
               //   SizedBox(height: 10),
                  // Add Total Amount as a row in the table
               //   Container(
               //     padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              //      color: const Color(0xFFE4F0FF),
               //     child: Row(
                 //     mainAxisAlignment: MainAxisAlignment.end,
                   //   children: [
                     //   Text(
                 //         "Total Amount: ${totalAmount.toStringAsFixed(2)}",
                   //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     //   ),
          //            ],
            //        ),
              //    ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFD0D5DD), width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextButton(
                                onPressed: currentPage > 1 ? () => setState(() => currentPage--) : null,
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back),
                                    Text("Previous"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("$currentPage", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFD0D5DD), width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextButton(
                                onPressed: currentPage < totalPages ? () => setState(() => currentPage++) : null,
                                child: Row(
                                  children: [
                                    Text("Next"),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateFilterField(String hint, double screenWidth, TextEditingController controller,{bool applyFilter = false}) {
    return SizedBox(
      width: screenWidth > 600 ? 200 : double.infinity,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (selectedDate != null) {
                controller.text = "${selectedDate.toLocal()}".split(' ')[0];
                if (applyFilter) _applyFilters();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _dropdownField(String hint, double screenWidth) {
    return SizedBox(
      width: screenWidth > 600 ? 200 : double.infinity,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(border: OutlineInputBorder()),
        items: ["Option 1", "Option 2", "Option 3"]
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: (value) {},
        hint: Text(hint),
      ),
    );
  }
}
