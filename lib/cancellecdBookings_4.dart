import 'package:avoota/cancelledbookings.dart';
import 'package:flutter/material.dart';
import 'package:avoota/apiservice.dart';
import 'package:avoota/tableFilters.dart';
import 'package:avoota/booking.dart';

class CancelledBookings extends StatefulWidget {
  final void Function(Widget) onPageChange; // Callback for page change
  CancelledBookings({required this.onPageChange});
  @override
  _CancelledBookingsState createState() => _CancelledBookingsState();
}

class _CancelledBookingsState extends State<CancelledBookings> {
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
      List<Booking> bookings = await _apiService.getAllUpcomingBookings();
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
                    "Canceeled Bookings",
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
              DataTable(
                headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => const Color(0xFFE4F0FF),
                ),
                columns: [
                  DataColumn(label: Checkbox(value: false, onChanged: (v) {})),
                  DataColumn(label: Text("S.No")),
                  DataColumn(label: Text("Booking ID")),
                  DataColumn(label: Text("Guest Name")),
                  DataColumn(label: Text("Phone")),
                  DataColumn(label: Text("Actions")),
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
                        DataCell(Text(booking.bookingid??'')),
                        DataCell(Text(booking.name??'')),
                        DataCell(Text(booking.phone??'')),
                        DataCell(Row(
                          children: [
                                    TextButton.icon(
                                      onPressed: () {
              widget.onPageChange(CancelledBookingDetails(
                bookingId: booking.bookingid ?? '',
              ));
            },
                                      icon: Icon(Icons.visibility,
                                          color: Colors.blue),
                                      label: Text("View"),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.download,
                                          color: const Color.fromARGB(
                                              255, 2, 75, 136)),
                                      label: Text("Download"),
                                    ),
                                  ],
                        )),
                      ],
                    );
                  },
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