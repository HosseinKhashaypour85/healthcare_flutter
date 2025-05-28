String getGreeting() {
  final hour = DateTime
      .now()
      .hour;
  if (hour < 12) {
    return 'صبح بخیر';
  } else if (hour < 17) {
    return 'ظهر بخیر';
  } else {
    return 'عصر بخیر';
  }
}