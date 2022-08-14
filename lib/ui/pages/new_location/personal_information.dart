import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/ui/pages/new_location/widgets/navigator_button.dart';
import 'package:tourist_guide/l10n/localization.dart';

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
              context.loc.newEvent,
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
                     SizedBox(
                      child: Text(
                        context.loc.contactInfo,
                        style: const TextStyle(
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
                          label:  Text(
                            context.loc.name,
                            style: const TextStyle(color: grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: grey, width: 2)),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: context.loc.eFullName,
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
                          label:  Text(
                            context.loc.pNum,
                            style: const TextStyle(color: grey),
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
                          label:  Text(
                            context.loc.email,
                            style: const TextStyle(color: grey),
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
                        title: context.loc.next,
                        onTap: () {
                          if (_fullName.trim().isEmpty) {
                            _toast.showToast(
                              child:  PopUpMessage(
                                message: context.loc.wFullName,
                              ),
                              gravity: ToastGravity.BOTTOM,
                            );
                          } else if (_phoneNumber.trim().isEmpty) {
                            _toast.showToast(
                              child:  PopUpMessage(
                                message: context.loc.wPNum,
                              ),
                              gravity: ToastGravity.BOTTOM,
                            );
                          } else if (_email.trim().isEmpty) {
                            _toast.showToast(
                              child:  PopUpMessage(
                                message: context.loc.wEmail,
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
