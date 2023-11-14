class ServiceUrl {
//  service category
  static String termcondition =
      'category/settings?key=term_of_condition_member';
  static String helpmember = 'category/settings?key=help_member';
  // sesudah perbaikan
  static String kebijakanprivasi = 'category/settings';
  static String servicecategory = 'category/services?limit=7';
  static String promobanner =
      'category/articles?is_show=true&limit=5&page=1&type=banner';
  static String artikel =
      'category/articles?is_show=true&limit=5&page=1&type=article';
  static String kategorispesialis = 'category/doctors/types?service_id=1';
  // service auth
  static String loginemail = 'auth/login';
  // chat
  static String listdokterchat =
      'order/doctors/list/tmdchat?type=umum&page=1&limit=2';
  static String listdokterchatv2 = 'order/doctors/list/tmdchat';
  // dokter
  static String dokter = 'user/doctors/200/schedules?service=tmdchat';
  // inbox
  static String listInbox = 'user/notifications?page=1&limit=20';
  // schedule dokter
  static final scheduledokter = (final int id) => 'user/doctors/$id/schedules';
}
