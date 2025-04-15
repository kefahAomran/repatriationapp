// import 'package:flutter/material.dart';
    
// class AddFamMemScreen extends StatelessWidget {

//   const AddFamMemScreen({ Key? key }) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//       ),
//       body: Container(),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AddFamilyMemberScreen(),
//     );
//   }
// }

// class AddFamilyMemberScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Family Member'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Family Member', style: TextStyle(fontSize: 20)),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               hint: Text('Relative'),
//               items: <String>['Relative', 'Friend', 'Colleague']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {},
//             ),
//             SizedBox(height: 10),
//             TextField(decoration: InputDecoration(hintText: 'First Name')),
//             SizedBox(height: 10),
//             TextField(decoration: InputDecoration(hintText: 'Last Name')),
//             SizedBox(height: 10),
//             TextField(decoration: InputDecoration(hintText: 'Father Name')),
//             SizedBox(height: 10),
//             TextField(decoration: InputDecoration(hintText: 'Mother Name')),
//             SizedBox(height: 10),
//             TextField(decoration: InputDecoration(hintText: 'Nation Number')),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               hint: Text('Gender'),
//               items: <String>['Male', 'Female', 'Other']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {},
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Birth Date',
//                 suffixIcon: Icon(Icons.calendar_today),
//               ),
//               readOnly: true,
//               onTap: () {
//                 // Implement Date Picker here
//               },
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               hint: Text('Job'),
//               items: <String>['Employed', 'Unemployed', 'Student']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {},
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               hint: Text('Marriage Status'),
//               items: <String>['Single', 'Married', 'Divorced']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {},
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               hint: Text('Education'),
//               items: <String>['High School', 'Bachelor', 'Master']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {},
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               hint: Text('Health Status'),
//               items: <String>['Healthy', 'Sick', 'Recovering']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {},
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(border: OutlineInputBorder()),
//               hint: Text('Living Status'),
//               items: <String>['With Family', 'Alone', 'With Friends']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {},
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add save functionality here
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }