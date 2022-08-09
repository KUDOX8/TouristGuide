import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/ui/pages/new_location/widgets/navigator_button.dart';

import '../../../core/notifiers/theme_notifier.dart';
import '../../../utils/constants.dart';
import '../../shared/widgets/popup_message.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  List<dynamic> arguments = [];
  final _toast = FToast();
  @override
  void initState() {
    super.initState();
    _toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'New Event',
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.backgroundColor),
            ),
            centerTitle: true,
            iconTheme: Theme.of(context).iconTheme,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: _screenSize.width * 0.08),
              color: themeNotifier.isDarkMode ? darkBackgroundColor : white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: _screenSize.height * 0.05),
                    const SizedBox(
                      child: Text(
                        'Contact Information',
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
                      child: TextField(
                        decoration: InputDecoration(
                          label: const Text(
                            'Name',
                            style: TextStyle(color: grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: grey, width: 2)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter your full name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _fullName = value;
                          });
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    SizedBox(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          label: const Text(
                            'Phone Number',
                            style: TextStyle(color: grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: grey, width: 2)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: '05xxxxxx',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _phoneNumber = value;
                          });
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          label: const Text(
                            'Email',
                            style: TextStyle(color: grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: grey, width: 2)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'person@xxxx.com',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    NavigatorButton(
                        title: 'Next',
                        onTap: () {
                          if (_fullName.trim().isEmpty) {
                            _toast.showToast(
                              child: const PopUpMessage(
                                message: 'Write your full name',
                              ),
                              gravity: ToastGravity.BOTTOM,
                            );
                          } else if (_phoneNumber.trim().isEmpty) {
                            _toast.showToast(
                              child: const PopUpMessage(
                                message: 'Write your phone number',
                              ),
                              gravity: ToastGravity.BOTTOM,
                            );
                          } else if (_email.trim().isEmpty) {
                            _toast.showToast(
                              child: const PopUpMessage(
                                message: 'Write your email',
                              ),
                              gravity: ToastGravity.BOTTOM,
                            );
                          } else {
                            setState(() {
                              arguments.add(_fullName.trim());
                              arguments.add(_phoneNumber.trim());
                              arguments.add(_email.trim());
                            });
                            Navigator.pushNamed(
                                context, newEventInformationPage,
                                arguments: arguments);
                          }
                        }),
                  ],
                ),
              ))),
    );
  }
}
