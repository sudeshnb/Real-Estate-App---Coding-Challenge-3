import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proplink/src/features/home/data/models/property.dart';

class GoogleMapViewState extends Equatable {
  final CameraPosition center;
  final Set<Marker> markers;

  const GoogleMapViewState({
    required this.center,
    this.markers = const {},
  });

  @override
  List<Object> get props => [center, markers];
}

///
class GoogleMapViewCubit extends Cubit<GoogleMapViewState> {
  GoogleMapViewCubit() : super(const GoogleMapViewState(center: googlePlex));

  static const CameraPosition googlePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> load(Property property) async {
    final double latitude = double.parse(property.latitude!);
    final double longitude = double.parse(property.longitude!);

    final Marker marker = Marker(
      markerId: MarkerId(property.id!),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: property.area!,
        snippet: property.address,
      ),
    );
    emit(
      GoogleMapViewState(
        center: CameraPosition(target: LatLng(latitude, longitude), zoom: 15),
        markers: {...state.markers, marker},
      ),
    );
  }
}
