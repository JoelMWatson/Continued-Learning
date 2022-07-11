#![allow(dead_code)]
#![allow(unused_variables)]

pub fn strings() {
    let words: &'static str = "Hello Rust"; // &str = string of slice
                                            // cannot modify string or chars in string

    for c in words.chars() {
        // gives a sequence of the chars
        println!("{}", c);
    }

    // String - heap alocated string
    let mut letters = String::new();
    let mut a = 'a' as u8;
    while a <= ('z' as u8) {
        letters.push(a as char);
        letters.push_str(",");
        a += 1;
    }
    println!("{}", letters);

    // String => str
    let u: &str = &letters; // deref conversion

    // str => String
    let x = String::from("Hi"); // or
    let w = "hi".to_string();

    // concatenation
    // String + str
    let z = letters + "abc";

    // String + String
    let y = x + &w;

    // format
    let name = "Joel";
    let greeting = format!("hi, im {}, nice to meet you", name);
    println!("{}", greeting);

    let run_dog_run = format!("{0} {1} {0}", "run", "dog");
    println!("{}", run_dog_run);

    let full_name = format!("{first} {last}", last = "watson", first = "joel");
    println!("{}", full_name);
}
