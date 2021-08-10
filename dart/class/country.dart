class Country {
  //Property
  var name;
  var language;
  var _animal;

  static var city = "Tokyo";

  //Constructor
  Country(this.name, this.language);
  //Country.language(String name, String language) : this(name, language);

  //Method
  String showLanguage() => this.language;

  //Function Setter
  void setAnimal(String animal) {
    this._animal = animal;
  }

  //Function Getter
  String getAnimal() => this._animal;

  static void Hello() => print("คำทักทาย : Ohayo");

  void showPeople() => print("ประชากร : 125,410,000");

}