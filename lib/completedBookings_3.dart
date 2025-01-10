// import 'package:avoota/apiservice.dart';
// import 'package:avoota/booking.dart';
// import 'package:avoota/completedbookings.dart';
// import 'package:avoota/tableFilters.dart';
// import 'package:flutter/material.dart';

// class CompletedBookings extends StatefulWidget {
//   @override
//   _CompletedBookingsState createState() => _CompletedBookingsState();
// }

// class _CompletedBookingsState extends State<CompletedBookings> {
//   final ApiService _apiService = ApiService();
//   List<Booking> _bookings = [];
//   List<Booking> _filteredBookings = [];
//   List<bool> _selectedRows = List<bool>.generate(5, (index) => false);
//   int currentPage = 1;
//   int totalEntries = 25;
//   int entriesPerPage = 5;
//   String searchQuery = "";

//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchBookings();
//   }

//   Future<void> _fetchBookings() async {
//     try {
//       List<Booking> bookings = await _apiService.getAllCompletedBookings();
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
//               booking.name?.toLowerCase().contains(searchQuery.toLowerCase()) ??
//               false)
//           .toList();
//       if (_filteredBookings.isEmpty) {
//         currentPage = 1;
//       }
//       _updateSelectionState();
//     });
//   }

//   void _updateEntries(int entries) {
//     setState(() {
//       entriesPerPage = entries;
//       _updateSelectionState();
//     });
//   }

//   void _updateSearch(String query) {
//     setState(() {
//       searchQuery = query;
//       _applyFilters();
//     });
//   }

//   void _updateSelectionState() {
//     _selectedRows =
//         List<bool>.generate(entriesPerPage, (index) => false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     int totalPages = (_filteredBookings.length / entriesPerPage).ceil();
//     int startEntry = (currentPage - 1) * entriesPerPage;
//     int endEntry =
//         (startEntry + entriesPerPage - 1).clamp(0, _filteredBookings.length - 1);

//     return SingleChildScrollView(
//       child: Container(
//         margin: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(),
//               _buildFilters(screenWidth),
//               _buildDataTable(startEntry, endEntry),
//               _buildPaginationControls(startEntry, endEntry, totalPages),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 40),
//         Text(
//           "Completed Bookings",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 10),
//         Text(
//           "Dashboard / Completed Bookings",
//           style: TextStyle(
//             fontSize: 16,
//             color: const Color.fromARGB(255, 59, 99, 243),
//           ),
//         ),
//         SizedBox(height: 20),
//       ],
//     );
//   }

//   Widget _buildFilters(double screenWidth) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: [
//             _dateFilterField("From Date", screenWidth, _fromDateController),
//             _dateFilterField("To Date", screenWidth, _toDateController),
//             _dropdownField("Bulk Actions", screenWidth),
//           ],
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFF003572),
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//           child: Row(
//             children: [
//               Text(
//                 "Download Reports",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(width: 8),
//               Icon(Icons.arrow_drop_down, color: Colors.white),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDataTable(int startEntry, int endEntry) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: DataTable(
//         headingRowColor: MaterialStateProperty.resolveWith<Color>(
//           (states) => const Color(0xFFE4F0FF),
//         ),
//         columns: _buildDataColumns(),
//         rows: _buildDataRows(startEntry, endEntry),
//       ),
//     );
//   }

//   List<DataColumn> _buildDataColumns() {
//     return [
//       DataColumn(
//         label: Center(
//           child: Checkbox(
//             value: _selectedRows.every((selected) => selected),
//             onChanged: (value) {
//               setState(() {
//                 _selectedRows =
//                     List<bool>.generate(entriesPerPage, (index) => value ?? false);
//               });
//             },
//           ),
//         ),
//       ),
//       DataColumn(label: Text("S.No")),
//       DataColumn(label: Text("Booking ID")),
//       DataColumn(label: Text("Guest Name")),
//       DataColumn(label: Text("Phone")),
//       DataColumn(label: Text("Updated At")),
//       DataColumn(label: Text("Actions")),
//     ];
//   }

