import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 300;
  // Debug.print(debug_show(currentValue));
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));
  let id = 1234567;
  Debug.print(debug_show(currentValue));

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
  public func withdrawl(amount : Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Amount too large to withdraw");
    }
  };
  public query func checkBalance(): async Float {
    return currentValue;
  };
  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.0000000001 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}

