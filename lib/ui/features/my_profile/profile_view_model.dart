import 'package:flutter/cupertino.dart';
import 'package:zumi_app/ui/features/my_profile/widgets/available_time_content.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/common_validations.dart';

class ProfileViewModel extends ViewModel with CommonValidations {
  bool isPlanSelect = true;
  List<Data> showTimeList = [];
  void changeStatusAvailTime() {
    isPlanSelect = !isPlanSelect;
    notifyListeners();
  }

  void setTime() {
    final setContents = {
      'data': [
        {
          "day": "Monday",
          "from_time": "7:00 AM",
          "to_time": "9:00 AM",
          "status": true,
        },
        {
          "day": "Tuesday",
          "from_time": "7:00 AM",
          "to_time": "9:00 AM",
          "status": true,
        },
        {
          "day": "Wednesday",
          "from_time": "7:00 AM",
          "to_time": "9:00 AM",
          "status": true,
        },
        {
          "day": "Thursday",
          "from_time": "7:00 AM",
          "to_time": "9:00 AM",
          "status": true,
        },
        {
          "day": "Friday",
          "from_time": "7:00 AM",
          "to_time": "9:00 AM",
          "status": true,
        },
        {
          "day": "Saturday",
          "from_time": "7:00 AM",
          "to_time": "9:00 AM",
          "status": true,
        },
        {
          "day": "Sunday",
          "from_time": "7:00 AM",
          "to_time": "9:00 AM",
          "status": true,
        }
      ]
    };
    var getData = AvailableTimeContent.fromJson(setContents);
    showTimeList = getData.data!;
    ChangeNotifier();
  }
}
