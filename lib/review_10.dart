import 'package:avoota/reviewScreen.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Reviews> {
  // int currentPage = 1; // Add this inside _TestState class
  // int currentPage = 1;
  int currentPage = 1; // Tracks the current page
  final int totalPages = 3; // Total number of pages
  String selectedItems = "";

  void navigateToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  String? _selectedBulkAction;
  String? _selectedBulkActionbulking;
  
  bool _isTrashClicked = false;
  bool _isAllSelected = false; // Track if the "select all" checkbox is checked
  int _entriesPerPage = 5; // Dropdown value for "Showing entries"
  List<bool> _selectedRows = [
    false,
    false,
    false,
    false,
    false
  ]; // Track selected rows

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Get the screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final TextStyle textStyle = const TextStyle(
      color: Color(0xFF344054), // #344054
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w600, // Semibold
      height: 1.5, // Line-height: 24px (24 / 16 = 1.5)
      decoration: TextDecoration.none,
      textBaseline: TextBaseline.alphabetic,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            // Sidebar
            // Sidebar

            // Right-side content
            Expanded(
              child: Container(
                height: screenHeight,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        margin: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                              // Heading Section
                              Container(
                                width: 158,
                                height: 68,
                                color: Colors.transparent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Reviews',
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
                                          'Reviews',
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
                              const SizedBox(height: 32),

                              // Tabs for All and Trash
                              Container(
                                width: double.infinity,
                                height: 40,
                                child: Row(
                                  children: [
                                    // "All" Tab
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isAllSelected = false;
                                          _isTrashClicked = false;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: _isTrashClicked
                                                  ? Colors.transparent
                                                  : const Color(0xFF003572),
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'All (5)',
                                          style: TextStyle(
                                            color: _isTrashClicked
                                                ? Colors.grey
                                                : const Color(0xFF003572),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // "Trash" Tab
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isAllSelected = false;
                                          _isTrashClicked = true;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: _isTrashClicked
                                                  ? const Color(0xFF003572)
                                                  : Colors.transparent,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          'Trash (0)',
                                          style: TextStyle(
                                            color: _isTrashClicked
                                                ? const Color(0xFF003572)
                                                : Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Divider(
                                color: Colors.grey, // Line color
                                thickness: 1, // Line thickness
                                height: 1, // Line height
                              ),

                              const SizedBox(height: 16),
                              // Content under tabs
                              if (!_isTrashClicked)
                                Column(
                                  children: [
                                    // Dropdown and Apply Button (only for "All")
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            // Dropdown for Bulk Actions with border and spacing
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
                                                    _selectedBulkActionbulking = value;
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

                                            const SizedBox(
                                                width:
                                                    16), // Space after the dropdown
                                            // Apply Button
                                            ElevatedButton(
                                              onPressed: () {
                                                // Handle bulk actions
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFF003572),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8, 12, 8),
                                                fixedSize: const Size(101, 48),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                              child: const Text(
                                                'Apply',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
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
                                              width: 60,
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
                                                underline:
                                                    const SizedBox.shrink(),
                                                onChanged: (value) {
                                                  if (value != null) {
                                                    setState(() {
                                                      if (_selectedRows.length <
                                                          _entriesPerPage) {
                                                        // Add false values to match the new size
                                                        _selectedRows.addAll(
                                                            List.filled(
                                                                _entriesPerPage -
                                                                    _selectedRows
                                                                        .length,
                                                                false));
                                                      } else if (_selectedRows
                                                              .length >
                                                          _entriesPerPage) {
                                                        // Trim the list to the new size
                                                        _selectedRows =
                                                            _selectedRows.sublist(
                                                                0,
                                                                _entriesPerPage);
                                                      }
                                                    });
                                                  }
                                                },
                                                items: const [
                                                  DropdownMenuItem(
                                                    value: 5,
                                                    child: Text('  5'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 10,
                                                    child: Text('  10'),
                                                  ),
                                                  DropdownMenuItem(
                                                    value: 20,
                                                    child: Text('  20'),
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
                                          width: 400,
                                          height: 44,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFD0D5DD)),
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
                                                        color:
                                                            Color(0xFF697586),
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
                                    const SizedBox(height: 16),

                                 
                                 
                                    // Table with checkboxes
                Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.grey, width: 1),
  ),
  child: Column(
    children: [
      SingleChildScrollView(
  scrollDirection: Axis.horizontal,
     child:  DataTable(
        columnSpacing: 24,
        headingRowColor: MaterialStateProperty.all(const Color(0xFFE4F0FF)),
        columns: [
          DataColumn(
            label: Row(
              children: [
                Checkbox(
                  value: _isAllSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAllSelected = value!;
                      for (int i = 0; i < _selectedRows.length; i++) {
                        _selectedRows[i] = _isAllSelected;
                      }
                    });
                  },
                ),
                const Text('S. No'),
              ],
            ),
          ),
          const DataColumn(label: Text('Guest Name')),
          const DataColumn(label: Text('Phone/Email')),
          const DataColumn(label: Text('Message')),
          const DataColumn(label: Text('Updated At')),
          const DataColumn(label: Text('Actions')),
        ],
        rows: List.generate(
          _entriesPerPage,
          (index) => DataRow(
            selected: _selectedRows[index],
            cells: [
              DataCell(Row(
                children: [
                  Checkbox(
                    value: _selectedRows[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedRows[index] = value!;
                      });
                    },
                  ),
                  Text('${index + 1}'),
                ],
              )),
               DataCell(Text('User $index')),
              DataCell(Text('user$index@test.com')),
              DataCell(
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.37,
                  child: const Text(
                    'This is a detailed message that now has more space to display fully.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              DataCell(Text('2024-11-24')),
   DataCell(
  SizedBox(
    height: 40, // Adjust the height to make it shorter or taller
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
  isDense: true, // Makes the dropdown more compact
  underline: const SizedBox(),
  onChanged: (value) {
    if (value == 'approve') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewScreen()),
      );
    } else if (value == 'reply') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewScreen()),
      );
    } else if (value == 'trash') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ReviewScreen()),
      );
    }
  },
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
      value: 'trash',
      child: Text('Trash'),
    ),
  ],
  hint: const Text('Actions'),
)
,
    ),
  ),
),

              
            ],
          ),
          
          ),
          
        ),
        
      ),
      const SizedBox(height: 8), // Add space after the entire table
    ],
  ),
  
),

           SizedBox(
  width: screenWidth, // Set the width for the Column
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Current Page Content
      SizedBox(height: 40),

      // Pagination Bar
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
                  color: currentPage > 1 ? Color(0xFFE4F0FF) : Colors.grey, // Border color
                  width: 1, // Border width
                ),
                padding: EdgeInsets.zero, // Remove padding since we set the size manually
              ),
            ),
          ),

          SizedBox(width: 350),

          // Page Numbers
          Row(
            children: List.generate(totalPages, (index) {
              int page = index + 1;
              return GestureDetector(
                onTap: () => navigateToPage(page),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: currentPage == page
                        ? Colors.lightBlue.withOpacity(0.5)
                        : Colors.transparent,
                    border: Border.all(
                      color: currentPage == page
                          ? Color(0xFFE4F0FF)
                          : Colors.grey.withOpacity(0),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    page.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: currentPage == page
                          ? Color(0xFFE4F0FF)
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
          SizedBox(width: 350),

          // Next Button
          SizedBox(
            width: 130, // Button width in pixels
            height: 44, // Button height in pixels
            child: ElevatedButton(
              onPressed: currentPage < totalPages ? () => navigateToPage(currentPage + 1) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: currentPage < totalPages
                    ? Colors.white
                    : Colors.grey.shade300, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                side: BorderSide(
                  color: currentPage < totalPages ? Colors.grey : Colors.grey, // Border color
                  width: 1, // Border width
                ),
                padding: EdgeInsets.zero, // Remove padding as we're setting the size manually
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Keeps button size compact
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
                  SizedBox(width: 8), // Spacing between text and icon
                  Icon(
                    Icons.arrow_forward, // Add a right arrow icon
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
                                  ],
                                )
                              else
                                const Center(
                                  child: Text(
                                    'No Trash Content',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          
                         
                        ),
                        
                        
                      ),
                    ),

                    //     if (selectedItems == "Reviews")

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}