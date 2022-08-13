import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/utils/constants.dart';
import '../../../core/notifiers/theme_notifier.dart';
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
  double _entryFee = 0.0;
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

  TimeOfDay openTime = const TimeOfDay(hour: 00, minute: 00);
  TimeOfDay closeTime = const TimeOfDay(hour: 00, minute: 00);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    Size _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
            color: themeNotifier.isDarkMode ? darkBackgroundColor : white,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _screenSize.height * 0.05),
                  const SizedBox(
                    child: Text(
                      'Event Information',
                      style: TextStyle(
                        color: purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _screenSize.height * 0.08,
                  ),
                  SizedBox(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text(
                          'Event name',
                          style: TextStyle(color: grey),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: grey, width: 2)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Enter the name of the event',
                      ),
                      validator: (eventName) {
                        if (eventName != null && eventName.length < 3) {
                          return 'Enter at least 3 characters';
                        } else {
                          // setState(() {
                          //   _eventName = eventName!;
                          // });
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    height: _screenSize.height * 0.20,
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Text(
                          'Decription',
                          style: TextStyle(color: grey),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: grey, width: 2)),
                        hintText: 'Write information about the event',
                      ),
                      validator: (desc) {
                        if (desc != null && desc.length < 3) {
                          return 'Enter at least 3 characters';
                        } else {
                          // setState(() {
                          //   _eventDiscription = desc!;
                          // });

                          return null;
                        }
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
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 120)))
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: grey, width: 2)),
                                hintText: formattedStartDate,
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor)),
                            enabled: false,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => showDatePicker(
                                context: context,
                                initialDate:
                                    startDate.add(const Duration(days: 1)),
                                firstDate:
                                    startDate.add(const Duration(days: 1)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 120)))
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
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: grey, width: 2)),
                                hintText: formattedEndDate,
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor)),
                            enabled: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          TimeOfDay? newOpenTime = await showTimePicker(
                            context: context,
                            initialTime: openTime,
                          );

                          if (newOpenTime == null) {
                            return;
                          }

                          setState(() {
                            openTime = newOpenTime;
                          });
                        },
                        child: SizedBox(
                          width: 140,
                          child: TextField(
                            decoration: InputDecoration(
                                label: const Text('Open Time'),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: grey, width: 2)),
                                hintText: openTime.format(context),
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor)),
                            enabled: false,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? newCloseTime = await showTimePicker(
                            context: context,
                            initialTime: closeTime,
                          );

                          if (newCloseTime == null) {
                            return;
                          }

                          setState(() {
                            closeTime = newCloseTime;
                          });
                        },
                        child: SizedBox(
                          width: 140,
                          child: TextField(
                            decoration: InputDecoration(
                                label: const Text('Close Time'),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: grey, width: 2)),
                                hintText: closeTime.format(context),
                                hintStyle: TextStyle(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .backgroundColor)),
                            enabled: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        label: const Text(
                          'Entry Fee',
                          style: TextStyle(color: grey),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: grey, width: 2)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Left it empty if it is free',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _entryFee = value as double;
                        });
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  NavigatorButton(
                      title: 'Next',
                      onTap: () {
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
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
          ),
        ),
      ),
    );
  }
}
