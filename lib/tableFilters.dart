import 'package:flutter/material.dart';

class TableFilters extends StatelessWidget {
  final Function(int)
      onEntriesChanged; // Callback for changing entries per page
  final Function(String) onSearchChanged; // Callback for search input

  TableFilters({
    required this.onEntriesChanged,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth > 600 ? 20 : 10), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown for entries
          if (screenWidth > 600)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Showing",
                      style: TextStyle(fontSize: screenWidth > 600 ? 16 : 14),
                    ),
                    SizedBox(width: 8),
                    Container(
                      child: DropdownButton<int>(
                        value: 5, // Default value
                        onChanged: (value) {
                          if (value != null)
                            onEntriesChanged(value); // Update entries per page
                        },
                        items: [5, 10, 15, 20]
                            .map((entries) => DropdownMenuItem<int>(
                                  value: entries,
                                  child: Text(entries.toString()),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "entries",
                      style: TextStyle(fontSize: screenWidth > 600 ? 16 : 14),
                    ),
                  ],
                ),
                SizedBox(width: 8),
                // Search field
                SizedBox(
                  width: 420, // Set width for larger screens
                  height: 44,
                  child: TextField(
                    onChanged: (value) =>
                        onSearchChanged(value), // Trigger search input
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),

          // For smaller screens (mobile), stack dropdown and search bar
          if (screenWidth <= 600)
            Column(
              children: [
                // Dropdown for entries
                Row(
                  children: [
                    Text(
                      "Showing",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(width: 8),
                    DropdownButton<int>(
                      value: 5,
                      onChanged: (value) {
                        if (value != null) onEntriesChanged(value);
                      },
                      items: [5, 10, 15, 20]
                          .map((entries) => DropdownMenuItem<int>(
                                value: entries,
                                child: Text(entries.toString()),
                              ))
                          .toList(),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "entries",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                    height: 16), // Add spacing between dropdown and search bar
                // Search field for small screens
                SizedBox(
                  width: screenWidth *
                      0.9, // Take 90% of screen width for search bar
                  height: 44,
                  child: TextField(
                    onChanged: (value) => onSearchChanged(value),
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
