import 'package:avoota/booking.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio = Dio();
  
Future<List<Booking>> getAllUpcomingBookings() async {
    try {
      final response = await _dio.get('http://localhost:8080/api/getUpcomingBooking');
      print(response);

      if (response.statusCode == 200) {
         final List<dynamic> data = response.data;
      return data.map((e) => Booking.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

Future<List<Booking>> getAllCompletedBookings() async {
    try {
      final response = await _dio.get('http://localhost:8080/api/getCompletedBooking');
      print(response);

      if (response.statusCode == 200) {
         final List<dynamic> data = response.data;
      return data.map((e) => Booking.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load bookings');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

}