import 'package:intl/intl.dart';

String formatDate(String input){
  var inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
  var outputFormat = DateFormat('yyyy MMM dd HH:mm a');
  var inDate= inputFormat.parse(input);
  return outputFormat.format(inDate);

}