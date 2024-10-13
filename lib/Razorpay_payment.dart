import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController(); // New Controller for Phone Number

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    debugPrint('Razorpay Initialized'); // Debugging line
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    _amountController.dispose();
    _nameController.dispose();
    _phoneController.dispose(); // Dispose the new controller
    super.dispose();
  }

  void openCheckout() {
    double enteredAmount = double.tryParse(_amountController.text) ?? 0;
    int amountInPaise = (enteredAmount * 100).toInt();

    // Validate inputs
    if (amountInPaise <= 0 || _nameController.text.isEmpty || _phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter a valid name, phone number, and amount");
      return;
    }

    var options = {
      'key': 'rzp_test_LiR2QE3i3wNaBY', // Replace with your actual test key
      'amount': amountInPaise,
      'name': _nameController.text,
      'description': 'Payment for Services',
      'prefill': {
        'contact': _phoneController.text, // Use entered phone number
        'email': 'test@razorpay.com',
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      // ignore: unnecessary_null_comparison
      if (_razorpay != null) {
        _razorpay.open(options);
      } else {
        Fluttertoast.showToast(msg: "Razorpay not initialized");
      }
    } catch (e) {
      debugPrint('Error opening Razorpay: $e'); // Catch and log errors
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "ERROR: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL WALLET: ${response.walletName}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Razorpay Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter Names',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController, // New TextField for Phone Number
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                openCheckout();
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
