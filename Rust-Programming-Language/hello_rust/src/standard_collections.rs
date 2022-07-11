#![allow(dead_code)]
#![allow(unused_variables)]

use std::collections::HashMap;
use std::collections::HashSet;
use std::thread;
use std::time;

pub fn collections() {
    //vectors();
    // hashmap();
    //hashset();
    iteration();
}

// Vectors (arrays for unknown length data)
fn vectors() {
    let mut a = Vec::new();
    a.push(1);
    a.push(2);
    a.push(3);

    println!("a = {:?}", a);

    a.push(44);

    // usize: u = unsigned int, size = size of memory on my machine (32 or 64)
    // isize: i = signed int, size = size of memory on my machine (32 or 64)

    let bad_index: i32 = 0; // cannot be used to index
    let idx: usize = 0; // cannot be used to index

    //println!("a[0] = {:?}", a[bad_index]); // fails because signed int

    println!("a[0] = {:?}", a[idx]);

    // get returns an Option
    // Allows us to write safe code that will not crash if element doesnt exist
    match a.get(6) {
        Some(x) => println!("a[6] is {}", x),
        None => println!("Error, there is no element 6"),
    }

    // iterate through vector
    for x in &a {
        println!("{}", x)
    }

    // remove final value (like get, pop returns an Option)
    let last_element = a.pop();
    println!("last element is {:?}, a = {:?}", last_element, a);

    // iterate through vector
    while let Some(x) = a.pop() {
        println!("{}", x);
    }
}

fn hashmap() {
    let mut shapes = HashMap::new();
    shapes.insert(String::from("triangle"), 3);
    shapes.insert(String::from("square"), 4);

    // println!("a square has {} sides" , shapes["square".into()]);
    // println!("a triangle has {} sides" , shapes["triangle".into()]);
    // for (key, value) in &shapes {
    //   println!("The {} has {} sides", key, value);
    // }

    println!("{:?}", shapes);
    // get circle entry reference or create with value 1
    let actual = shapes.entry("circle".into()).or_insert(1); // mutable borrow occurs here

    //println!("{:?}", shapes); // cannot reference shapes while it is borrowed

    // modify the reference
    *actual = 0;

    println!("{:?}", shapes);
}

fn hashset() {
    let mut greeks = HashSet::new(); // no dupes, not insert order
    greeks.insert("gamma");
    greeks.insert("delta");
    println!("{:?}", greeks);

    let added_vega = greeks.insert("vega");
    if added_vega {
        println!("Added vega");
    }
    let added_gamma = greeks.insert("gamma");
    if added_gamma {
        println!("Added gamma");
    }

    if greeks.contains("gamma") {
        println!("contains gamma");
    }

    let removed = greeks.remove("gamma");
    if removed {
        println!("Removed Gamma");
    }

    let _1_5: HashSet<_> = (1..=5).collect();
    let _6_10: HashSet<_> = (6..=10).collect();
    let _1_10: HashSet<_> = (1..=10).collect();
    let _2_8: HashSet<_> = (2..=8).collect();

    // Subset
    println!(
        "is {:?} a subset of {:?}? {}",
        _2_8,
        _1_10,
        _2_8.is_subset(&_1_10)
    );

    // Disjoint = no common elements
    println!(
        "is {:?} a disjoint of {:?}? {}",
        _1_5,
        _6_10,
        _1_5.is_disjoint(&_6_10)
    );

    // Union = combo of all elements in both sets (no dupes because set),
    println!(
        "a union of {:?} and {:?}? {:?}",
        _2_8,
        _6_10,
        _2_8.union(&_6_10)
    );

    // Intersection = just elements present in both sets
    println!(
        "a intersection of {:?} and {:?}? {:?}",
        _2_8,
        _6_10,
        _2_8.intersection(&_6_10)
    );

    // difference = items in the first set not in the second
    // symmetric_difference = union - intersection
}

fn iteration() {
    let mut vec = vec![3, 2, 1];

    for x in &vec {
        // using reference
        println!("{}", *x) // dereferences
    }

    for x in vec.iter() {
        // using reference fancier sytax
        println!("{}", *x);
    }

    for x in vec.iter().rev() {
        // goes through in reverse
        println!("{}", *x);
    }

    for x in vec.iter_mut() {
        // mutable reference fancier sytax
        *x += 2;
    }
    println!("{:?}", vec);

    let iterator = vec.into_iter(); // moves vec into iterator
                                    // println!("{:?}", vec); // cant do this because vec no longer available to use

    let mut vec2 = vec![1, 2, 3];
    let vec3 = vec![4, 5, 6];
    vec2.extend(vec3); // uses intoIter behind scenes and moves elements from vec3 to vec2
    println!("{:?}", vec2);
    //println!("{:?}", vec3); // wont work vec 3 no longer available
}
