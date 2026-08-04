class City {
  final String name;
  final String country;
  final String imageUrl;
  final double rating;

  const City({
    required this.name,
    required this.country,
    required this.imageUrl,
    required this.rating,
  });
}

class Continent {
  final String name;
  final List<City> cities;

  const Continent({required this.name, required this.cities});
}

// App Data
const List<Continent> continents = [
  // Africa
  Continent(
    name: "Africa",
    cities: [
      City(
        name: "Cape Town",
        country: "South Africa",
        rating: 4.9,
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1697730061063-ad499e343f26?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2FwZSUyMHRvd258ZW58MHx8MHx8fDA%3D",
      ),

      City(
        name: "Marrakesh",
        country: "Morocco",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1597212618440-806262de4f6b?w=1200",
      ),

      City(
        name: "Cairo",
        country: "Egypt",
        rating: 4.7,
        imageUrl:
            "https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=1200",
      ),

      City(
        name: "Nairobi",
        country: "Kenya",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=1200",
      ),

      City(
        name: "Lagos",
        country: "Nigeria",
        rating: 4.7,
        imageUrl:
            "https://images.unsplash.com/photo-1648023199223-25d3622bcb13?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bGFnb3MlMjBuaWdlcmlhfGVufDB8fDB8fHww",
      ),

      City(
        name: "Zanzibar",
        country: "Tanzania",
        rating: 5.0,
        imageUrl:
            "https://images.unsplash.com/photo-1519046904884-53103b34b206?w=1200",
      ),
    ],
  ),

  // Asia
  Continent(
    name: "Asia",
    cities: [
      City(
        name: "Tokyo",
        country: "Japan",
        rating: 5.0,
        imageUrl:
            "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=1200",
      ),

      City(
        name: "Seoul",
        country: "South Korea",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1532649097480-b67d52743b69?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8U2VvdWx8ZW58MHx8MHx8fDA%3D",
      ),

      City(
        name: "Bangkok",
        country: "Thailand",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=1200",
      ),

      City(
        name: "Singapore",
        country: "Singapore",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=1200",
      ),

      City(
        name: "Dubai",
        country: "UAE",
        rating: 5.0,
        imageUrl:
            "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=1200",
      ),

      City(
        name: "Bali",
        country: "Indonesia",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=1200",
      ),
    ],
  ),

  // Europe
  Continent(
    name: "Europe",
    cities: [
      City(
        name: "Manarola",
        country: "Italy",
        rating: 5.0,
        imageUrl:
            "https://images.unsplash.com/photo-1523906834658-6e24ef2386f9?w=1200",
      ),

      City(
        name: "Reine",
        country: "Norway",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200",
      ),

      City(
        name: "Paris",
        country: "France",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=1200",
      ),

      City(
        name: "Santorini",
        country: "Greece",
        rating: 5.0,
        imageUrl:
            "https://images.unsplash.com/photo-1469796466635-455ede028aca?w=1200",
      ),

      City(
        name: "Barcelona",
        country: "Spain",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1539037116277-4db20889f2d4?w=1200",
      ),

      City(
        name: "Amsterdam",
        country: "Netherlands",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1512470876302-972faa2aa9a4?w=1200",
      ),
    ],
  ),

  // North America
  Continent(
    name: "North America",
    cities: [
      City(
        name: "New York",
        country: "USA",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1499092346589-b9b6be3e94b2?w=1200",
      ),

      City(
        name: "Toronto",
        country: "Canada",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1517935706615-2717063c2225?w=1200",
      ),

      City(
        name: "Vancouver",
        country: "Canada",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1559511260-66a654ae982a?w=1200",
      ),

      City(
        name: "Los Angeles",
        country: "USA",
        rating: 4.7,
        imageUrl:
            "https://images.unsplash.com/photo-1534190760961-74e8c1c5c3da?w=1200",
      ),

      City(
        name: "Mexico City",
        country: "Mexico",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1518105779142-d975f22f1b0a?w=1200",
      ),

      City(
        name: "Las Vegas",
        country: "USA",
        rating: 4.7,
        imageUrl:
            "https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?w=1200",
      ),
    ],
  ),

  // South America
  Continent(
    name: "South America",
    cities: [
      City(
        name: "Rio",
        country: "Brazil",
        rating: 5.0,
        imageUrl:
            "https://images.unsplash.com/photo-1483729558449-99ef09a8c325?w=1200",
      ),

      City(
        name: "Cusco",
        country: "Peru",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1526392060635-9d6019884377?w=1200",
      ),

      City(
        name: "Buenos Aires",
        country: "Argentina",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1589909202802-8f4aadce1849?w=1200",
      ),

      City(
        name: "Santiago",
        country: "Chile",
        rating: 4.7,
        imageUrl:
            "https://images.unsplash.com/photo-1583279141845-e27d7729e7a6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHNhbnRpYWdvJTJDJTIwY2hpbGV8ZW58MHx8MHx8fDA%3D",
      ),

      City(
        name: "Lima",
        country: "Peru",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1531065208531-4036c0dba3ca?w=1200",
      ),

      City(
        name: "Cartagena",
        country: "Colombia",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1533105079780-92b9be482077?w=1200",
      ),
    ],
  ),

  // Australia
  Continent(
    name: "Australia",
    cities: [
      City(
        name: "Sydney",
        country: "Australia",
        rating: 5.0,
        imageUrl:
            "https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=1200",
      ),

      City(
        name: "Melbourne",
        country: "Australia",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1514395462725-fb4566210144?w=1200",
      ),

      City(
        name: "Perth",
        country: "Australia",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1523482580672-f109ba8cb9be?w=1200",
      ),

      City(
        name: "Brisbane",
        country: "Australia",
        rating: 4.8,
        imageUrl:
            "https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=1200",
      ),

      City(
        name: "Gold Coast",
        country: "Australia",
        rating: 4.9,
        imageUrl:
            "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200",
      ),

      City(
        name: "Hobart",
        country: "Australia",
        rating: 4.7,
        imageUrl:
            "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1200",
      ),
    ],
  ),
];
