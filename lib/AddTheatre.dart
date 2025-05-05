import 'package:flutter/material.dart';
import 'package:sdctechmedia/api.dart';
import 'package:dio/dio.dart';
import 'package:sdctechmedia/distributorproducer.dart';
import 'package:sdctechmedia/enteramount.dart';
import 'package:sdctechmedia/pref_utils.dart';
import 'package:sdctechmedia/ratecard.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
class AddTheatre extends StatefulWidget {
  const AddTheatre({super.key});

  @override
  State<AddTheatre> createState() => _AddTheatreState();
}
class _AddTheatreState extends State<AddTheatre> {
  int _counter = 0;
  bool loading = false;
  Api db=new Api();
  final DistributorProducerController = TextEditingController();
  final FilmCircuitAreaController = TextEditingController();
  final ContactpersonController = TextEditingController();
  final ContactnumberController = TextEditingController();
  final addressController = TextEditingController();
  final ShippingaddressController = TextEditingController();
  final sameaddressController = TextEditingController();
  final state = TextEditingController();
  final ContactEmailController = TextEditingController();
  final GstController = TextEditingController();
  final CompanyVatTinController = TextEditingController();
  final CompanyCstNumController = TextEditingController();
  final CompanyServiceTaxNumberController = TextEditingController();
  final CompanyPanNUmberController = TextEditingController();
  List statedata=[];
  getStateData() async {
    db
        .getStateData()
        .whenComplete(() async{
      setState(() {
        statedata=db.statedata as List;
      });
    });
  }
  void _incrementCounter() {
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getStateData();
    super.initState();
  }
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        titleSpacing: 00.0, // (

        title: Text("Add Distributor/Producer"),
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
                    controller: DistributorProducerController,
                    decoration: InputDecoration(

                      hintText: "producer_distributor_name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    //keyboardType:TextInputType.number,

                    controller: ContactpersonController,
                    decoration: InputDecoration(

                      hintText: "Contact Person Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  SizedBox(
                    height: 55.0,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 3,
                            color: Color(0xFFC8C8C8),
                          ),
                        ),
                        hintText: 'Select State',
                      ),
                      //value: _selectedState, // Initial selected value (optional)
                      items: statedata.map<DropdownMenuItem<String>>((item) {
                        return DropdownMenuItem<String>(

                          value: item['id'].toString(),
                          child: Text(item['state_name']),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          PrefUtils().setdistributorcircuit(val.toString());
                          //_selectedState = val.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a state';
                        }
                        return null;
                      },
                    ),
                  ),
                  /*TextField(
                    //keyboardType:TextInputType.number,

                    controller: FilmCircuitAreaController,
                    decoration: InputDecoration(

                      hintText: "Please Select Circuit Area",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),*/
                  SizedBox(height: 30),
                  TextField(
                    // onChanged: (text) {
                    //   ContactnumberController.text= (int.parse(text)*18/100).toString();
                    //  },
                    maxLength: 10,
                    keyboardType:TextInputType.number,
                    controller: ContactnumberController,
                    decoration: InputDecoration(

                      hintText: "Contact Person Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    // onChanged: (text) {
                    //   ContactnumberController.text= (int.parse(text)*18/100).toString();
                    //  },


                    controller: addressController,
                    decoration: InputDecoration(

                      hintText: "BIlling Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          print(value);
                          setState(() {
                            if(value==true){
                              ShippingaddressController.text=addressController.text;
                              PrefUtils().setsameasbilling("1");

                            }
                            else{
                              ShippingaddressController.text="";
                              PrefUtils().setsameasbilling("0");
                            }
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      const Text('Same As Billing?'),
                    ],
                  ),
                  TextField(
                    // onChanged: (text) {
                    //   ContactnumberController.text= (int.parse(text)*18/100).toString();
                    //  },


                    controller: ShippingaddressController,
                    decoration: InputDecoration(

                      hintText: "Shipping Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),

                  /*TextField(
                    controller: sameaddressController,
                    decoration: InputDecoration(
                      hintText: "Sa",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),*/

                  SizedBox(height: 30),
                  TextField(
                    //keyboardType:TextInputType.number,
                    controller: ContactEmailController,
                    decoration: InputDecoration(

                      hintText: "EmailID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),

                  ),


                  SizedBox(height: 30),
                  TextField(
                    //keyboardType:TextInputType.number,
                    controller: GstController,
                    decoration: InputDecoration(

                      hintText: "GSt",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    //keyboardType:TextInputType.number,
                    controller: CompanyVatTinController,
                    decoration: InputDecoration(

                      hintText: "Company Vat Tin",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    //keyboardType:TextInputType.number,
                    controller: CompanyCstNumController,
                    decoration: InputDecoration(

                      hintText: "Company Cst No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    //keyboardType:TextInputType.number,
                    controller: CompanyServiceTaxNumberController,
                    decoration: InputDecoration(

                      hintText: "Company Service Tax No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    //keyboardType:TextInputType.number,
                    controller: CompanyPanNUmberController,
                    decoration: InputDecoration(

                      hintText: "Company Pan No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

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
                          final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (ContactEmailController.text == null || ContactEmailController.text!='') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please Enter Email")),
                            );
                          }else if (!emailRegex.hasMatch(ContactEmailController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter a valid email address")),
                            );

                          }else{

                            db.adddistributor(DistributorProducerController.text,PrefUtils().getdistributorcircuit(),
                              addressController.text,ShippingaddressController.text,PrefUtils().getsameasbilling(),GstController.text,
                              ContactnumberController.text,ContactpersonController.text,ContactEmailController.text,
                              CompanyVatTinController.text,
                              CompanyCstNumController.text,CompanyServiceTaxNumberController.text,
                              CompanyPanNUmberController.text,state.text,)
                                .whenComplete(() async {
                              var responseMessage = db.responseMessage;
                              print(db.responseCode);
                              if (db.responseCode == "200") {

                                setState(() {
                                  loading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("$responseMessage")),
                                );
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DistributorProducer(),
                                    ),
                                  );
                                });

                              }

                              else {
                                setState(() {
                                  loading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("$responseMessage")),
                                );
                              }
                            });}
                        },


                        child:Text(
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
