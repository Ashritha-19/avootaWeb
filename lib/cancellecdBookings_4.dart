// import 'package:avoota/cancelledbookings.dart';
// import 'package:flutter/material.dart';
// import 'package:avoota/apiservice.dart';
// import 'package:avoota/tableFilters.dart';
// import 'package:avoota/booking.dart';

// class CancelledBookings extends StatefulWidget {
//   final void Function(Widget) onPageChange; // Callback for page change
//   CancelledBookings({required this.onPageChange});
//   @override
//   _CancelledBookingsState createState() => _CancelledBookingsState();
// }

// class _CancelledBookingsState extends State<CancelledBookings> {
//   final ApiService _apiService = ApiService();
//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();

//   List<Booking> _bookings = [];
//   List<Booking> _filteredBookings = [];
//   List<bool> _selectedRows = [];
//   int currentPage = 1;
//   int entriesPerPage = 5;
//   String searchQuery = "";

//   @override
//   void initState() {
//     super.initState();
//     _fetchBookings();
//   }

//   Future<void> _fetchBookings() async {
//     try {
//       List<Booking> bookings = await _apiService.getAllUpcomingBookings();
//       setState(() {
//         _bookings = bookings;
//         _applyFilters();
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching bookings: $e')),
//       );
//     }
//   }

//   void _applyFilters() {
//     setState(() {
//       _filteredBookings = _bookings
//           .where((booking) =>
//               booking.name!.toLowerCase().contains(searchQuery.toLowerCase()))
//           .toList();
//       _selectedRows = List<bool>.generate(_filteredBookings.length, (index) => false);
//     });
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       _applyFilters();
//     });
//   }

//   void _updateEntries(int entries) {
//     setState(() {
//       entriesPerPage = entries;
//     });
//   }

//   Future<void> _selectDate(TextEditingController controller) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         controller.text = pickedDate.toIso8601String().split('T').first;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     int totalEntries = _filteredBookings.length;
//     int totalPages = (totalEntries / entriesPerPage).ceil();
//     int startEntry = (currentPage - 1) * entriesPerPage;
//     int endEntry = (startEntry + entriesPerPage).clamp(0, totalEntries);

//     return Container(
//       margin: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 40),
//               Row(
//                 children: [
//                   Text(
//                     "Canceeled Bookings",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Row(
//                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _dateFilterField("From Date", _fromDateController),
//                   SizedBox(width: 10),
//                   _dateFilterField("To Date", _toDateController),
//                   SizedBox(width: 600),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue, // Changed button color to blue
//         foregroundColor: Colors.white, // Ensures text color is white
//       ),
//                     child: Text("Download Reports"),
//                   ),
//                 ],
//               ),
//               TableFilters(
//                 onEntriesChanged: _updateEntries,
//                 onSearchChanged: _updateSearch,
//               ),
//               SizedBox(height: 10),
//               DataTable(
//                 headingRowColor: MaterialStateProperty.resolveWith(
//                   (states) => const Color(0xFFE4F0FF),
//                 ),
//                 columns: [
//                   DataColumn(label: Checkbox(value: false, onChanged: (v) {})),
//                   DataColumn(label: Text("S.No")),
//                   DataColumn(label: Text("Booking ID")),
//                   DataColumn(label: Text("Guest Name")),
//                   DataColumn(label: Text("Phone")),
//                   DataColumn(label: Text("Actions")),
//                 ],
//                 rows: List.generate(
//                   endEntry - startEntry,
//                   (index) {
//                     final booking = _filteredBookings[startEntry + index];
//                     return DataRow(
//                       selected: _selectedRows[index],
//                       cells: [
//                         DataCell(Checkbox(
//                           value: _selectedRows[index],
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedRows[index] = value ?? false;
//                             });
//                           },
//                         )),
//                         DataCell(Text("${startEntry + index + 1}")),
//                         DataCell(Text(booking.bookingid??'')),
//                         DataCell(Text(booking.name??'')),
//                         DataCell(Text(booking.phone??'')),
//                         DataCell(Row(
//                           children: [
//                                     TextButton.icon(
//                                       onPressed: () {
//               widget.onPageChange(CancelledBookingDetails(
//                 bookingId: booking.bookingid ?? '',
//               ));
//             },
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
//                         )),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Showing $startEntry to $endEntry of $totalEntries entries"),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.arrow_back),
//                         onPressed: currentPage > 1
//                             ? () => setState(() => currentPage--)
//                             : null,
//                       ),
//                       Text("$currentPage"),
//                       IconButton(
//                         icon: Icon(Icons.arrow_forward),
//                         onPressed: currentPage < totalPages
//                             ? () => setState(() => currentPage++)
//                             : null,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _dateFilterField(String hint, TextEditingController controller) {
//     return SizedBox(
//       width: 200,
//       child: TextField(
//         controller: controller,
//         readOnly: true,
//         decoration: InputDecoration(
//           hintText: hint,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//           suffixIcon: IconButton(
//             icon: Icon(Icons.calendar_today),
//             onPressed: () => _selectDate(controller),
//           ),
//         ),
//       ),
//     );
//   }
// } 
//Cancelled Bookings   UpcomingBookingDetails  CancelledBookings

import 'package:avoota/apiservice.dart';
import 'package:avoota/booking_details.dart';
import 'package:avoota/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:avoota/tableFilters.dart';


class CancelledBookings extends StatefulWidget {
  final void Function(Widget) onPageChange;

  const CancelledBookings({super.key, required this.onPageChange});
  @override
  _CancelledBookingsState createState() => _CancelledBookingsState();
}

class _CancelledBookingsState extends State<CancelledBookings> {
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
      List<Booking>? transactions = await _apiService.getAllhBookings("canceled");
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
                      Text("Cancelled Bookings", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Dashboard / Cancelled Bookings", style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 59, 99, 243))),
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
