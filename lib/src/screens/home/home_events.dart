abstract class HomeState {}

class Initial extends HomeState {}

class Loaded extends HomeState {}

class AddedImageFromGallery extends Loaded {}

class AddedImageFromCamera extends Loaded {}

class AnalyzedImage extends Loaded {}

class Loading extends HomeState {}

class Error extends HomeState {}
