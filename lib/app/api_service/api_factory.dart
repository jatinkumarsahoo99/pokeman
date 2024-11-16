class ApiFactory{

  static String baseUrl = "https://rti.telangana.gov.in/api/api";

  static var baseUrlAccount = "$baseUrl/Account";

  static String logInUrl = "$baseUrlAccount/GetToken";
  static String registerUrl = "$baseUrlAccount/Register";

  static var baseUrlApplication = "$baseUrl/Application";

  static String userDetails = "$baseUrlApplication/UserDetails";
  static String totalSubmittedApplicationsUrl = "$baseUrlApplication/SubmittedCount";
  static String totalFirstAppealsSubmittedUrl = "$baseUrlApplication/FASubmittedCount";
  static String totalDisposedApplicationsUrl = "$baseUrlApplication/DisposedCount";
  static String totalFirstAppealsDisposedUrl = "$baseUrlApplication/FADisposedCount";
  static String totalDeemedApplicationsUrl = "$baseUrlApplication/DeemedCount";
  static String totalFirstAppealsDeemedUrl = "$baseUrlApplication/FADeemedCount";
  static String totalRejectedApplicationsUrl = "$baseUrlApplication/RejectedCount";
  static String totalFirstAppealsRejectedUrl = "$baseUrlApplication/FARejectedCount";
  static String getAllApplications = "$baseUrlApplication/GetAll";
  static String statusCount = "$baseUrlApplication/StatusCount";
  static String faCount = "$baseUrlApplication/FACount";

  static String apiToken = "";
}
