import 'package:avoota/phone_pay_details.dart';
import 'package:flutter/material.dart';
import 'package:avoota/cancelledbookings.dart';
import 'package:avoota/tableFilters.dart';

class paymentscreen extends StatefulWidget {
  @override
  _paymentscreenState createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  List<bool> _selectedRows = List<bool>.generate(5, (index) => false); // Track row selection
  int currentPage = 1;
  int totalEntries = 25; // Total number of bookings
  int entriesPerPage = 5; // Number of entries per page
  String searchQuery = ""; // Search filter

  // Date controllers
  TextEditingController _fromDateController = TextEditingController();
  TextEditingController _toDateController = TextEditingController();

  void _updateEntries(int entries) {
    setState(() {
      entriesPerPage = entries;
    });
  }

  void _updateSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedRows = List<bool>.generate(entriesPerPage, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int totalPages = (totalEntries / entriesPerPage).ceil();
    int startEntry = ((currentPage - 1) * entriesPerPage) + 1;
    int endEntry = (startEntry + entriesPerPage - 1).clamp(0, totalEntries);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // Enable scrolling to avoid overflow
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
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "PhonePay Payment",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Dashboard / PhonePay Payment",
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 59, 99, 243)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _dateFilterField("From Date", screenWidth, _fromDateController),
                          _dateFilterField("To Date", screenWidth, _toDateController),
                          _dropdownField("Bulk Actions", screenWidth),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF003572),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          minimumSize: Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Download Reports",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TableFilters(
                      onEntriesChanged: _updateEntries,
                      onSearchChanged: _updateSearch,
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFD4D4D4), width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.resolveWith<Color>(
                            (states) => const Color(0xFFE4F0FF),
                          ),
                          columns: [
                            DataColumn(
                              label: Center(
                                child: Checkbox(
                                  value: _selectedRows.every((selected) => selected),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _selectedRows = List<bool>.generate(
                                          5, (index) => value ?? false);
                                    });
                                  },
                                ),
                              ),
                            ),
                            DataColumn(label: Text("S.No", textAlign: TextAlign.center)),
                            DataColumn(label: Text("Booking ID", textAlign: TextAlign.center)),
                            DataColumn(label: Text("Transaction ID", textAlign: TextAlign.center)), // Updated
                            DataColumn(label: Text("Payment Status", textAlign: TextAlign.center)), // Updated
                            DataColumn(label: Text("Payment Date", textAlign: TextAlign.center)), // Updated
                            DataColumn(label: Text("Amount", textAlign: TextAlign.center)), // New field
                            DataColumn(label: Text("Actions", textAlign: TextAlign.center)),
                          ],
                          rows: List.generate(5, (index) {
                            return DataRow(
                              selected: _selectedRows[index],
                              cells: [
                                DataCell(
                                  Center(
                                    child: Checkbox(
                                      value: _selectedRows[index],
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _selectedRows[index] = value ?? false;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                DataCell(Center(child: Text("${index + 1}"))),
                                 DataCell(Center(child: Text("TJS207601102940"))),// Booking ID
                                DataCell(Center(child: Text("670170dec14as19"))), // Transaction ID
                                DataCell(Center(child: Text("PAYMENT_SUCCESS"))), // Payment Status
                                DataCell(Center(child: Text("18/11/2024"))), // Payment Date
                                DataCell(Center(child: Text("\$1000.00"))), // Amount
                                DataCell(
                                  Row(
                                    children: [
                                      TextButton.icon(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => PayPalPaymentScreen()),
                                          );
                                        },
                                        icon: Icon(Icons.visibility, color: Colors.blue),
                                        label: Text("View"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
      // Pagination and Total Amount
Container(
color: const Color(0xFFE4F0FF), // Set background color
padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Add some padding
child: Row(
  mainAxisAlignment: MainAxisAlignment.center, // Align content to the center
  children: const [
    Text(
      "Total Amount: 5000.00",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ],
),
)
,
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
                                onPressed: currentPage > 1
                                    ? () {
                                        setState(() {
                                          currentPage--;
                                        });
                                      }
                                    : null,
                                child: Row(
                                  children: [
                                    Icon(Icons.arrow_back),
                                    Text("Previous"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "$currentPage",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFD0D5DD), width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextButton(
                                onPressed: currentPage < totalPages
                                    ? () {
                                        setState(() {
                                          currentPage++;
                                        });
                                      }
                                    : null,
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

  Widget _dateFilterField(String hint, double screenWidth, TextEditingController controller) {
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

  void _updateSelectionState() {
    _selectedRows = List<bool>.generate(entriesPerPage, (index) => false);
  }
}
