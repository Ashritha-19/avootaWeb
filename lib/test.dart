import 'package:flutter/material.dart';

class UpcomingBookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 982, // Fixed width
      height: 672, // Fixed height
      margin: const EdgeInsets.only(top: 96, left: 274), // Positioned at top: 96px, left: 274px
      padding: const EdgeInsets.only(top: 24), // Padding as specified
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upcoming Bookings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.download, color: Colors.white),
                  label: const Text(
                    'Download Reports',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _dateFilterField('From Date'),
                    const SizedBox(width: 16),
                    _dateFilterField('To Date'),
                  ],
                ),
                Row(
                  children: [
                    _bulkActionsDropdown(),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Table
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: _dataTable(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateFilterField(String label) {
    return SizedBox(
      width: 150,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Widget _bulkActionsDropdown() {
    return DropdownButton<String>(
      value: 'Bulk Actions',
      onChanged: (value) {},
      items: ['Bulk Actions', 'Delete', 'Export']
          .map((action) => DropdownMenuItem<String>(
                value: action,
                child: Text(action),
              ))
          .toList(),
    );
  }

  Widget _dataTable() {
    return DataTable(
      columnSpacing: 12,
      columns: const [
        DataColumn(label: Text('S.No')),
        DataColumn(label: Text('Booking ID')),
        DataColumn(label: Text('Guest Name')),
        DataColumn(label: Text('Phone')),
        DataColumn(label: Text('Updated At')),
        DataColumn(label: Text('Actions')),
      ],
      rows: List<DataRow>.generate(
        10,
        (index) => DataRow(
          cells: [
            DataCell(Text('${index + 1}')),
            DataCell(Text('TJS20760110294${index}')),
            DataCell(Text('User ${index + 1}')),
            DataCell(Text('80XXXXXXX${index}')),
            const DataCell(Text('18/11/2024')),
            DataCell(Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download, color: Colors.blue),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
