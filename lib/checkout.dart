import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'confirmappointment.dart';

class Checkout extends StatefulWidget {

  final String doctorName;
  final String doctorUid;
  final String doctorSpec;
  final String patientName;
  final String patientAge;
  final String patientMobile;
  final String date;
  final String shift;

  const Checkout({super.key, required this.doctorName, required this.doctorUid, required this.patientName, required this.patientAge, required this.patientMobile, required this.date, required this.shift, required this.doctorSpec});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  late Razorpay _razorpay;

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mm0lF5G5ag',
      'amount': 5000,
      'name' : 'Med Care',
      'prefill': {
        'contact' : '9429941467',
        'email' : 'medCare@gmail.coom'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try{
      _razorpay.open(options);
    }
    catch(e)
    {
      debugPrint("Payment Failed! Please try again...");
      debugPrint(e as String?);
    }
  }

  Future<void> handlePaymentSuccess(PaymentSuccessResponse response)
  async {

    // String res = await AuthMethods().addAppointment(
    //   name: name,
    //   date: date,
    //   time: time,
    //   doctor: widget.doctorName,
    //   phone: phone,
    //   doctor_uid: widget.doctorUid,);

    // if(res == "Successfully appointment booked")
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ConfirmAppointment(),
        ),
      );
    }
    // Fluttertoast.showToast(msg: 'Payment Successful' + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response)
  {
    Fluttertoast.showToast(msg: 'Payment Failed' + response.message!, toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response)
  {
    Fluttertoast.showToast(msg: 'External wallet' + response.walletName!, toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose()
  {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState()
  {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Doctor Name: " + widget.doctorName, style: TextStyle(fontSize: 20)),
                    Text("Patient Name: " + widget.patientName, style: TextStyle(fontSize: 20)),
                    Text("Patient Age: " + widget.patientAge, style: TextStyle(fontSize: 20)),
                    Text("Patient Mobile: " + widget.patientMobile, style: TextStyle(fontSize: 20)),
                    Text("Date: " + widget.date, style: TextStyle(fontSize: 20)),
                    Text("Shift: " + widget.shift, style: TextStyle(fontSize: 20)),
                  ]
                )
              ),
              Spacer(),
              InkWell(
                onTap: ()=>{
                  setState(() {
                    openCheckout();
                  })
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.green, // Set button color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white, // Set text color
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]
          ),
        )
      ),
    );
  }
}
