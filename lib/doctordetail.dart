import 'package:flutter/material.dart';
import 'package:flutter_pro/confirmappointment.dart';
import 'package:flutter_pro/firebase_auth_service.dart';
import 'package:flutter_pro/patientdetails.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DoctorDetails extends StatefulWidget {

  String? doctor_name;
  String? doctor_image;
  String? doctor_uid;


  DoctorDetails({Key? key, required this.doctor_name, required this.doctor_image, required this.doctor_uid}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState(doctor_name: doctor_name, doctor_image: doctor_image, doctor_uid: doctor_uid);
}

class _DoctorDetailsState extends State<DoctorDetails> {

  String? doctor_name;
  String? doctor_uid;
  String? doctor_image;

  late Razorpay _razorpay;

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_fBcJ8o0j88nuUY',
      'amount': 5000, // amount in paise (5000 paise = Rs 50)
      'name': 'Med Care',
      'prefill': {
        'contact': '9429941467',
        'email': 'medCare@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }


  void handlePaymentSuccess(PaymentSuccessResponse response)
  {
    Fluttertoast.showToast(msg: 'Payment Successful' + response.paymentId!, toastLength: Toast.LENGTH_SHORT);
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
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }



  _DoctorDetailsState({
      required
      this.doctor_name,
      required
      this.doctor_image,
      required
      this.doctor_uid
    });

    @override
    Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('        Doctor Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(doctor_image != null ? doctor_image! : "assets/doctorimage.png"),
                    )),
                    ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor_name != null ? doctor_name! : "Dr Dev Shah",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'General Physician',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
              ]
              ),
              SizedBox(height: 20),
              Text(
                'About',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () async {

                      setState(() {
                        openCheckout();
                      });

                      doctor = "Dr. Shailu";

                      String res = await AuthMethods().addAppointment(
                          name: name,
                          date: date,
                          time: time,
                          doctor: doctor_name!,
                          phone: phone,
                          doctor_uid: doctor_uid!,);

                      // if(res == "Successfully appointment booked")
                      //   {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ConfirmAppointment(),
                      //       ),
                      //     );
                      //   }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Set button color
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0), // Set padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Set rounded corners
                      ),
                    ),
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                        color: Colors.white, // Set text color
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
        ),
      ),
    ),);
  }
}
