import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/ui/pages/new_location/widgets/large_new_image.dart';
import 'package:tourist_guide/utils/constants.dart';
import '../../../core/notifiers/theme_notifier.dart';
import 'widgets/navigator_button.dart';

class LocationPicture extends StatefulWidget {
  static const String id = '/location_picture';

  const LocationPicture({Key? key}) : super(key: key);

  @override
  _LocationPictureState createState() => _LocationPictureState();
}

class _LocationPictureState extends State<LocationPicture> {
  XFile? image = XFile('');
  String _locationLink = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ThemeNotifier themeNotifier =
        Provider.of<ThemeNotifier>(context, listen: true);
    final Size _screenSize = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(
                  height: _screenSize.height * 0.03,
                ),
                SizedBox(
                  height: 50,
                  width: _screenSize.width * 0.7,
                  child: const Text(
                    'Add picture',
                    style: TextStyle(
                      color: purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  builder: (field) {
                    return Column(
                      children: [
                        Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              LargeNewImage(imagePath: image!.path),
                              cameraButton(title: 'camera'),
                            ]),
                        Text(field.errorText ?? '',
                            style:
                                TextStyle(color: Theme.of(context).errorColor)),
                      ],
                    );
                  },
                  validator: (value) {
                    if (image!.path.isEmpty) {
                      return 'Upload a picture';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: const Text(
                        'URL of the location',
                        style: TextStyle(color: grey),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: grey, width: 2)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:
                          'Enter the URL from google map for the location',
                    ),
                    validator: (url) {
                      if (url != null && url.isEmpty) {
                        return 'Enter a valid link';
                      } else {
                        // setState(() {
                        //   _locationLink = url!;
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
                NavigatorButton(
                  title: 'Finish',
                  onTap: () async {
                    final isValidForm = _formKey.currentState!.validate();
                    if (isValidForm) {
                      Navigator.pushNamed(context, newEventConfirmedPage);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cameraButton({
    required String title,
    // required IconData icon,
    // required VoidCallback onClicked,
  }) =>
      IconButton(
        onPressed: () => pickImage(ImageSource.camera),
        icon: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.blue,
        ),
      );

  Future pickImage(source) async {
    final tempImage = await ImagePicker().pickImage(
        source: source, imageQuality: 80, maxHeight: 480, maxWidth: 640);
    if (tempImage == null) return;

    image = tempImage;

    setState(() {});
  }
}
