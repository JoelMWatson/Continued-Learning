#![allow(dead_code)]
#![allow(unused_variables)]
#![allow(unused_imports)]

use std::mem;

trait Printable {
    fn format(&self) -> String;
}

impl Printable for i32 {
    fn format(&self) -> String {
        format!("i32: {}", *self)
    }
}

impl Printable for String {
    fn format(&self) -> String {
        format!("string: {}", *self)
    }
}

fn print_it<T: Printable>(z: T) {
    println!("{}", z.format());
} // Monomorphisation

// Static figures out time at compile time (inexpensive)
pub fn static_dispatch_trait() {
    // Static figures out time at compile time (inexpensive)
    let a = 123;
    let b = "hello".to_string();

    print_it(a);
    print_it(b);
}

fn print_it_dynamic(z: &dyn Printable) {
    println!("{}", z.format());
}

// Dynamic figures out type at runtime (expensive)
pub fn dynamic_dispatch_trait() {
    let a = 123;
    let b = "hello".to_string();

    print_it_dynamic(&a);
    print_it_dynamic(&b);
}
