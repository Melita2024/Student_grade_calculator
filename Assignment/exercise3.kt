data class Person(val name: String, val age: Int)

fun main() {
    val people = listOf(
        Person("Alice", 25),
        Person("Bob", 30),
        Person("Charlie", 35),
        Person("Anna", 22),
        Person("Ben", 28)
    )

    // Step 1: Filter people with names starting with A or B
    val filteredPeople = people.filter { it.name.startsWith("A") || it.name.startsWith("B") }

    // Step 2: Calculate average age
    val averageAge = filteredPeople.map { it.age }.average()

    // Step 3: Print rounded to 1 decimal place
    println("Average age: %.1f".format(averageAge))
}