class Beacon {
  final int beaconId;
  final String beaconName;
  final int footfall;
  final String? heading;
  final String? offers;
  final String? url;

  Beacon({
    required this.beaconId,
    required this.beaconName,
    required this.footfall,
    required this.heading,
    required this.offers,
    required this.url,
  });

  factory Beacon.fromJson(Map<String, dynamic> json) {
    return Beacon(
      beaconId: json['beacon_id'],
      beaconName: json['beacon_name'],
      footfall: json['footfall'],
      heading: json['heading'],
      offers: json['offers'],
      url: json['url'],
    );
  }
}
