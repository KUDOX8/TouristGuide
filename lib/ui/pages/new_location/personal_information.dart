import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tourist_guide/main.dart';
import 'package:tourist_guide/ui/pages/new_location/widgets/navigator_button.dart';
import 'package:tourist_guide/l10n/localization.dart';

import '../../../core/notifiers/theme_notifier.dart';
import '../../../utils/constants.dart';
import '../../shared/widgets/popup_message.dart';

class PersonalInformation extends ConsumerStatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends ConsumerState<PersonalInformation> {
  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  List<dynamic> arguments = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifier);
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
              color: theme.isDarkMode ? darkBackgroundColor : white,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: Text(
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
                          validator: (fullName) {
                            if (fullName != null && fullName.length < 6) {
                              return 'Enter at least 6 characters';
                            } else {
                              // setState(() {
                              //   _fullName = fullName!;
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
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            label: Text(
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
                          validator: (number) {
                            if (number != null && number.length != 10) {
                              return 'Enter 10 numbers';
                            } else {
                              // setState(() {
                              //   _phoneNumber = number!;
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
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: Text(
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
                          validator: (email) {
                            if (email != null &&
                                !EmailValidator.validate(email.trim())) {
                              return 'Enter a valid email';
                            } else {
                              // setState(() {
                              //   _email = email!;
                              // });
                              return null;
                            }
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
                            final isValidForm =
                                _formKey.currentState!.validate();
                            if (isValidForm) {
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
                ),
              ))),
    );
  }
}
