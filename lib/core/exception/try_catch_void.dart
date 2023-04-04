void tryCatchVoid(void Function() process, {String? tag}) {
  try {
    process.call();
  } catch (e) {

  }
}