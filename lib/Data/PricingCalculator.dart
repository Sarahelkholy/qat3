
class PricingCalculator{

  static double calculateTotalPrice(double subtotal,String location){
    double shippingCost=getShippingCost(location);
    double totalPrice=subtotal+shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double subtotal,String location){
    double shippingCost=getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static double getShippingCost(String location){
    return 40;
  }
}