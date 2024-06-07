enum BeverageTypeEnum { tea, coffee, milk, hotDrinks, snacks, coldDrinks }

class Beverage {
  final int id;
  final String name;
  final String imagePath;
  final String? label;
  final String bgColor;
  final int rate;
  final String description;

  Beverage({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.rate,
    required this.bgColor,
    this.label,
    required this.description,
  });
}

class BeverageType {
  final BeverageTypeEnum type;
  final String displayName;
  final List<Beverage> beverages;

  BeverageType({
    required this.type,
    required this.displayName,
    required this.beverages,
  });
}

class BeverageData {
  static final List<BeverageType> beverageTypes = [
    BeverageType(
      type: BeverageTypeEnum.tea,
      displayName: 'Tea',
      beverages: [
        Beverage(
          id: 1,
          name: "Tea",
          bgColor: 'FAE6C0',
          rate: 10,
          imagePath: 'assets/bevimages/tea.png',
          description: "A standard cup of tea.",
        ),
        Beverage(
          id: 2,
          name: "Tea",
          bgColor: 'FAE6C0',
          label: 'Strong',
          rate: 10,
          imagePath: 'assets/bevimages/tea.png',
          description: "A strong cup of tea.",
        ),
        Beverage(
          id: 3,
          name: "Tea",
          bgColor: 'FAE6C0',
          label: 'Without',
          rate: 10,
          imagePath: 'assets/bevimages/tea.png',
          description: "A cup of tea without sugar.",
        ),
        Beverage(
          id: 4,
          name: "Tea",
          bgColor: 'FAE6C0',
          rate: 10,
          label: 'Semi Sweet',
          imagePath: 'assets/bevimages/tea.png',
          description: "A cup of tea with less sugar.",
        ),
      ],
    ),
    BeverageType(
      type: BeverageTypeEnum.coffee,
      displayName: 'Coffee',
      beverages: [
        Beverage(
          id: 5,
          name: "Coffee",
          bgColor: 'EBD0AF',
          rate: 15,
          imagePath: "assets/bevimages/cofee.png",
          description: "A standard cup of coffee.",
        ),
        Beverage(
          id: 6,
          name: "Coffee",
          bgColor: 'EBD0AF',
          label: 'Lite',
          rate: 15,
          imagePath: "assets/bevimages/cofee.png",
          description: "A strong cup of coffee.",
        ),
        Beverage(
          id: 7,
          name: "Black Coffee",
          rate: 10,
          bgColor: 'E8E1D1',
          imagePath: "assets/bevimages/black_coffe.png",
          description: "A cup of coffee without sugar.",
        ),
      ],
    ),
    BeverageType(
      type: BeverageTypeEnum.milk,
      displayName: 'Milk',
      beverages: [
        Beverage(
          id: 9,
          name: "Hot Milk",
          rate: 10,
          bgColor: 'c4c4bc',
          imagePath: 'assets/bevimages/milk.png',
          description: "A glass of milk.",
        ),
        Beverage(
          id: 10,
          name: "Milk",
          label: 'Without',
          rate: 10,
          bgColor: 'c4c4bc',
          imagePath: 'assets/bevimages/milk.png',
          description: "A glass of hot milk.",
        ),
      ],
    ),
    BeverageType(
      type: BeverageTypeEnum.hotDrinks,
      displayName: 'Hot Drinks',
      beverages: [
        Beverage(
          id: 12,
          name: "Boost",
          rate: 15,
          bgColor: 'EE9792',
          imagePath: "assets/bevimages/boost.png",
          description: "A glass of fresh orange juice.",
        ),
        Beverage(
          id: 13,
          name: "Boost",
          rate: 15,
          label: 'Without',
          bgColor: 'EE9792',
          imagePath: "assets/bevimages/boost.png",
          description: "A glass of fresh apple juice.",
        ),
        Beverage(
          id: 14,
          name: "Horlicks",
          rate: 15,
          bgColor: 'AAD1E1',
          imagePath: "assets/bevimages/horlicks.png",
          description: "A glass of fresh grape juice.",
        ),
        Beverage(
          id: 15,
          name: "Horlicks",
          rate: 15,
          bgColor: 'AAD1E1',
          label: 'Without',
          imagePath: "assets/bevimages/horlicks.png",
          description: "A glass of fresh grape juice.",
        ),
      ],
    ),
    BeverageType(
      type: BeverageTypeEnum.snacks,
      displayName: 'Snacks',
      beverages: [
        Beverage(
          id: 16,
          name: "Parippu Vada",
          rate: 10,
          bgColor: 'F5B464',
          imagePath: "assets/bevimages/parippu.png",
          description: "A glass of fresh orange juice.",
        ),
        Beverage(
          id: 17,
          name: "Cutlet",
          rate: 12,
          bgColor: 'DF9773',
          imagePath: "assets/bevimages/cutlet.png",
          description: "A glass of fresh apple juice.",
        ),
        Beverage(
          id: 18,
          name: "Egg Puffs",
          rate: 17,
          bgColor: 'E5B762',
          imagePath: "assets/bevimages/puffs.png",
          description: "A glass of fresh grape juice.",
        ),
      ],
    ),
    BeverageType(
      type: BeverageTypeEnum.coldDrinks,
      displayName: 'Cold Drinks',
      beverages: [
        Beverage(
          id: 19,
          name: "Lemonade",
          rate: 15,
          bgColor: 'CFDA92',
          imagePath: "assets/bevimages/lime.png",
          description: "A glass of fresh orange juice.",
        ),
        Beverage(
          id: 20,
          name: "Avil Milk",
          rate: 35,
          bgColor: 'C3A57C',
          imagePath: "assets/bevimages/milkavil.png",
          description: "A glass of fresh apple juice.",
        ),
        Beverage(
          id: 21,
          name: "Juice",
          rate: 50,
          bgColor: 'FDCC70',
          imagePath: "assets/bevimages/juice.png",
          description: "A glass of fresh apple juice.",
        ),
      ],
    ),
  ];
}
