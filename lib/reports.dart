import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}
class _GridState extends State<Grid> {
 DateTime? _fromDate;
  DateTime? _toDate;
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isFromDate ? (_fromDate ?? initialDate) : (_toDate ?? initialDate),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = pickedDate;
        } else {
          _toDate = pickedDate;
        }
      });
    }
  }

   int currentPage = 1; // Tracks the current page
  final int totalPages = 3; // Total number of pages

  void navigateToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  String? _selectedBulkAction;
  String selectedMenu = ""; // Tracks the currently selected menu item
  int _entriesPerPage=5;

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            // Sidebar
          //  sideBar(screenHeight),

            // Right-side content
            Expanded(
              child: Container(
                height: screenHeight,
                child: Column(
                  children: [
                    // Top Container (Header)
                   // topContainer(),
                    // Body Container
                    //if (selectedMenu == "Revenue Report")
                    bodyContainer(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded bodyContainer(BuildContext context) {
    return Expanded(
                    child:                    
                     Container(
width: double.infinity,
padding: const EdgeInsets.all(24),
margin: const EdgeInsets.all(24),
decoration: BoxDecoration(
  color: selectedMenu == "Revenue Report" ? Colors.white : Colors.white,
  
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
  ],
),
child: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Header with title and breadcrumbs
      Container(
        width: 286,
        height: 68,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Revenue Report',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 36 / 24,
                color: Color(0xFF212121),
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    color: const Color(0xFF697586),
                    decoration: TextDecoration.none,
                  ),
                ),
                const Text(
                  ' / ',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    color: Color(0xFF697586),
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Reports',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    color: const Color(0xFF697586),
                    decoration: TextDecoration.none,
                  ),
                ),
                const Text(
                  ' / ',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    color: Color(0xFF697586),
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Revenue Report',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 24 / 16,
                    color: const Color(0xFF003572),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      const SizedBox(height: 20),
      // Filter options (Date Picker, Bulk Actions)
      Row(
       
        children: [
 
         _buildDatePicker(
                'From Date',
                _fromDate,
                () => _selectDate(context, true),
                width: 140,
              ),
              const SizedBox(width: 8),
              _buildDatePicker(
                'To Date',
                _toDate,
                () => _selectDate(context, false),
                width: 140,
              ),
          const SizedBox(width: 16),
         Container(
                                            width: 144,
                                            height: 48,
                                            padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 12),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: DropdownButton<String>(
                                              value: _selectedBulkAction,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedBulkAction = value;
                                                });
                                              },
                                              isExpanded: true,
                                              hint: const Text('Bulk Action'),
                                              underline: const SizedBox
                                                  .shrink(), // Remove default underline
                                              items: const [
                                                DropdownMenuItem(
                                                  value: 'approve',
                                                  child: Text('Approve'),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'reply',
                                                  child: Text('Reply'),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'delete',
                                                  child: Text('Delete'),
                                                ),
                                              ],
                                            ),
                                          ),
          const Spacer(),
SizedBox(
width: 180, // Set the desired width
height: 40, // Set the desired height
child: ElevatedButton(
  onPressed: () {
    print("Download Reports");
  },
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Rounded corners
    ),
    backgroundColor: const Color.fromARGB(255, 13, 51, 88),
    foregroundColor: Colors.white,
  ),
  child: const Text("Download Reports"),
),
),

        ],
      ),
      const SizedBox(height: 10),
      // Swap Search and Showing Entries Dropdown
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // "Showing Entries" dropdown now on the left
                                      Row(
                                        children: [
                                          const Text('Showing'),
                                         // const SizedBox(width: 8),
                                          SizedBox(width: 8),
                                          // Dropdown for entries per page
                                          Container(
                                            width: 48,
                                            height: 38,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                            ),
                                            child: DropdownButton<int>(
                                              value: _entriesPerPage,
                                              underline: const SizedBox.shrink(),
                                              onChanged: (value) {
                                                setState(() {
                                                  _entriesPerPage = value!;
                                                });
                                              },
                                              items: const [
                                                
                                                DropdownMenuItem(
                                                  value: 5,
                                                  child: Text('5'),
                                                  
                                                ),
                                                DropdownMenuItem(
                                                  value: 10,
                                                  child: Text('10'),
                                                ),
                                                DropdownMenuItem(
                                                  value: 20,
                                                  child: Text('20'),
                                                ),
                                                

                                              ],
                                            ),
                                            
                                           ),
                                              SizedBox(width: 8),

                                           const Text('Entries'),
                                           const SizedBox(width: 8),
                                           
                                        ],
                                      ),
                                      // Search Bar now on the right
                               SizedBox(
                          width: 420,
                          height: 44,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(color: const Color(0xFFD0D5DD)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x1A101828),
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF697586),
                                    size: 20,
                                  ),
                                ),
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        color: Color(0xFF697586),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                                    ],
                                  ),
                        
      // Table with data
      Container(
width: 934, // Setting the width to 934px
height: 324, // Setting the height to 324px
 margin: const EdgeInsets.only(top: 30), // Adding top margin of 60px
decoration: BoxDecoration(
  border: Border.all(color: Colors.grey.shade300), // Adding a border
  borderRadius: BorderRadius.circular(0), // Rounded corners
),
child: SingleChildScrollView( // Ensures table content is scrollable
  child: DataTable(
    headingRowColor:
                                            MaterialStateProperty.all(
                                                const Color(0xFFE4F0FF)),
    columnSpacing: 16, // Adjust spacing between columns
    columns: const [
      DataColumn(label: Text('S.No')),
      DataColumn(label: Text('Hotel Name')),
      DataColumn(label: Text('City')),
      DataColumn(label: Text('State')),
      DataColumn(label: Text('Amount')),
      DataColumn(label: Text('Payment Date')),
    ],
    rows: List<DataRow>.generate(
      5,
      (index) => DataRow(cells: [
        DataCell(Text('${index + 1}')),
        const DataCell(Text('Hotel Name')),
        const DataCell(Text('City')),
        const DataCell(Text('State')),
        const DataCell(Text('6026.69')),
        const DataCell(Text('21/09/2024')),
      ]),
    ),
  ),
),
),

      const SizedBox(height: 0),
      // Pagination and Total Amount
