import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class ViewModel extends ChangeNotifier {
  static const genericErrorMessage =
      "Something went wrong, Please try again later";
  bool _isLoading = false;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  ///error message for showing in snackBar
  ValueChanged<String?>? onError;

  void callApi(AsyncCallback api) {
    isLoading = true;
    api().then((_) {
      isLoading = false;
    }).catchError((th, stackTrace) {
      isLoading = false;
      developer.log("Caught Error while calling api: $th");
      developer.log("Type of Exception: ${th.runtimeType}");
      developer.log('Stack Trace: $stackTrace');
      onError?.call(genericErrorMessage);
    });
  }

  ///subclasses should override this method.
  ///in order to reset the state of this ViewModel.
  void invalidate() {}
}

///should be used if we want to access viewModel inside initState method of a StateFul Widget.
///@author simarjot singh kalsi
void withViewModel<VIEW_MODEL extends ViewModel>(
  BuildContext context,
  void Function(VIEW_MODEL viewModel) function,
) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final provider = Provider.of<VIEW_MODEL>(context, listen: false);
    function.call(provider);
  });
}
