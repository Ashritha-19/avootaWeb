import 'package:flutter/material.dart';

class PayPalPaymentScreen extends StatefulWidget {
  const PayPalPaymentScreen({super.key});

  @override
  _PayPalPaymentScreenState createState() => _PayPalPaymentScreenState();
}

class _PayPalPaymentScreenState extends State<PayPalPaymentScreen> {
  bool isPayPalPaymentVisible = true;

  @override
  Widget build(BuildContext context) {
    final paymentDetails = PaymentDetails(
      amount: '1500',
      bookingId: 'PP123456789',
      paymentStatus: 'PAYMENT_PENDING',
      responseMessage: '{"success":true,"code":"PAYMENT_INITIATED","message":"Payment initiated","data":{"transactionId":"ABC123","redirectUrl":"https://paypal.com/pay?token=example"}}',
      providerReferenceId: 'PROVIDER123',
      merchantOrderId: 'ORDER123',
      checksum: 'CHECKSUM123',
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPayPalPaymentVisible) ...[
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(248, 245, 245, 1).withOpacity(0.5),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PhonePay Payment',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A2647),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Breadcrumb(
                      items: ['dashboard', 'paypal payment', 'view'],
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(248, 245, 245, 1).withOpacity(0.5),
                            blurRadius: 6,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hotel Details',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0A2647),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          DetailRow(
                            label: 'Amount',
                            value: '₹${paymentDetails.amount}',
                          ),
                          DetailRow(
                            label: 'Booking ID',
                            value: paymentDetails.bookingId,
                          ),
                          DetailRow(
                            label: 'Payment Status',
                            value: paymentDetails.paymentStatus,
                          ),
                          DetailRow(
                            label: 'Response Message',
                            value: paymentDetails.responseMessage,
                            isMultiLine: true,
                          ),
                          DetailRow(
                            label: 'Provider Reference ID',
                            value: paymentDetails.providerReferenceId,
                          ),
                          DetailRow(
                            label: 'Merchant Order ID',
                            value: paymentDetails.merchantOrderId,
                          ),
                          DetailRow(
                            label: 'Checksum',
                            value: paymentDetails.checksum,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isMultiLine;

  const DetailRow({
    Key? key,
    required this.label,
    required this.value,
    this.isMultiLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: isMultiLine
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentDetails {
  final String amount;
  final String bookingId;
  final String paymentStatus;
  final String responseMessage;
  final String providerReferenceId;
  final String merchantOrderId;
  final String checksum;

  PaymentDetails({
    required this.amount,
    required this.bookingId,
    required this.paymentStatus,
    required this.responseMessage,
    required this.providerReferenceId,
    required this.merchantOrderId,
    required this.checksum,
  });
}

class Breadcrumb extends StatelessWidget {
  final List<String> items;

  const Breadcrumb({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.asMap().entries.map((entry) {
        final isLast = entry.key == items.length - 1;
        return Row(
          children: [
            Text(
              entry.value,
              style: TextStyle(
                color: isLast ? Colors.blue : Colors.grey,
                fontSize: 14,
              ),
            ),
            if (!isLast)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('/'),
              ),
          ],
        );
      }).toList(),
    );
  }
}
