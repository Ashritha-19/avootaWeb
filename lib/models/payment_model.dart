import 'dart:convert';

class PaymentTransaction {
  final int id;
  final String? avootaTxnId;
  final String? transactionId;
  final double? amount;
  final String? requestType;
  final GatewayRequest? gatewayRequest;
  final InitialGatewayResponse? initialGatewayResponse;
  final FinalGatewayResponse? finalGatewayResponse;
  final String? status;
  final DateTime? createdTime;
  final DateTime? updatedTime;

  PaymentTransaction({
    required this.id,
    this.avootaTxnId,
    this.transactionId,
    this.amount,
    this.requestType,
    this.gatewayRequest,
    this.initialGatewayResponse,
    this.finalGatewayResponse,
    this.status,
    this.createdTime,
    this.updatedTime,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) {
    return PaymentTransaction(
      id: json['id'],
      avootaTxnId: json['avootaTxnId'],
      transactionId: json['transactionId'],
      amount: json['amount'] != null ? json['amount'].toDouble() : null,
      requestType: json['requestType'],
      gatewayRequest: json['gatewayRequest'] != null
          ? GatewayRequest.fromJson(json['gatewayRequest'])
          : null,
      initialGatewayResponse: json['initialGatewayResponse'] != null
          ? InitialGatewayResponse.fromJson(json['initialGatewayResponse'])
          : null,
      finalGatewayResponse: json['finalGatewayResponse'] != null
          ? FinalGatewayResponse.fromJson(json['finalGatewayResponse'])
          : null,
      status: json['status'],
      createdTime: json['createdTime'] != null
          ? DateTime.tryParse(json['createdTime'])
          : null,
      updatedTime: json['updatedTime'] != null
          ? DateTime.tryParse(json['updatedTime'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'avootaTxnId': avootaTxnId,
      'transactionId': transactionId,
      'amount': amount,
      'requestType': requestType,
      'gatewayRequest': gatewayRequest?.toJson(),
      'initialGatewayResponse': initialGatewayResponse?.toJson(),
      'finalGatewayResponse': finalGatewayResponse?.toJson(),
      'status': status,
      'createdTime': createdTime?.toIso8601String(),
      'updatedTime': updatedTime?.toIso8601String(),
    };
  }
}

// ---------------- Gateway Request ----------------
class GatewayRequest {
  final String? bookingId;
  final GatewayRequestDetails? gatewayRequestDetails;

  GatewayRequest({this.bookingId, this.gatewayRequestDetails});

  factory GatewayRequest.fromJson(Map<String, dynamic> json) {
    return GatewayRequest(
      bookingId: json['bookingId'],
      gatewayRequestDetails: json['gatewayRequest'] != null
          ? GatewayRequestDetails.fromJson(json['gatewayRequest'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'gatewayRequest': gatewayRequestDetails?.toJson(),
    };
  }
}

class GatewayRequestDetails {
  final int? amount;
  final String? merchantId;
  final String? redirectUrl;
  final String? redirectMode;
  final String? merchantUserId;
  final PaymentInstrument? paymentInstrument;
  final String? merchantTransactionId;

  GatewayRequestDetails({
    this.amount,
    this.merchantId,
    this.redirectUrl,
    this.redirectMode,
    this.merchantUserId,
    this.paymentInstrument,
    this.merchantTransactionId,
  });

  factory GatewayRequestDetails.fromJson(Map<String, dynamic> json) {
    return GatewayRequestDetails(
      amount: json['amount'],
      merchantId: json['merchantId'],
      redirectUrl: json['redirectUrl'],
      redirectMode: json['redirectMode'],
      merchantUserId: json['merchantUserId'],
      paymentInstrument: json['paymentInstrument'] != null
          ? PaymentInstrument.fromJson(json['paymentInstrument'])
          : null,
      merchantTransactionId: json['merchantTransactionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'merchantId': merchantId,
      'redirectUrl': redirectUrl,
      'redirectMode': redirectMode,
      'merchantUserId': merchantUserId,
      'paymentInstrument': paymentInstrument?.toJson(),
      'merchantTransactionId': merchantTransactionId,
    };
  }
}

// ---------------- Payment Instrument ----------------
class PaymentInstrument {
  final String? type;

  PaymentInstrument({this.type});

  factory PaymentInstrument.fromJson(Map<String, dynamic> json) {
    return PaymentInstrument(type: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type};
  }
}

// ---------------- Initial Gateway Response ----------------
class InitialGatewayResponse {
  final bool? success;
  final GatewayResponse? gatewayResponse;

  InitialGatewayResponse({this.success, this.gatewayResponse});

  factory InitialGatewayResponse.fromJson(Map<String, dynamic> json) {
    return InitialGatewayResponse(
      success: json['success'],
      gatewayResponse: json['gatewayResponse'] != null
          ? GatewayResponse.fromJson(json['gatewayResponse'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'gatewayResponse': gatewayResponse?.toJson(),
    };
  }
}

// ---------------- Final Gateway Response ----------------
class FinalGatewayResponse {
  final bool? success;
  final GatewayResponse? gatewayResponse;

  FinalGatewayResponse({this.success, this.gatewayResponse});

  factory FinalGatewayResponse.fromJson(Map<String, dynamic> json) {
    return FinalGatewayResponse(
      success: json['success'],
      gatewayResponse: json['gatewayResponse'] != null
          ? GatewayResponse.fromJson(json['gatewayResponse'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'gatewayResponse': gatewayResponse?.toJson(),
    };
  }
}

// ---------------- Gateway Response ----------------
class GatewayResponse {
  final String? code;
  final GatewayResponseData? data;
  final String? message;
  final bool? success;

  GatewayResponse({this.code, this.data, this.message, this.success});

  factory GatewayResponse.fromJson(Map<String, dynamic> json) {
    return GatewayResponse(
      code: json['code'],
      data: json['data'] != null ? GatewayResponseData.fromJson(json['data']) : null,
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'data': data?.toJson(),
      'message': message,
      'success': success,
    };
  }
}

// ---------------- Gateway Response Data ----------------
class GatewayResponseData {
  final String? state;
  final int? amount;
  final String? merchantId;
  final String? responseCode;
  final String? transactionId;
  final PaymentInstrument? paymentInstrument;
  final String? merchantTransactionId;

  GatewayResponseData({
    this.state,
    this.amount,
    this.merchantId,
    this.responseCode,
    this.transactionId,
    this.paymentInstrument,
    this.merchantTransactionId,
  });

  factory GatewayResponseData.fromJson(Map<String, dynamic> json) {
    return GatewayResponseData(
      state: json['state'],
      amount: json['amount'],
      merchantId: json['merchantId'],
      responseCode: json['responseCode'],
      transactionId: json['transactionId'],
      paymentInstrument: json['paymentInstrument'] != null
          ? PaymentInstrument.fromJson(json['paymentInstrument'])
          : null,
      merchantTransactionId: json['merchantTransactionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'amount': amount,
      'merchantId': merchantId,
      'responseCode': responseCode,
      'transactionId': transactionId,
      'paymentInstrument': paymentInstrument?.toJson(),
      'merchantTransactionId': merchantTransactionId,
    };
  }
}
