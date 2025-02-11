import 'package:avoota/apiservice.dart';
import 'package:avoota/models/booking_details_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BookingDetailsScreen extends StatefulWidget {
  final String bookingId;

  const BookingDetailsScreen({Key? key, required this.bookingId})
      : super(key: key);

  @override
  _BookingDetailsScreenState createState() =>
      _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  final Dio _dio = Dio();
  bool _isLoading = true;
  bool _hasError = false;
  BookingId? bookingDetails;
  
  final ApiService _apiService = ApiService();

 

  // Helper method to calculate the number of people
  // int _calculatePeople(List<dynamic> roomInfo) {
  //   int numberOfAdults = roomInfo[0]['numberOfAdults'] ?? 0;
  //   int numberOfChild = roomInfo[0]['numberOfChild'] ?? 0;
  //   return numberOfAdults + numberOfChild;
  // }

  

  @override
  void initState() {
    _fetchBookingDetails();
    print('bookig id ------>${widget.bookingId}');
    super.initState();
    
  }

  Future<void> _fetchBookingDetails() async {
    try {
      print('Fetching booking details for ID: ${widget.bookingId}');
      BookingId? details = await _apiService.fetchBookingDetails(widget.bookingId);

      if (details != null) {
        setState(() {
          bookingDetails = details;  
          _isLoading = false;
          _hasError = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching booking details: $e')),
      );
    }
  }

  int _calculateDays(String? checkin, String? checkout) {
  if (checkin == null || checkout == null) {
    return 0; // Default to 0 days if either date is null
  }
  
  final checkinDate = DateTime.parse(checkin);
  final checkoutDate = DateTime.parse(checkout);
  return checkoutDate.difference(checkinDate).inDays;
}

  
  

  @override
  Widget build(BuildContext context) {
    
  TravellerInfo? firstTraveller = bookingDetails?.request?.roomTravellerInfo
        ?.expand((room) => room.travellerInfo ?? [])
        .toList()
        .firstOrNull;

        

      

        int numberOfDays = _calculateDays(
  bookingDetails?.checkInDate,
  bookingDetails?.checkOutDate,
);
  
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_hasError) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Error fetching data. Please try again later.'),
              ElevatedButton(
                onPressed: _fetchBookingDetails,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

  

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
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
                        'Dashboard / Upcoming Bookings / Booking Details / ',
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
                        widget.bookingId,
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
                    [
                      bookingDetails?.hotelName ?? 'N/A',
                      bookingDetails?.checkOutDate ?? 'N/A',
                      bookingDetails?.checkOutDate ?? 'N/A'
                      
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildRowDetails(
                    ['Address', 'State', 'Country'],
                    [
                     bookingDetails?.address ?? 'N/A',
                      bookingDetails?.checkOutDate ?? 'N/A',
                      bookingDetails?.checkOutDate ?? 'N/A'
                    ],
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
                    [
                     bookingDetails?.bookingId ?? 'N/A',
                      bookingDetails?.checkInDate ?? 'N/A',
                      bookingDetails?.checkOutDate ?? 'N/A'
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildRowDetails(
                    ['No of Days', 'Room Type', 'No of People'],
                    [
                    numberOfDays.toString(),
                      bookingDetails?.checkOutDate ?? 'N/A',
                      bookingDetails?.numOfAdults?.toString() ?? 'N/A'
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
                    ['Name', 'Phone', 'Email', 'Pan'],
                    [
                      '${firstTraveller?.fN ?? 'N/A'} ${firstTraveller?.lN ?? ''}',
                      bookingDetails?.request?.deliveryInfo?.contacts?.first ?? 'N/A',
                      bookingDetails?.request?.deliveryInfo?.emails?.first ?? 'N/A',
                     firstTraveller?.pan ?? 'N/A',
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
