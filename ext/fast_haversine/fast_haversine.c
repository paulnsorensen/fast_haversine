// Copyright 2014 Paul Sorensen <paulnsorensen@gmail.com>

#include <ruby.h>
#include <math.h>

static const double EARTH_RADIUS_IN_KM = 6371.0;
static const double EARTH_RADIUS_IN_MI = 3958.755864232;
static const double RADIAN_PER_DEGREE = M_PI / 180.0;

static double haversine_c(
      double lat1,
      double lon1,
      double lat2,
      double lon2) {
  double lon_delta = (lon2 - lon1) * RADIAN_PER_DEGREE;
  double lat_delta = (lat2 - lat1) * RADIAN_PER_DEGREE;
  double lat1_rad = lat1 * RADIAN_PER_DEGREE;
  double lat2_rad = lat2 * RADIAN_PER_DEGREE;
  double a = pow(sin(lat_delta * 0.5), 2) +
      cos(lat1_rad) * cos(lat2_rad) * pow(sin(lon_delta * 0.5), 2);
  return 2.0 * atan2(sqrt(a), sqrt(1 - a));
}

static VALUE rb_distance_in_mi(
      VALUE self,
      VALUE lat1,
      VALUE lon1,
      VALUE lat2,
      VALUE lon2) {
  double c = haversine_c(
      NUM2DBL(lat1),
      NUM2DBL(lon1),
      NUM2DBL(lat2),
      NUM2DBL(lon2));
  return rb_float_new(c * EARTH_RADIUS_IN_MI);
}

static VALUE rb_distance_in_km(
      VALUE self,
      VALUE lat1,
      VALUE lon1,
      VALUE lat2,
      VALUE lon2) {
  double c = haversine_c(
      NUM2DBL(lat1),
      NUM2DBL(lon1),
      NUM2DBL(lat2),
      NUM2DBL(lon2));
  return rb_float_new(c * EARTH_RADIUS_IN_KM);
}

void Init_fast_haversine() {
  VALUE module = rb_define_module("FastHaversine");
  rb_define_singleton_method(module, "distance_in_mi", rb_distance_in_mi, 4);
  rb_define_singleton_method(module, "distance_in_km", rb_distance_in_km, 4);
}