//   List<DataRow> _buildDataRows(int startEntry, int endEntry) {
//     return List.generate(
//       endEntry - startEntry + 1,
//       (index) {
//         int bookingIndex = startEntry + index;
//         if (bookingIndex >= _filteredBookings.length) {
//           return DataRow(
//             cells: List.generate(7, (_) => DataCell(Text(''))),
//           );
//         }

//         final booking = _filteredBookings[bookingIndex];
//         return DataRow(
//           selected: _selectedRows[index],
//           cells: [
//             DataCell(
//               Checkbox(
//                 value: _selectedRows[index],
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedRows[index] = value ?? false;
//                   });
//                 },
//               ),
//             ),
//             DataCell(Text("$bookingIndex")),
//             DataCell(Text(booking.bookingid ?? '')),
//             DataCell(Text(booking.name ?? '')),
//             DataCell(Text(booking.phone ?? '')),
//             DataCell(Text("18/11/2024")),
//             DataCell(_buildActionButtons(booking)),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildActionButtons(Booking booking) {
//     return Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CompletedBookingDetails(
//                   bookingId: booking.bookingid ?? '',
//                 ),
//               ),
//             );
//           },
//           icon: Icon(Icons.visibility, color: Colors.blue),
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.download, color: const Color(0xFF024B88)),
//         ),
//       ],
//     );
//   }

