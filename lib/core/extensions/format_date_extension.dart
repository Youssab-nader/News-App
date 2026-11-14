extension FormatDateExtension on DateTime {
  String formatDate() {
    DateTime publishedTime = this;
    DateTime now = DateTime.now().toUtc();
    Duration diff = now.difference(publishedTime);
    if (diff.inSeconds < 60) {
      return "Just now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minutes ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    } else {
      return "${diff.inDays} days ago";
    }
  }
}