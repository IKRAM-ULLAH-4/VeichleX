class Vehicle {
  final String id;
  final String name;

  /// 3–4 preview images
  final List<String> images;

  /// Price for display & payment
  final int price; // in USD (Stripe-friendly)

  /// Short description
  final String description;

  /// Specs (HP, Year, Engine, etc.)
  final List<String> specs;

  /// Features (Luxury, Safety, Tech)
  final List<String> features;

  /// Availability
  final bool isAvailable;

  Vehicle({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.description,
    required this.specs,
    required this.features,
    this.isAvailable = true,
  });


  // ---------------- SAMPLE DATA ----------------
  static List<Vehicle> sampleData() {
    return [
      Vehicle(
        id: "v1",
        name: "Mercedes-Benz S-Class",
        images: [
          "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg",
          "https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg",
          "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg",
        ],
        price: 115000,
        description:
            "The Mercedes-Benz S-Class represents the pinnacle of luxury, innovation, and performance.",
        specs: [
          "Year: 2024",
          "Engine: V8",
          "Power: 429 HP",
          "Transmission: Automatic",
        ],
        features: [
          "Massage Seats",
          "Panoramic Sunroof",
          "Advanced Driver Assist",
          "Ambient Lighting",
        ],
      ),

      Vehicle(
        id: "v2",
        name: "BMW X7",
        images: [
          "https://images.pexels.com/photos/164634/pexels-photo-164634.jpeg",
          "https://images.pexels.com/photos/244206/pexels-photo-244206.jpeg",
          "https://images.pexels.com/photos/112460/pexels-photo-112460.jpeg",
        ],
        price: 98000,
        description:
            "BMW X7 combines bold design with premium comfort and powerful performance.",
        specs: [
          "Year: 2024",
          "Engine: V8",
          "Power: 523 HP",
          "Drive: AWD",
        ],
        features: [
          "Executive Package",
          "Adaptive Suspension",
          "Luxury Leather Interior",
          "360° Camera",
        ],
      ),

      Vehicle(
        id: "v3",
        name: "Porsche 911 Carrera",
        images: [
          "https://images.pexels.com/photos/3802510/pexels-photo-3802510.jpeg",
          "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg",
          "https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg",
        ],
        price: 128000,
        description:
            "The Porsche 911 Carrera delivers legendary performance with everyday usability.",
        specs: [
          "Year: 2024",
          "Engine: Twin-Turbo Flat-6",
          "Power: 443 HP",
          "0-100 km/h: 4.0s",
        ],
        features: [
          "Sport Chrono Package",
          "Adaptive Cruise Control",
          "Sport Exhaust",
          "Premium Sound System",
        ],
      ),
    ];
  }
}
