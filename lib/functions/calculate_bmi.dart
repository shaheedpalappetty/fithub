calculatebmi(userDetails) {
  int userWeight = userDetails['userWeight'];
  int userHeightInCM = userDetails['userHeight'];
// Convert height from cm to meters
  double userHeightInMeters = userHeightInCM / 100;
  double bmiValue = userWeight / (userHeightInMeters * userHeightInMeters);
  return bmiValue;
}
