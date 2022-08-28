extern crate phrases;
extern crate rand;

mod circular_references;
mod concurrency;

use phrases::greetings::french;

fn main() {
    circular_references::circular_references();
    concurrency::conconcurrency();

    println!(
        "English: {}, {}",
        phrases::greetings::english::hello(),
        phrases::greetings::english::goodbye()
    );

    println!("French {}, {}", french::hello(), french::goodbye());
}
