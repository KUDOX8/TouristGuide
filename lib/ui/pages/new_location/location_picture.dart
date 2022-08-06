import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: _screenSize.height * 0.1,
            ),
            SizedBox(
              height: 50,
              width: _screenSize.width * 0.7,
              child: const Text(
                'Add picture',
              ),
            ),
            Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              LargeNewImage(imagePath: image!.path),
              cameraButton(title: 'camera'),
            ]),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30.0,
            ),
            NavigatorButton(
              title: 'Finish',
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

                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
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
          source: source, imageQuality: 30, maxHeight: 480, maxWidth: 640);

      // if (image == null || index > 4) return;

      // final imagetemporary = XFile(image.path);
      setState(() {});
    } on PlatformException {
      return null;
    }
  }
}
