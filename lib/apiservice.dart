import 'dart:convert';
import 'package:avoota/models/booking_details_model.dart';
import 'package:avoota/models/booking_model.dart';
import 'package:avoota/models/payment_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();
 // static const String BASE_URL = "https://avoota-core.onrender.com/";
  
  Future<List<Booking>> getAllhBookings(String type) async {
    try {
      final response = await _dio.get('https://avoota-core.onrender.com/api/avoota/all-bookings');
      print("response of all boookings ---->${response.data}");
      if (response.statusCode == 200) {
        BookingResponse bookingResponse = BookingResponse.fromJson(response.data);

        switch (type) {
          case "completed":
            return bookingResponse.completed;
          case "upcoming":
            return bookingResponse.upcoming;
          case "canceled":
            return bookingResponse.canceled;
          case "pending":
            return bookingResponse.pending;
          default:
            return [];
        }
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      throw Exception("Error fetching bookings: $e");
    }
  }

  Future<BookingId?> fetchBookingDetails(String bookingId) async {
  try {
    final response = await _dio.post(
      "https://avoota-core.onrender.com/api/avoota/fetch-booking-by-bookingId",
      data: {
        "bookingId": bookingId, 
      }
    );

    print('bookingId->>>>>>>>>>>>>>>>>>>>>>>>>>${bookingId}');
    print('Raw API Response: ${response.data}'); // Debugging line

    if (response.statusCode == 200) {
      BookingId bookingDetails = BookingId.fromJson(response.data);
      print('Parsed Booking Details: $bookingDetails'); // Debugging line
      return bookingDetails;
    } else {
      print("Failed to load booking details");
      return null;
    }
  } catch (e) {
    if (e is DioException) {
      print("Error fetching booking details: ${e.response?.statusCode} - ${e.response?.data}");
    } else {
      print("Unknown error: $e");
    }
    return null;
  }
}


Future<List<PaymentTransaction>?> fetchPaymentTransactions() async {
  try {
    final response = await _dio.get('https://avoota-core.onrender.com/api/avoota/all-payments');

    if (response.statusCode == 200) {
      if (response.data != null) {
        // No need to decode again, use response.data directly
        List<dynamic> jsonData = response.data;

        if (jsonData is List) {
          List<PaymentTransaction> transactions = jsonData
              .map((item) => PaymentTransaction.fromJson(item))
              .toList();
          return transactions;
        } else {
          print('Error: Expected an array of transactions, but got a different structure');
          return null;
        }
      } else {
        print('Error: Response data is null');
        return null;
      }
    } else {
      print('Failed to load transactions: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error fetching data: $e');
    return null;
  }
}


Future<PaymentTransaction?> fetchPaymentTransactionById(String bookingId) async {
  try {
    final response = await _dio.post(
      'https://avoota-core.onrender.com/api/avoota/payments-byId',
      data: {
        "txnId": bookingId, 
      },
    );
print("response data ---->${response}");
    if (response.statusCode == 200) {
      if (response.data != null) {
        return PaymentTransaction.fromJson(response.data);
      } else {
        print('Error: Response data is null');
        return null;
      }
    } else {
      print('Failed to load transaction: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error fetching data: $e');
    return null;
  }
}

}

