fun main() {
    val words = listOf(" apple ", " cat ", " banana ", " dog ", " elephant ")
    
    // Create a map where keys are strings and values are their lengths
    val wordLengthMap = words.map { it.trim() }.associateWith { it.length }
    
    // Filter entries where length > 4 and print them
    wordLengthMap
        .filter { it.value > 4 }
        .forEach { (word, length) -> println("$word has length $length") }
}
