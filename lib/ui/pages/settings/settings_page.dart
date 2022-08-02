import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_guide/l10n/localization.dart';
import 'package:tourist_guide/ui/shared/widgets/Custom_Button.dart';
import 'package:tourist_guide/utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    bool isEnglish = true;
    bool darkSelect = false;
    bool lightSelect = true;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double iconsSize = 30;

    void changeLanguage() {
      setState(() {
        isEnglish = !isEnglish;
      });
    }
    void changeAppearance() {
      setState(() {
        lightSelect = !lightSelect;
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          context.loc.settings,
          style: const TextStyle(color: black),
        )),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.0)),
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(children:  [
              ExpansionTile(title: Row(
                children:  [
                  Container(child:  Icon(Icons.dark_mode,color: purple,size: iconsSize,),decoration: const BoxDecoration(shape: BoxShape.circle, color: lightPurple),padding: const EdgeInsets.all(5.0),),
                  const SizedBox(width: 30,),
                  const Text("Appearance"),
                ],
              ),
                children: [
                ListTile(title: const Text("Dark"),selected:!lightSelect,onTap: () => changeAppearance,),
                ListTile(title: const Text("Light"),selected: lightSelect,onTap: ()=> changeAppearance,),
              ],
              ),

              ExpansionTile(title: Row(
                children: [
                  Container(child:  Icon(Icons.language,color: orange,size: iconsSize,),decoration: const BoxDecoration(shape: BoxShape.circle, color: lightOrange),padding: const EdgeInsets.all(5.0),),
                  const SizedBox(width: 30,),
                  const Text("Language"),
                ],
              ),
                children: [
                ListTile(title: const Text("العربية"),selected:!isEnglish,onTap: () => changeLanguage,),
                ListTile(title: const Text("English"),selected: lightSelect,onTap: ()=> changeLanguage,),
              ],
              ),
              ExpansionTile(title: Row(
                children: [
                  Container(child: Icon(Icons.info,color: cyan, size: iconsSize,),decoration: const BoxDecoration(shape: BoxShape.circle, color: lightCyan),padding: const EdgeInsets.all(5.0),),
                  const SizedBox(width: 30,),
                  const Text("About"),
                ],
              ),
                children: const [
                  ListTile(title: Text("Blah ")),

                ],
              ),
              ExpansionTile(title: Row(
                children: [
                  Container(child:  Icon(Icons.feedback,color: pink,size: iconsSize,),decoration: const BoxDecoration(shape: BoxShape.circle, color: lightPink),padding: const EdgeInsets.all(5.0),),
                  const SizedBox(width: 30,),
                  const Text("Feedback"),
                ],
              ),
                children: const [
                  ListTile(title: Text("For the feedback contact us via this Email:")),

                ],
              ),
              const SizedBox(height: 30.0,),
              Column(

                children: [
                  CupertinoButton(onPressed: (){
                    //Todo: Go to form page
                    }, child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.business),
                      SizedBox(width: 5,),
                      Text("Sign Your Business with us"),
                    ],
                  ),)
                ],
              ),
              const SizedBox(height: 15.0,),
              OutlinedButton(onPressed: (){}, child: const Text("Clear Your Bookmarks",style: TextStyle(color: red),)),
              const SizedBox(height: 15.0,),
              Column(children: [
                 Text("Made by: ",style: titleTextStyle,),
                Column(
                  children: [
                    Image.asset("assets/images/AlAhsa_logo.png",width: width/4,height: height/4,),
                    const Text("Version 1.0.0 v ",style: TextStyle(color: grey),),
                  ],
                ),
              ],)

            ],),
          ),
        )
      ),
    );
  }


}
