#![allow(dead_code)]
#![allow(unused_variables)]
use std::mem;
use rand::Rng;
use std::io::stdin;
/* globals */

// constant
const MEANING_OF_LIFE: u8 = 42; // no fixed address

// static variable
static MEANING_OF_LOOF: u8 = 41; // has memory address

fn main() {
    let a: u8 = 123; // u = unsigned 8 = 8 bits
    println!("a = {}", a);

    let mut b: i8 = 0;
    println!("before {}", b);
    b = 42;
    println!("before {}", b);

    let c = 1234567;
    println!("c = {}, takes up {} bytes", c, mem::size_of_val(&c));

    let d: char = 'x';
    let e: f32 = 2.5;
    let g: bool = false;
    operators();
    stack_heap();
    for_loops();
    lock();
}

fn operators() {
    let a: f64 = 2.2 + 1.0; // No -- or ++
    let b_cubed = f64::powi(a, 3);
    let b_to_pi = f64::powf(a, std::f64::consts::PI);
    println!("cubed {} and to PI {}", b_cubed, b_to_pi);

    // BITWIZE (only for ints)
    // | OR & AND ^ XOR ! NOR
}

struct Point {
    // 16 bytes
    x: f64, // 8 bytes
    y: f64, // 8 bytes
}

fn origin() -> Point {
    Point { x: 0.0, y: 0.0 }
}

pub fn stack_heap() {
    let p1 = origin();
    let p2 = Box::new(origin()); // gives you a pointer;

    println!("p1 takes {} bytes", mem::size_of_val(&p1));
    println!("p2 takes {} bytes", mem::size_of_val(&p2));

    let p3 = *p2;
    println!("Position {}, {}", p3.x, p3.y)
}
// if statements work as expected
// while loops work as expected
fn for_loops() {
    for x in 1..11 {
        // 11 non-inclusive
        println!("x = {}", x);
    }

    for (pos, y) in (30..41).enumerate() {
        println!("{}, {}", pos, y);
    }
}

// like cond statement
fn match_statement() {
    let country_code = 44;
    let country = match country_code {
        44 => "UK",
        46 => "Sweden",
        7 => "Russia",
        1..=1000 => "unknown", // =1000 inclusive
        _ => "invalid",
    };
}

// Combination Lock

enum State {
    Locked,
    Failed,
    Unlocked
}

fn lock() {
    let code = String::from("1234");

    let mut state = State::Locked;
    let mut entry = String::new();

    loop {
        match state {
            State::Locked => {
                let mut input = String::new();
                match stdin().read_line(&mut input) {
                    Ok(_) => entry.push_str(&input.trim_end()),
                    Err(_) => continue,
                };

                if entry == code {
                    state = State::Unlocked;
                    continue
                };

                if !code.starts_with(&entry) {
                    state = State::Failed;
                }
            }
            State::Failed => {
                println!("Failed");
                entry.clear();
                state = State::Locked;
                continue;
            }
            State::Unlocked => {
                println!("Unlocked");
                return;
            }
        }
    }

}

