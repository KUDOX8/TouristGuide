import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/utils/constants.dart';
import '../../../core/notifiers/theme_notifier.dart';
import '../../shared/widgets/popup_message.dart';
import 'widgets/navigator_button.dart';

class AddLocation extends StatefulWidget {
  static const String id = '/add_location';
  const AddLocation({Key? key}) : super(key: key);

  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  String _eventName = '';
  String _eventDiscription = '';
  List<dynamic> arguments = [];

  final _toast = FToast();
  @override
  void initState() {
    super.initState();
    _toast.init(context);
  }

  DateTime startDate = DateTime.now();
  String formattedStartDate = DateFormat(yyyyMMddFormat).format(DateTime.now());

  DateTime endDate = DateTime.now().add(const Duration(days: 1));
  String formattedEndDate = DateFormat(yyyyMMddFormat)
      .format(DateTime.now().add(const Duration(days: 1)));

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'New Event',
          style:
              TextStyle(color: Theme.of(context).appBarTheme.backgroundColor),
        ),
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
        color: themeNotifier.isDarkMode ? darkBackgroundColor : white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _screenSize.height * 0.05),
            const SizedBox(
              child: Text(
                'Location Information',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: _screenSize.height * 0.08,
            ),
            const Center(
              child: Text('Event name'),
            ),
            SizedBox(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter the name of the event',
                ),
                onChanged: (value) {
                  setState(() {
                    _eventName = value;
                  });
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Center(child: Text('Decription')),
            SizedBox(
              height: _screenSize.height * 0.20,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Write information about the event',
                ),
                onChanged: (value) {
                  setState(() {
                    _eventDiscription = value;
                  });
                },
                maxLines: 10,
                maxLength: 200,
                textInputAction: TextInputAction.newline,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => showDatePicker(
                          context: context,
                          initialDate: startDate,
                          firstDate: DateTime.now(),
                          useRootNavigator: true,
                          lastDate:
                              DateTime.now().add(const Duration(days: 120)))
                      .then((value) {
                    setState(() {
                      if (value == null) return;

                      startDate = value;
                      formattedStartDate =
                          DateFormat(yyyyMMddFormat).format(startDate);
                      endDate = value.add(const Duration(days: 1));
                      formattedEndDate =
                          DateFormat(yyyyMMddFormat).format(endDate);
                    });
                  }),
                  child: SizedBox(
                    width: 140,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text('Start Date'),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: grey, width: 2)),
                          hintText: formattedStartDate,
                          hintStyle: const TextStyle(color: white)),
                      enabled: false,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => showDatePicker(
                          context: context,
                          initialDate: startDate.add(const Duration(days: 1)),
                          firstDate: startDate.add(const Duration(days: 1)),
                          lastDate:
                              DateTime.now().add(const Duration(days: 120)))
                      .then((value) {
                    if (value == null) return;
                    setState(() {
                      endDate = value;
                      formattedEndDate =
                          DateFormat(yyyyMMddFormat).format(value);
                    });
                  }),
                  child: SizedBox(
                    width: 140,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text('End Date'),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: grey, width: 2)),
                          hintText: formattedEndDate,
                          hintStyle: const TextStyle(color: white)),
                      enabled: false,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            NavigatorButton(
                title: 'Next',
                onTap: () {
                  if (_eventName.isEmpty) {
                    _toast.showToast(
                      child: const PopUpMessage(
                        message: 'Write the event name',
                      ),
                      gravity: ToastGravity.BOTTOM,
                    );
                  } else if (_eventDiscription.trim().isEmpty) {
                    _toast.showToast(
                      child: const PopUpMessage(
                        message: 'Write information about event',
                      ),
                      gravity: ToastGravity.BOTTOM,
                    );
                  } else {
                    setState(() {
                      arguments.add(_eventName.trim());
                      arguments.add(_eventDiscription.trim());
                    });
                    Navigator.pushNamed(context, newEventPicturePage,
                        arguments: arguments);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
