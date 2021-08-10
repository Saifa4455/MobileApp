import 'city.dart';
import 'country.dart';

void main() {
  //var item = new Country.language("Japan", "Japanese");
  //print("ประเทศ : " + item.name);
  //print("ภาษาหลัก : " + item.showLanguage());

  //item.setAnimal("Crane");
  //print("สัตว์ประจำชาติ : " + item.getAnimal());

  //print("เมืองหลวง : " + Country.city);
  //Country.Hello();


//-------------------------------------------------------------------------------

  City item = City("Nagasaki");
  print("เมืองที่สนใจ : " + item.city);
  print("ประเทศ : " + item.name);
  print("ภาษาหลัก : " + item.language);

  item.callSuper();
  item.showPeople();

  item.showProblem();
}