import 'package:flutter/material.dart';
import 'package:sdctechmedia/api.dart';
import 'package:dio/dio.dart';
import 'package:sdctechmedia/distributorproducer.dart';
import 'package:sdctechmedia/enteramount.dart';
import 'package:sdctechmedia/ratecard.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
class AddDistributorProducer extends StatefulWidget {
  const AddDistributorProducer({super.key});

  @override
  State<AddDistributorProducer> createState() => _AddDistributorProducerState();
}
class _AddDistributorProducerState extends State<AddDistributorProducer> {
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
                      child: FormBuilderDropdown<String>(
                        name: 'stateRefID',

                        // controller: TextEditingstateRefID,
                        //initialValue: '1',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color(0xFFC8C8C8)),
                          ),

                          hintText: 'Select State',
                        ),
                        items:  statedata.map((item) {
                          return new DropdownMenuItem(
                            child: new Text(item['state']),
                            value: item['stateRefID'].toString(),
                            //controller: TextEditingstateRefID,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            //_selectedSate=val;
                            //stateRefID=val.toString();
                          });
                        },
                        // initialValue: _selectedSate,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        valueTransformer: (val) =>
                            val?.toString(),
                      )),
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

                      hintText: "Address",
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


                    controller: ShippingaddressController,
                    decoration: InputDecoration(

                      hintText: "Shipping Address",
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


                    controller: sameaddressController,
                    decoration: InputDecoration(

                      hintText: "Same Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),

                      ),
                    ),
                  ),
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
                    controller: state,
                    decoration: InputDecoration(

                      hintText: "State",
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

                          db.adddistributor(DistributorProducerController.text,FilmCircuitAreaController.text,
                            ContactpersonController.text,ContactnumberController.text,addressController.text,
                              ShippingaddressController.text,sameaddressController.text,state.text,
                              ContactEmailController.text,GstController.text,CompanyVatTinController.text,
                              CompanyCstNumController.text,CompanyServiceTaxNumberController.text,
                              CompanyPanNUmberController.text)
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
