fun processList(
    numbers: List<Int>,
    predicate: (Int) -> Boolean
): List<Int> {
    val result = mutableListOf<Int>()  // Create a mutable list to store results
    for (number in numbers) {          // Loop through each number
        if (predicate(number)) {       // Apply the lambda predicate
            result.add(number)         // If true, add to result
        }
    }
    return result                      // Return the new filtered list
}

fun main() {
    val nums = listOf(1, 2, 3, 4, 5, 6)
    val even = processList(nums) { it % 2 == 0 }
    println(even)  // Output: [2, 4, 6]
}