Container(
color: const Color(0xFFE4F0FF), // Set background color
padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16), // Add some padding
child: Row(
  mainAxisAlignment: MainAxisAlignment.center, // Align content to the center
  children: const [
    Text(
      "Total Amount: 30,133.45",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ],
),
)
,
  const SizedBox(height: 16),
    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Previous Button

                  SizedBox(
width: 134, // Button width in pixels
height: 46, // Button height in pixels
child: ElevatedButton.icon(
  onPressed: currentPage > 1 ? () => navigateToPage(currentPage - 1) : null,
  icon: Icon(
    Icons.arrow_back, // Add a left arrow icon
    color: currentPage > 1 ? Color(0xFF344054) : Colors.grey, // Icon color
  ),
  label: Text(
    "Previous",
    style: TextStyle(
      color: currentPage > 1 ? Color(0xFF344054) : Colors.grey, // Font color
      fontWeight: FontWeight.bold,
    ),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // Background color set to white
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
    side: BorderSide(
      color: currentPage > 1 ? Colors.blue : Colors.grey, // Border color
      width: 1, // Border width
    ),
    padding: EdgeInsets.zero, // Remove padding since we set the size manually
  ),
),
),
                          SizedBox(width: 250),

                          // Page Numbers
                          Row(
                            children: List.generate(totalPages, (index) {
                              int page = index + 1;
                              return GestureDetector(
                                onTap: () => navigateToPage(page),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: currentPage == page
                                        ? Colors.lightBlue.withOpacity(0.5)
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: currentPage == page
                                          ? Colors.blue
                                          : Colors.grey.withOpacity(0),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    page.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: currentPage == page
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(width: 150),

                          // Next Button
                          SizedBox(
                            width: 134, // Button width in pixels
                            height: 46, // Button height in pixels
                            child: ElevatedButton(
                              onPressed: currentPage < totalPages
                                  ? () => navigateToPage(currentPage + 1)
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: currentPage < totalPages
                                    ? Colors.white
                                    : Colors
                                        .grey.shade300, // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12), // Rounded corners
                                ),
                                side: BorderSide(
                                  color: currentPage < totalPages
                                      ? Colors.grey
                                      : Colors.grey, // Border color
                                  width: 1, // Border width
                                ),
                                padding: EdgeInsets
                                    .zero, // Remove padding as we're setting the size manually
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Keeps button size compact
                                children: [
                                  Text(
                                    "Next",
                                    style: TextStyle(
                                      color: currentPage < totalPages
                                          ? Color(0xFF344054)
                                          : Colors.grey, // Font color
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Spacing between text and icon
                                  Icon(
                                    Icons
                                        .arrow_forward, // Add a right arrow icon
                                    color: currentPage < totalPages
                                        ? Color(0xFF344054)
                                        : Colors.grey, // Icon color
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
    ],
  ),
),
)
                  );
  }


  Widget _buildMenuItem(IconData icon, String title, {bool isSubItem = false}) {
    return ListTile(
      leading: Icon(icon, color: isSubItem ? Colors.grey : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSubItem ? FontWeight.w400 : FontWeight.w500,
          color: isSubItem ? Colors.grey : Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          selectedMenu = title; // Update the selected menu
        });
      },
    );
  }

  Widget _buildDatePicker(String hint, DateTime? date, VoidCallback onTap,
      {required double width}) {
    return SizedBox(
      width: width,
      height: 48,
      child: GestureDetector(
        onTap: onTap,
        child: AbsorbPointer(
          child: TextField(
            decoration: InputDecoration(
              hintText: date != null
                  ? "${date.day}/${date.month}/${date.year}"
                  : hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              suffixIcon: const Icon(Icons.calendar_today, size: 16),
            ),
          ),
        ),
      ),
    );
  }
}
  

