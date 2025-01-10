import 'package:flutter/material.dart';

class CancelledBookingDetails extends StatelessWidget {
  const CancelledBookingDetails({Key? key, required String bookingId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Booking Details',
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
                      const Text(
                        'Dashboard / Cancelled Bookings / Booking Details / ',
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
                        'TJS207601102940',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 24 / 16,
                          color: Color(0xFF003572),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Hotel Details Card
              _buildDetailsCard(
                title: 'Hotel Details',
                details: [
                  _buildRowDetails(
                    ['Hotel Name', 'Phone', 'City'],
                    ['The Mount Regency', '91-9841119992', 'Chennai'],
                  ),
                  const SizedBox(height: 16),
                  _buildRowDetails(
                    ['Address', 'State', 'Country'],
                    ['#7 Wallers Road, Mount Road', 'Tamil Nadu', 'India'],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Booking Details Card
              _buildDetailsCard(
                title: 'Booking Details',
                details: [
                  _buildRowDetails(
                    ['Booking ID', 'Check-In Date', 'Check-Out Date'],
                    ['TJS207601102940', '19 November 2024', '20 November 2024'],
                  ),
                  const SizedBox(height: 16),
                  _buildRowDetails(
                    ['No of Days', 'Room Type', 'No of People'],
                    [
                      '1',
                      'Standard Double Room - 1 Queen Bed',
                      '2 Adults, 0 Children',
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Traveller Details Card
              _buildDetailsCard(
                title: 'Traveller Details',
                details: [
                  _buildRowDetails(
                    ['Name', 'Phone' , 'Email','Pan'],
                    ['Vijay Anand', '91-9876543210','vijay@gmail.com','DIPPQ9182S'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsCard({
    required String title,
    required List<Widget> details,
  }) {
    return Card(
      color: Colors.grey[100],
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            const SizedBox(height: 16),
            ...details,
          ],
        ),
      ),
    );
  }

  Widget _buildRowDetails(List<String> labels, List<String> values) {
    return Row(
      children: List.generate(labels.length, (index) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labels[index],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                values[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
