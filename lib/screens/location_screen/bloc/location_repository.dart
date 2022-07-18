import 'package:rick_and_morty_app/models/location_model.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/location_provider.dart';

class LocationRepository{
  Future<List<LocationModel>> getLocation(){
    LocationProvider provider = LocationProvider();
    
    return provider.getLocation();
  }
}