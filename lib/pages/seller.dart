import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:liveauction/pages/seller_controller.dart';
import 'package:liveauction/utils.dart';

const List<String> list = [
  'Collectibles',
  'Antiques',
  'Articrafts',
  'Electronics',
  'Books',
  'Sports',
  'Others',
];

class Seller extends StatefulWidget {
  const Seller({super.key});

  @override
  State<Seller> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  String category = '';
  String dropdownValue = list.first;

  // List<DropdownMenuEntry>;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime? chosenDate;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double W = screenSize.width / 448.0;
    double H = screenSize.height / 973.33;
    return GetBuilder<Sellercontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sell Item',
            style: TextStyle(color: Color.fromARGB(255, 30, 28, 27)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(20.0 * W, 20.0 * H, 20.0 * W, 20.0 * H),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Add Item Details',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0 * H),
                TextFormField(
                  controller: ctrl.item_name,
                  decoration: const InputDecoration(
                    labelText: 'Item name',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                SizedBox(height: 30.0 * H),
                TextFormField(
                  controller: ctrl.description,
                  minLines: 1,
                  maxLines: 10,
                  maxLength: 2000,
                  decoration: const InputDecoration(
                    labelText: 'Item description',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                TextFormField(
                  controller: ctrl.base_price,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                    labelText: 'base price',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                SizedBox(
                  height: 10.0 * H,
                ),
                TextFormField(
                  controller: ctrl.locationchosen,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                SizedBox(
                  height: 10.0 * H,
                ),
                TextFormField(
                  controller: ctrl.item_image,
                  decoration: const InputDecoration(
                    labelText: 'Image Url',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 216, 97, 29))),
                  ),
                ),
                SizedBox(height: 16.0 * H),
                if (chosenDate != null)
                  Text(
                    'Chosen Date: ${chosenDate!.day}/${chosenDate!.month}/${chosenDate!.year}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                SizedBox(height: 16.0 * H),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 30, 28, 27),
                  ),
                  onPressed: () async {
                    // Show date picker and wait for user selection
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );

                    // Update chosenDate if the user selected a date
                    if (pickedDate != null) {
                      setState(() {
                        chosenDate = pickedDate;
                        ctrl.datechosen = chosenDate;
                        ctrl.checkSlotAvailability(
                            chosenDate.toString().substring(0, 10));
                      });
                    }
                  },
                  child: Text(
                    'Choose Date',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),

                SizedBox(height: 16.0 * H),

                // Show the chosen date if it's not null

                // Row(
                //   children: [
                //     ElevatedButton.icon(
                //       onPressed: () => _showCalendar(),
                //       icon: const Icon(Icons.calendar_today_rounded),
                //       label: Text('Select Date: $_selectedDay'),
                //     ),
                //     const SizedBox(
                //       width: 10.0,
                //     ),
                //     // Text(' $_selectedDay'),
                //   ],
                // ),
                Center(
                  child: DropdownMenu<String>(
                    inputDecorationTheme: InputDecorationTheme(
                        fillColor: const Color.fromARGB(255, 216, 97, 29),
                        filled: false,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 216, 97, 29)))),
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                          value: value, label: value);
                    }).toList(),
                    initialSelection: list.first,
                    onSelected: (String? value) {
                      // ctrl.selectedcategory=dropdownValue;
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                      ctrl.item_category = dropdownValue;
                      ctrl.update();
                    },
                  ),
                ),

                SizedBox(
                  height: 10.0 * H,
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    ctrl.addproduct();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 30, 28, 27),
                  ),
                  child: const Text(
                    'Upload',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ))
              ],
            ),
          ),
        ),
      );
    });
  }

  void _showCalendar() {
    showDialog(
        context: context,
        builder: (context) {
          var screenSize = MediaQuery.of(context).size;
          double W = screenSize.width / 448.0;
          double H = screenSize.height / 973.33;
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 425.0 * H,
              padding: const EdgeInsets.all(10.0),
              // child: TableCalendar(
              //   focusedDay: _focusedDay,
              //   firstDay: DateTime.utc(2024, 2, 1),
              //   lastDay: DateTime.utc(2024, 12, 31),
              //   calendarFormat: _calendarFormat,
              //   onFormatChanged: (format) {
              //     setState(() {
              //       _calendarFormat = format;
              //     });
              //   },
              //   selectedDayPredicate: (day) {
              //     return isSameDay(_selectedDay, day);
              //   },
              //   onDaySelected: (selectedDay, focusedDay) {
              //     setState(() {
              //       _selectedDay = selectedDay;
              //       _focusedDay =
              //           focusedDay; // update _focusedDay here as well
              //     });
              //   },
              //   onPageChanged: (focusedDay) {
              //     _focusedDay = focusedDay;
              //   },
              // ),
            ),
          );
        });
  }
}
