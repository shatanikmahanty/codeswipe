class ExceptionFormatter {
  static String format(Object e) => e.toString().startsWith('Exception:')
      ? e.toString().substring(11)
      : e.toString();
}
