import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool male = false;
  bool female = false;
  bool other = false;
  @override
  void initState() {
    super.initState();
    /*male=true;
    female=false;
    other=false;*/
  }

  @override
  void onPressedMale() {
    setState(() {
      male = true;
      female = false;
      other = false;
    });
  }

  @override
  void onPressedFemale() {
    setState(() {
      male = false;
      female = true;
      other = false;
    });
  }

  @override
  void onPressedOther() {
    setState(() {
      male = false;
      female = false;
      other = true;
    });
  }

  @override
  void opencamera() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 414;
    //double ffem = fem * 0.85;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Stack(
                alignment: Alignment.center,

                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    width: 90,
                    height: 90,
                    child: Image.asset("assets/profileimg.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, top: 50),
                    width: 20,
                    height: 20,

                    child: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff5A2DBC),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          // padding: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              // enabled: false,
              onChanged: () {
                _formKey.currentState!.save();
                debugPrint(_formKey.currentState!.value.toString());
              },
              autovalidateMode: AutovalidateMode.disabled,
              initialValue: const {
                'movie_rating': 5,
                'best_language': 'Dart',
                'age': '13',
                'gender': 'Male',
                'languages_filter': ['Dart'],
              },
              skipDisabled: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 174 * fem),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                              bottomRight: Radius.circular(24.0),
                              bottomLeft: Radius.circular(24.0),
                            ),
                          ),
                          width: 500 * fem,
                          height: 1020 * fem,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 40,
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormBuilderTextField(
                                  autovalidateMode: AutovalidateMode.always,
                                  name: 'age',
                                  decoration: InputDecoration(labelText: 'Age'),
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.numeric(),
                                    FormBuilderValidators.max(70),
                                  ]),
                                  // initialValue: '12',
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                ),
                                FormBuilderDateTimePicker(
                                  name: 'date',
                                  initialEntryMode:
                                      DatePickerEntryMode.calendar,
                                  initialValue: DateTime.now(),
                                  inputType: InputType.both,
                                  decoration: InputDecoration(
                                    labelText: 'Appointment Time',
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        _formKey.currentState!.fields['date']
                                            ?.didChange(null);
                                      },
                                    ),
                                  ),
                                ),

                                Text("your Gender"),

                                Row(
                                  children: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),

                                      onPressed: onPressedMale,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 8,
                                          left: 8,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            (male == true)
                                                ? Image.asset(
                                                  "assets/checked.png",
                                                )
                                                : Image.asset(
                                                  "assets/unchecked.png",
                                                ),
                                            SizedBox(width: 8),
                                            Text("Male"),
                                          ],
                                        ),
                                        width: 80,
                                        height: 42,
                                        decoration: BoxDecoration(
                                          color:
                                              (male == true)
                                                  ? Color(0xffE5DDF4)
                                                  : Colors.white,
                                          border: Border(
                                            top: BorderSide(
                                              color:
                                                  (male == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            bottom: BorderSide(
                                              color:
                                                  (male == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            left: BorderSide(
                                              color:
                                                  (male == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            right: BorderSide(
                                              color:
                                                  (male == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                          ),
                                          //color: Colors.blue,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                            bottomLeft: Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 8),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: onPressedFemale,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 8,
                                          left: 8,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            (female == true)
                                                ? Image.asset(
                                                  "assets/checked.png",
                                                )
                                                : Image.asset(
                                                  "assets/unchecked.png",
                                                ),
                                            SizedBox(width: 8),
                                            Text("Female"),
                                          ],
                                        ),
                                        width: 96,
                                        height: 42,
                                        decoration: BoxDecoration(
                                          color:
                                              (female == true)
                                                  ? Color(0xffE5DDF4)
                                                  : Colors.white,
                                          border: Border(
                                            top: BorderSide(
                                              color:
                                                  (female == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            bottom: BorderSide(
                                              color:
                                                  (female == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            left: BorderSide(
                                              color:
                                                  (female == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            right: BorderSide(
                                              color:
                                                  (female == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                          ),
                                          //color: Colors.blue,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                            bottomLeft: Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                      ),
                                      onPressed: onPressedOther,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          top: 8,
                                          left: 8,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            (other == true)
                                                ? Image.asset(
                                                  "assets/checked.png",
                                                )
                                                : Image.asset(
                                                  "assets/unchecked.png",
                                                ),
                                            SizedBox(width: 8),
                                            Text("Other"),
                                          ],
                                        ),
                                        width: 87,
                                        height: 42,
                                        decoration: BoxDecoration(
                                          color:
                                              (other == true)
                                                  ? Color(0xffE5DDF4)
                                                  : Colors.white,
                                          border: Border(
                                            top: BorderSide(
                                              color:
                                                  (other == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            bottom: BorderSide(
                                              color:
                                                  (other == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            left: BorderSide(
                                              color:
                                                  (other == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                            right: BorderSide(
                                              color:
                                                  (other == true)
                                                      ? Color(0xff5A2DBC)
                                                      : Color(0xffD6D6D6),
                                              width: 1,
                                            ),
                                          ),
                                          //color: Colors.blue,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                            bottomLeft: Radius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState
                                              ?.saveAndValidate() ??
                                          false) {
                                        debugPrint(
                                          _formKey.currentState?.value
                                              .toString(),
                                        );
                                      } else {
                                        debugPrint(
                                          _formKey.currentState?.value
                                              .toString(),
                                        );
                                        debugPrint('validation failed');
                                      }
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 130,
                        top: 100,
                        child: Container(
                          width: 104,
                          height: 104,

                          child: ClipOval(
                            child: Image.asset('assets/profile.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 200,
                        top: 170,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100.0),
                              topRight: Radius.circular(100.0),
                              bottomRight: Radius.circular(100.0),
                              bottomLeft: Radius.circular(100.0),
                            ),
                          ),
                          //color: Colors.transparent,
                          width: 40,
                          height: 40,

                          child: ClipOval(
                            child: IconButton(
                              //onPressed: opencamera,
                              onPressed: () {
                                _showMyDialog();
                              },
                              icon: Icon(Icons.camera_alt, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /*bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(child: Text("Copy Right", textAlign: TextAlign.left)),

            Expanded(child: Text("Version:1.0.0", textAlign: TextAlign.right)),
          ],
        ),
      ), */
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
