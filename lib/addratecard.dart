import 'package:flutter/material.dart';
import 'package:sdctechmedia/api.dart';
import 'package:dio/dio.dart';
import 'package:sdctechmedia/enteramount.dart';
import 'package:sdctechmedia/pref_utils.dart';
import 'package:sdctechmedia/ratecard.dart';

class AddRateCard extends StatefulWidget {
  final String option;
  final String noofshow;
  final String amount;
  final String amountintax;
  final String id;
  final int index;

  const AddRateCard({required this.option,required this.noofshow,required this.amount,required this.amountintax,required this.id,required this.index, Key? key}) : super(key: key);

  @override
  State<AddRateCard> createState() => _AddRateCardState();
}
class _AddRateCardState extends State<AddRateCard> {
  @override

  int _counter = 0;
  bool loading = false;
  Api db=new Api();
  late TextEditingController OptionsController;
  late TextEditingController NoofshowController;
  late TextEditingController amountController;
  late TextEditingController amountintaxController;

  void _incrementCounter() {
    setState(() {

    });
  }
  void initState() {
    // TODO: implement initState
    OptionsController = TextEditingController(text: widget.option);
    NoofshowController = TextEditingController(text: widget.noofshow);
    amountController = TextEditingController(text: widget.amount);
    amountintaxController = TextEditingController(text: widget.amountintax);
    PrefUtils().setRateCardEditId(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 00.0, // (

        title: Text("Add Rate Card"+PrefUtils().getRateCardEditId()),
      ),
      body: Center(

        child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
          child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              TextField(
                controller: OptionsController,
                decoration: InputDecoration(

                  hintText: "Option",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                keyboardType:TextInputType.number,

                controller: NoofshowController,
                decoration: InputDecoration(

                  hintText: "No of Show",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),

              SizedBox(height: 30),
              TextField(
              onChanged: (text) {
                amountintaxController.text= (int.parse(text)*18/100).toString();
              },

                keyboardType:TextInputType.number,
                controller: amountController,
                decoration: InputDecoration(

                  hintText: "Amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),

                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: amountintaxController,

                decoration: InputDecoration(

                  hintText: "Amount In Tax",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 30),
                  (loading==false)? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffBD1A8D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      elevation: 5,
                    ),
                    onPressed: ()  {
                      // Sign-in logic
                      setState(() {
                        loading = true;
                      });

                      db.addratecard(OptionsController.text, NoofshowController.text, amountController.text, amountintaxController.text)
                          .whenComplete(() async {
                        var responseMessage = db.responseMessage;
                        print(db.responseCode);
                        if (db.responseCode == "200") {

                          setState(() {
                            loading =false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("$responseMessage")),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RateCard(),
                            ),
                          );
                        }
                        else {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("$responseMessage")),
                          );
                        }
                      });
                    },


                    child: Text(
                      'ADD',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                        letterSpacing: 1,
                      ),
                    ),
                  ):CircularProgressIndicator(),
                ],
              ),




            ],

          )),
        ),
      ),
         );
  }
}
