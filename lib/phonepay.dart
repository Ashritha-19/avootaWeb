import 'package:avoota/apiservice.dart';
import 'package:avoota/models/payment_model.dart';
import 'package:avoota/phone_pay_details.dart';
import 'package:flutter/material.dart';
import 'package:avoota/tableFilters.dart';


class paymentscreen extends StatefulWidget {
  final void Function(Widget) onPageChange;

  const paymentscreen({super.key, required this.onPageChange});
  @override
  _paymentscreenState createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  List<bool> _selectedRows = [];
  int currentPage = 1;
  int entriesPerPage = 5;
  String searchQuery = "";
  final ApiService _apiService = ApiService();
  TextEditingController _fromDateController = TextEditingController();
  TextEditingController _toDateController = TextEditingController();
  List<PaymentTransaction> _paymentTransactions = [];
  List<PaymentTransaction> _filteredTransactions = [];

  @override
  void initState() {
     _fetchBookings();
     print("hello from all payments page");
    super.initState();
   
  }

  Future<void> _fetchBookings() async {
    try {
      List<PaymentTransaction>? transactions = await _apiService.fetchPaymentTransactions();
      if (transactions != null) {
        setState(() {
          _paymentTransactions = transactions;
          _filteredTransactions = transactions;
          _selectedRows = List<bool>.generate(transactions.length, (index) => false);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error fetching bookings: $e')));
    }
  }

  void _applyFilters() {

    List<PaymentTransaction> filtered = _paymentTransactions;
    if (_fromDateController.text.isNotEmpty && _toDateController.text.isNotEmpty) {
      DateTime fromDate = DateTime.parse(_fromDateController.text);
      DateTime toDate = DateTime.parse(_toDateController.text);

      filtered = filtered.where((transaction) {
        DateTime? paymentDate = transaction.createdTime;
        if (paymentDate == null) return false;
        return paymentDate.isAfter(fromDate.subtract(Duration(days: 1))) && 
         paymentDate.isBefore(toDate.add(Duration(days: 1)));
      }).toList();
    }


    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((transaction) {
        return transaction.gatewayRequest?.bookingId?.contains(searchQuery) ?? false ||
               transaction.avootaTxnId!.contains(searchQuery) ?? false ||
               transaction.status!.contains(searchQuery) ?? false;
      }).toList();

    }
    setState(() {
      _filteredTransactions = filtered;
      currentPage = 1; // Reset to first page when filtering
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

  double _calculateTotalAmount() {
    double totalAmount = 0.0;
    int startEntry = (currentPage - 1) * entriesPerPage;
    int endEntry = (startEntry + entriesPerPage).clamp(0, _filteredTransactions.length);
    for (var i = startEntry; i < endEntry; i++) {
      totalAmount += _filteredTransactions[i].amount ?? 0.0;
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int totalPages = (_filteredTransactions.length / entriesPerPage).ceil();
    int startEntry = ((currentPage - 1) * entriesPerPage);
    int endEntry = (startEntry + entriesPerPage).clamp(0, _filteredTransactions.length);

    double totalAmount = _calculateTotalAmount();

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
                      Text("PhonePay Payment", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Dashboard / PhonePay Payment", style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 59, 99, 243))),
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
          DataColumn(label: SizedBox(width: 150, child: Center(child: Text("Transaction ID")))),
          DataColumn(label: SizedBox(width: 100, child: Center(child: Text("Status")))),
          DataColumn(label: SizedBox(width: 150, child: Center(child: Text("Payment Date")))),
          DataColumn(label: SizedBox(width: 100, child: Center(child: Text("Amount")))),
          DataColumn(label: SizedBox(width: 120, child: Center(child: Text("Actions")))),
        ],
                          rows: List.generate(endEntry - startEntry, (index) {
                            final transaction = _filteredTransactions[startEntry + index];
                            return DataRow(
                              selected: _selectedRows[index],
                              cells: [
              DataCell(SizedBox(width: 50, child: Center(child: Text("${startEntry + index + 1}")))),
              DataCell(SizedBox(
                width: 120,
                child: Center(child: Text(transaction.gatewayRequest?.bookingId ?? "N/A", overflow: TextOverflow.ellipsis)),
              )),
              DataCell(SizedBox(
                width: 150,
                child: Center(child: Text(transaction.finalGatewayResponse?.gatewayResponse?.data?.transactionId ?? "N/A", overflow: TextOverflow.ellipsis)),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Center(child: Text(transaction.status ?? "N/A", overflow: TextOverflow.ellipsis)),
              )),
              DataCell(SizedBox(
                width: 150,
                child: Center(child: Text(transaction.createdTime?.toLocal().toString().split(' ')[0] ?? "N/A")),
              )),
              DataCell(SizedBox(
                width: 100,
                child: Center(child: Text("${transaction.amount?.toStringAsFixed(2) ?? "N/A"}")),
              )),
              DataCell(SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.visibility, color: Colors.blue),
                      onPressed: () { widget.onPageChange(PayPalPaymentScreen(
                                        trxId: transaction.finalGatewayResponse?.gatewayResponse?.data?.transactionId ?? 'N/A',
                                      ));},
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
                  SizedBox(height: 10),
                  // Add Total Amount as a row in the table
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    color: const Color(0xFFE4F0FF),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Total Amount: ${totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
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
