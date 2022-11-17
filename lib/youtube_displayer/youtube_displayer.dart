import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeDisplay extends StatefulWidget {
  const YoutubeDisplay({Key? key}) : super(key: key);

  @override
  State<YoutubeDisplay> createState() => _YoutubeDisplayState();
}

class _YoutubeDisplayState extends State<YoutubeDisplay> {

  bool autoPlay = false;
  late YoutubePlayerController _controller;

  String url = "https://www.youtube.com/watch?v=_0OVRN4vU20";

  static String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }

    return null;
  }

  @override
  void initState() {
    _controller = YoutubePlayerController()..onInit = (){
      if(autoPlay) {
        _controller.loadVideoById(videoId: '${convertUrlToId(url)}');
      } else {
        _controller.cueVideoById(videoId: '${convertUrlToId(url)}');
      }
    };
    super.initState();
  }

  final textController = PhoneController(null);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text('YouTube Player'),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(color: Colors.blue, height: 520, width: double.infinity, child: Column(children: [
                    SizedBox(height: 100,),
                    // TextFormField(
                    //   controller: textController,
                    // ),
                    // SizedBox(height: 50,),
                    PhoneFormField(
                      controller: textController,     // controller & initialValue value
                      initialValue: null,   // can't be supplied simultaneously
                      shouldFormat: true,    // default
                      defaultCountry: IsoCode.ET, // default
                      decoration: InputDecoration(
                        hintText: "Phone",
                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: PhoneValidator.validMobile(),   // default PhoneValidator.valid()
                      // isCountryChipPersistent: false, // default
                      // isCountrySelectionEnabled: true, // default
                      // countrySelectorNavigator: CountrySelectorNavigator.bottomSheet(),
                      // showFlagInInput: true,  // default
                      // flagSize: 16,           // default
                      // autofillHints: [AutofillHints.telephoneNumber], // default to null
                      // enabled: true,          // default
                      // autofocus: false,       // default
                      // onSaved: (PhoneNumber p) => print('saved $p'),   // default null
                      // onChanged: (PhoneNumber p) => print('saved $p'), // default null
                      // ... + other textfield params
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // String springFieldUSA = '+1-417-555-5470';
                          // // String springFieldUSASimpleNoRegion = '4175555470';
                          // // RegionInfo region = RegionInfo(name: 'US', code: 'US', prefix: 1);
                          // // bool isValid = await PhoneNumberUtil().validate(springFieldUSASimpleNoRegion, regionCode: region.code);
                          if(formKey.currentState!.validate()){
                            print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYyyyy");
                            print(textController.value);
                          }
                        },
                        child: Text("Click Me"))
                  ],),),
                  SizedBox(width: double.infinity, height: 170, child: player),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
