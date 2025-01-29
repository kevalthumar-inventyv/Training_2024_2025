# PROPERTIES (STORED AND COMPUTED)

## 1. What are the properties of Swift?

`ANS:-`

- **properties** are variables and constants that are part of a class, structure, or enumeration. They associate values with a particular type.

## 2. How are **stored properties** different from **computed properties**?

`ANS:-`

- **Stored Properties** are Stored constant or variable values as part of an instance and **Computed Properties** are Calculated (rather than stored) a value every time they are accessed.

## 3. Can stored properties be constants (`let`) or variables (`var`)?

`ANS:-`

- Yes, Store Properties can be `let` or `var`.

## 4. What is a **lazy stored property**?

`ANS:-`

- A **lazy stored property** is a property whose initial value is not calculated until the first time it is used. It's declared with the `lazy` keyword.

## 5. When would you use a lazy property?

`ANS:-`

- When the initial value depends on outside factors that aren't known until after an instance is initialized or computationally expensive and should not be calculated unless needed.

## 6. What keyword is used to declare a lazy property in Swift?

`ANS:-`

- `lazy` is the main keyword to declare a lazy property in Swift.

## 7. What is a **computed property**?

`ANS:-`

- Computed properties **do not store a value**. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

## 8. What are the main parts of a computed property?

`ANS:-`
The main parts of a computed property are:

- **Getter**: Required. Returns a value.
- **Setter**: Optional. Allows you to modify related properties.

## 9. When would you use a **read-only computed property**?

`ANS:-`
If a computed property only has a getter, it's a **read-only** computed property. It can be used where we want variables is not be changed at any point in time.

## 10. How can you simplify the syntax of a read-only computed property?

`ANS:-`

``` swift
struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        return width * height
    }
}

let rect = Rectangle(width: 10, height: 5)
print(rect.area) // Outputs 50.0
```

## 11. What are **type properties**, and when would you use them?

`ANS:-`

- Properties that are associated with the type itself rather than an instance of that type are called **type properties**. They are useful for defining values that are common to all instances.
- we can achieve this with the help of `static` keywords.

### Code

1.  Create a Person struct with stored properties name and age. Then, create an instance and modify the age.

    ``` swift
        struct Person {
            var name: String
            var age: String
        }
        var person = Person(name: "Keval", age: "25")
        print("Name of person is \(person.name) and age is \(person.age). It is before change.")
        person.age = "26"
        person.name = "Pruv"
        print("Name of person is \(person.name) and age is \(person.age). It is after change.")
    ```

2.  Create a HeavyComputation class where a property expensiveData is initialized lazily.

    ``` swift
    class HeavyComputation {
        lazy var expensiveData: Int = {
            print("Expensive data is calculated.")
            return 100
        }()
    }

    let heavyComputation = HeavyComputation()
    //We add lazy on the expensive data so this initializes at this line.
    print(heavyComputation.expensiveData)

    ```

3. **Define a Temperature struct with a computed property to convert Celsius to Fahrenheit. (use get and set both)**

    ``` swift
    struct Temperature {
        var temperatureInCelsius: Double
        var temperatureInFahrenheit: Double
        {
            get{
                return temperatureInCelsius*(9/5)+32
            }
            set{
                temperatureInCelsius = (newValue-32)*(5/9)
            }
        }
    }

    var temp = Temperature(temperatureInCelsius: 30)

    print("Temperature in Celsius is \(temp.temperatureInCelsius) and in Fahrenheit is \(temp.temperatureInFahrenheit)")

    temp.temperatureInFahrenheit = 86

    print("Temperature in Fahrenheit is \(temp.temperatureInFahrenheit) and in Celsius is \(temp.temperatureInCelsius)")

    ```

4. Create a Rectangle struct with a computed property area.

    ``` swift
    struct Rectangle {
        var width: Double
        var height: Double
        
        var area: Double {
            return width * height
        }
    }

    let rect = Rectangle(width: 10, height: 5)
    print(rect.area) // Outputs 50.0
    // rect.area = 60.0 // Error: Cannot assign to property: 'area' is a get-only property
    ```
