// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:intl/intl.dart';
// import 'package:my_tameen/providers/languages.dart';
// import 'package:provider/provider.dart';

// class StartTheService extends StatelessWidget {
//   final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
//   static const routeName = '/start-service-screen';

//   @override
//   Widget build(BuildContext context) {
//     final lang = Provider.of<Languages>(context, listen: false);

//     return Scaffold(
//       backgroundColor: Theme.of(context).canvasColor,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
//         backgroundColor: Theme.of(context).canvasColor,
//         elevation: 4,
//         centerTitle: true,
//         title: Container(
//           child: Text(
//             lang.translation['startService'][Languages.selectedLanguage],
//             style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontFamily: "tajawal",
//                 color: Theme.of(context).primaryColor,
//                 fontSize: 28),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             FormBuilder(
//               key: _fbKey,
//               initialValue: {
//                 'date': DateTime.now(),
//                 'accept_terms': false,
//               },
//               autovalidate: true,
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     //height: 60,
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderDateTimePicker(
//                       attribute: "date",
//                       inputType: InputType.date,
//                       format: DateFormat("yyyy-MM-dd"),
//                       decoration:
//                           InputDecoration(labelText: "Appointment Time"),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     //height: 60,
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderSlider(
//                       attribute: "slider",
//                       validators: [FormBuilderValidators.min(6)],
//                       min: 0.0,
//                       max: 10.0,
//                       initialValue: 1.0,
//                       divisions: 20,
//                       decoration:
//                           InputDecoration(labelText: "Number of things"),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderCheckbox(
//                       attribute: 'accept_terms',
//                       label: Text(
//                           "I have read and agree to the terms and conditions"),
//                       validators: [
//                         FormBuilderValidators.requiredTrue(
//                           errorText:
//                               "You must accept terms and conditions to continue",
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderDropdown(
//                       attribute: "gender",
//                       decoration: InputDecoration(labelText: "Gender"),
//                       // initialValue: 'Male',
//                       hint: Text('Select Gender'),
//                       validators: [FormBuilderValidators.required()],
//                       items: ['Male', 'Female', 'Other']
//                           .map((gender) => DropdownMenuItem(
//                               value: gender, child: Text("$gender")))
//                           .toList(),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderTextField(
//                       attribute: "age",
//                       decoration: InputDecoration(labelText: "Age"),
//                       validators: [
//                         FormBuilderValidators.numeric(),
//                         FormBuilderValidators.max(70),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderSegmentedControl(
//                       decoration:
//                           InputDecoration(labelText: "Movie Rating (Archer)"),
//                       attribute: "movie_rating",
//                       options: List.generate(5, (i) => i + 1)
//                           .map(
//                               (number) => FormBuilderFieldOption(value: number))
//                           .toList(),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderSwitch(
//                       label: Text('I Accept the tems and conditions'),
//                       attribute: "accept_terms_switch",
//                       initialValue: true,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderTouchSpin(
//                       decoration: InputDecoration(labelText: "Stepper"),
//                       attribute: "stepper",
//                       initialValue: 10,
//                       step: 1,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderRate(
//                       decoration: InputDecoration(labelText: "Rate this form"),
//                       attribute: "rate",
//                       iconSize: 32.0,
//                       initialValue: 1.0,
//                       max: 5.0,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderCheckboxList(
//                       decoration: InputDecoration(
//                           labelText: "The language of my people"),
//                       attribute: "languages",
//                       initialValue: ["Dart"],
//                       options: [
//                         FormBuilderFieldOption(value: "Dart"),
//                         FormBuilderFieldOption(value: "Kotlin"),
//                         FormBuilderFieldOption(value: "Java"),
//                         FormBuilderFieldOption(value: "Swift"),
//                         FormBuilderFieldOption(value: "Objective-C"),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderChoiceChip(
//                       attribute: "favorite_ice_cream",
//                       options: [
//                         FormBuilderFieldOption(
//                             child: Text("Vanilla"), value: "vanilla"),
//                         FormBuilderFieldOption(
//                             child: Text("Chocolate"), value: "chocolate"),
//                         FormBuilderFieldOption(
//                             child: Text("Strawberry"), value: "strawberry"),
//                         FormBuilderFieldOption(
//                             child: Text("Peach"), value: "peach"),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderFilterChip(
//                       attribute: "pets",
//                       options: [
//                         FormBuilderFieldOption(
//                             child: Text("Cats"), value: "cats"),
//                         FormBuilderFieldOption(
//                             child: Text("Dogs"), value: "dogs"),
//                         FormBuilderFieldOption(
//                             child: Text("Rodents"), value: "rodents"),
//                         FormBuilderFieldOption(
//                             child: Text("Birds"), value: "birds"),
//                         FormBuilderFieldOption(
//                             child: Text("Birds2"), value: "birds2"),
//                         FormBuilderFieldOption(
//                             child: Text("Birds3"), value: "birds3"),
//                         FormBuilderFieldOption(
//                             child: Text("Birds4"), value: "birds4"),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 10),
//                     width: 380,
//                     padding: EdgeInsets.only(right: 30, left: 30),
//                     decoration: BoxDecoration(
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Theme.of(context)
//                                 .bottomAppBarColor
//                                 .withOpacity(0.1),
//                             offset: Offset(1.1, 1.1),
//                             blurRadius: 10.0),
//                       ],
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(5),
//                       ),
//                     ),
//                     child: FormBuilderSignaturePad(
//                       decoration: InputDecoration(labelText: "Signature"),
//                       attribute: "signature",
//                       height: 100,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: <Widget>[
//                 MaterialButton(
//                   child: Text("Submit"),
//                   onPressed: () {
//                     if (_fbKey.currentState.saveAndValidate()) {
//                       print(_fbKey.currentState.value["languages"]);
//                     }
//                   },
//                 ),
//                 MaterialButton(
//                   child: Text("Reset"),
//                   onPressed: () {
//                     _fbKey.currentState.reset();
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