//   Widget _buildPaginationControls(int startEntry, int endEntry, int totalPages) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text("Showing $startEntry to $endEntry of $totalEntries entries"),
//         Row(
//           children: [
//             TextButton(
//               onPressed: currentPage > 1
//                   ? () {
//                       setState(() {
//                         currentPage--;
//                         _updateSelectionState();
//                       });
//                     }
//                   : null,
//               child: Row(
//                 children: [Icon(Icons.arrow_back), Text("Previous")],
//               ),
//             ),
//             Text("$currentPage / $totalPages"),
//             TextButton(
//               onPressed: currentPage < totalPages
//                   ? () {
//                       setState(() {
//                         currentPage++;
//                         _updateSelectionState();
//                       });
//                     }
//                   : null,
//               child: Row(
//                 children: [Text("Next"), Icon(Icons.arrow_forward)],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _dateFilterField(
//       String hint, double screenWidth, TextEditingController controller) {
//     return SizedBox(
//       width: screenWidth > 600 ? 200 : double.infinity,
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           hintText: hint,
//           border: OutlineInputBorder(),
//           suffixIcon: IconButton(
//             icon: Icon(Icons.calendar_today),
//             onPressed: () async {
//               DateTime? selectedDate = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//               );
//               if (selectedDate != null) {
//                 controller.text = "${selectedDate.toLocal()}".split(' ')[0];
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _dropdownField(String hint, double screenWidth) {
//     return SizedBox(
//       width: screenWidth > 600 ? 200 : double.infinity,
//       child: DropdownButtonFormField<String>(
//         decoration: InputDecoration(border: OutlineInputBorder()),
//         items: ["Option 1", "Option 2", "Option 3"]
//             .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//             .toList(),
//         onChanged: (value) {},
//       ),
//     );
//   }
// }


import 'package:avoota/completedbookings.dart';
import 'package:avoota/upcomingbookings.dart';
import 'package:flutter/material.dart';
import 'package:avoota/apiservice.dart';
import 'package:avoota/tableFilters.dart';
import 'package:avoota/booking.dart';

class CompletedBookings extends StatefulWidget {
  final void Function(Widget) onPageChange;
  CompletedBookings({required this.onPageChange});
  @override
  _CompletedBookingsState createState() => _CompletedBookingsState();
}

class _CompletedBookingsState extends State<CompletedBookings> {
  final ApiService _apiService = ApiService();
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  List<Booking> _bookings = [];
  List<Booking> _filteredBookings = [];
  List<bool> _selectedRows = [];
  int currentPage = 1;
  int entriesPerPage = 5;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    try {
      List<Booking> bookings = await _apiService.getAllCompletedBookings();
      setState(() {
        _bookings = bookings;
        _applyFilters();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching bookings: $e')),
      );
    }
  }

  void _applyFilters() {
    setState(() {
      _filteredBookings = _bookings
          .where((booking) =>
              booking.name!.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
      _selectedRows = List<bool>.generate(_filteredBookings.length, (index) => false);
    });
  }

  void _updateSearch(String query) {
    setState(() {
      searchQuery = query;
      _applyFilters();
    });
  }

  void _updateEntries(int entries) {
    setState(() {
      entriesPerPage = entries;
    });
  }

  Future<void> _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = pickedDate.toIso8601String().split('T').first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalEntries = _filteredBookings.length;
    int totalPages = (totalEntries / entriesPerPage).ceil();
    int startEntry = (currentPage - 1) * entriesPerPage;
    int endEntry = (startEntry + entriesPerPage).clamp(0, totalEntries);

    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    "Completed Bookings",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _dateFilterField("From Date", _fromDateController),
                  _dateFilterField("To Date", _toDateController),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Download Reports"),
                  ),
                ],
              ),
              TableFilters(
                onEntriesChanged: _updateEntries,
                onSearchChanged: _updateSearch,
              ),
              SizedBox(height: 10),
              Container(
  margin: EdgeInsets.all(10),
  width: 1200,  // Make the container fill the width of its parent
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: SingleChildScrollView(  
      scrollDirection: Axis.horizontal,  
      child: DataTable(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 62, 62, 62), 
            width: 2, 
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        headingRowHeight: 56, 
        columnSpacing: 120, 
        dataRowHeight: 60, 
        headingRowColor: MaterialStateProperty.resolveWith(
          (states) => const Color(0xFFE4F0FF), // Heading row color
        ),
        columns: [
          DataColumn(label: Checkbox(value: false, onChanged: (v) {})),
          DataColumn(label: Text("S.No")),
          DataColumn(label: Text("Booking ID")),
          DataColumn(label: Text("Guest Name")),
          DataColumn(label: Text("Phone")),
          DataColumn(
    label: Padding(
      padding: const EdgeInsets.only(left: 70.0), // Adjust this value as needed
      child: Text("Actions"),
    ),
  ),
        ],
        rows: List.generate(
          endEntry - startEntry,
          (index) {
            final booking = _filteredBookings[startEntry + index];
            return DataRow(
              selected: _selectedRows[index],
              cells: [
                DataCell(Checkbox(
                  value: _selectedRows[index],
                  onChanged: (value) {
                    setState(() {
                      _selectedRows[index] = value ?? false;
                    });
                  },
                )),
                DataCell(Text("${startEntry + index + 1}")),
                DataCell(Text(booking.bookingid ?? '')),
                DataCell(Text(booking.name ?? '')),
                DataCell(Text(booking.phone ?? '')),
                DataCell(Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        widget.onPageChange(UpcomingBookingDetails(
                          bookingId: booking.bookingid ?? '',
                        ));
                      },
                      icon: Icon(Icons.visibility, color: Colors.blue),
                      label: Text("View"),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.download, color: const Color.fromARGB(255, 2, 75, 136)),
                      label: Text("Download"),
                    ),
                  ],
                )),
              ],
            );
          },
        ),
      ),
    ),
  ),
),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Showing $startEntry to $endEntry of $totalEntries entries"),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: currentPage > 1
                            ? () => setState(() => currentPage--)
                            : null,
                      ),
                      Text("$currentPage"),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: currentPage < totalPages
                            ? () => setState(() => currentPage++)
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateFilterField(String hint, TextEditingController controller) {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(controller),
          ),
        ),
      ),
    );
  }
} 