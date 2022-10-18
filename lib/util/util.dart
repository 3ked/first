  // @override
  // void initState() {
  //   setState(() {
  //     AppPreferences.getList().then((value) => myList = value);
  //     if (myList != null) {
  //       var newList = myList!.map((e) => Cvfile.fromJson(e)).toList();
  //       BlocProvider.of<CvCubitCubit>(context).toggleCVFiles(newList);
  //     }
  //   });

  //   super.initState();
  // }

////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////
///////////////////////////////////
// List<String>? myList;
//     myList = await AppPreferences.getList().then((value) => value);
//     print("my : $myList");
//     if (myList != null) {
//       List<Cvfile> newList = myList.map((e) => Cvfile.fromJson(e)).toList();
//       BlocProvider.of<CvCubitCubit>(context).toggleCVFiles(newList);
//       print("new : ${newList.length}");
//       print(
//           "Bloc : ${BlocProvider.of<CvCubitCubit>(context).state.files.length}");
//     }

// <queries>

//         <!-- If your app opens https URLs -->
//         <intent>
//             <action android:name="android.intent.action.VIEW" />

//             <data android:schemas="https" />
//         </intent>
//         <!-- If your app makes call -->
//         <intent>
//             <action android:name="android.intent.action.DIAL" />

//             <data android:schemas="tel" />
//         </intent>
//         <!-- If your app opens emails -->
//         <intent>
//             <action android:name="android.intent.action.SEND" />

//             <data android:mimeType="*/*" />
//         </intent>
//         <intent>
//             <action android:name="android.intent.action.GET_CONTENT" />

//             <data android:mimeType="*/*" />
//         </intent>
//     </queries>

    // implementation 'com.google.android.gms:play-services-base:17.5.0'
    // implementation 'com.google.firebase:firebase-analytics:18.0.0'