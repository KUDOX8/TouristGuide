import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourist_guide/main.dart';
import 'package:tourist_guide/ui/pages/new_location/widgets/large_new_image.dart';
import 'package:tourist_guide/utils/constants.dart';
import '../../../core/notifiers/theme_notifier.dart';
import 'widgets/navigator_button.dart';
import 'package:tourist_guide/l10n/localization.dart';

class LocationPicture extends ConsumerStatefulWidget {
  static const String id = '/location_picture';

  const LocationPicture({Key? key}) : super(key: key);

  @override
  _LocationPictureState createState() => _LocationPictureState();
}

class _LocationPictureState extends ConsumerState<LocationPicture> {
  XFile? image = XFile('');
  String _locationLink = '';

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifier);
    final Size _screenSize = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.newEvent,
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
        color: theme.isDarkMode ? darkBackgroundColor : white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _screenSize.height * 0.03,
              ),
              SizedBox(
                height: 50,
                width: _screenSize.width * 0.7,
                child: Text(
                  context.loc.addPic,
                  style: const TextStyle(
                    color: purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                LargeNewImage(imagePath: image!.path),
                cameraButton(title: context.loc.camera),
              ]),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    label: Text(
                      context.loc.urlLocation,
                      style: TextStyle(color: grey),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: grey, width: 2)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: context.loc.eURL,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _locationLink = value;
                    });
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              NavigatorButton(
                title: context.loc.finish,
                onTap: () async {
                  // setState(() {
                  //   isLoading = true;
                  // });

                  // await _db.uploadImages(images, args[0]);
                  // String imagePath = await _db.getImageURL(args[0]);
                  // _db.addNewPlace(
                  //     args[0], args[1], args[2], imagePath, [], 0, 0);

                  // dynamic placeList;
                  // switch (args[1]) {
                  //   case 'Cafe':
                  //     placeList = Provider.of<CafeNotifier>(context,
                  //         listen: false);
                  //     break;

                  //   case 'Garden':
                  //     placeList = Provider.of<GardenNotifier>(context,
                  //         listen: false);
                  //     break;
                  //   case 'Mall':
                  //     placeList = Provider.of<MallNotifier>(context,
                  //         listen: false);
                  //     break;
                  //   case 'Most Popular':
                  //     placeList = Provider.of<MostPopularNotifier>(
                  //         context,
                  //         listen: false);
                  //     break;

                  //   case 'Restuarant':
                  //     placeList = Provider.of<RestuarantNotifier>(
                  //         context,
                  //         listen: false);
                  //     break;
                  //   default:
                  // }
                  // await _db.getPlaces(
                  //     placeList,
                  //     args[1]
                  //             .toString()
                  //             .replaceAll(' ', '_')
                  //             .toLowerCase() +
                  //         's');

                  Navigator.pushNamed(context, newEventConfirmedPage);
                },
              ),
            ],
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
    try {
      image = await ImagePicker().pickImage(
          source: source, imageQuality: 80, maxHeight: 480, maxWidth: 640);

      // if (image == null || index > 4) return;

      // final imagetemporary = XFile(image.path);
      setState(() {});
    } on PlatformException {
      return null;
    }
  }
}
