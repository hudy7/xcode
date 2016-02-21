
//: 5

class Vehicle{
    var model: String
    var doors: Int
    var color: String
    var wheels: Int
    
    init(model:String, doors:Int, color:String, wheels:Int){
        self.model = model
        self.doors = doors
        self.color = color
        self.wheels = wheels
    }
}

class MotorVehicle : Vehicle{
    var licensePlate: String
    
    init(licensePlate:String){
        super.init(model:String, doors:Int, color:String, wheels:Int)
        self.licensePlate = licensePlate
        
    }
    
}

class Bicycle : Vehicle{
    
}

class Car : MotorVehicle {
    init(doors:Int){
        self.doors = doors
    }
    
    init(model: String, doors: Int, color: String, wheels: Int){
        self.model = model
        self.doors = doors
        self.color = color
        self.wheels = wheels
    }
    
    override init(licensePlate:String){
        self.licensePlate = licensePlate
        super.init(model: model, doors: doors, color: color, wheels: wheels)
        
    }
}