use std::cmp::PartialEq;
use std::fmt::Debug;
use std::ops::{Add, AddAssign, Neg};
mod dispatching;

fn main() {
    traits();
    trait_params();
    into_trait();
    drop_trait();
    overloading();
    dispatching::static_dispatch_trait();
    dispatching::dynamic_dispatch_trait()
}

trait Animal {
    fn create(name: &'static str) -> Self; // static
    fn name(&self) -> &'static str;
    fn talk(&self) {
        println!("{} cannot talk", self.name());
    }
}

struct Human {
    name: &'static str,
}

impl Animal for Human {
    fn create(name: &'static str) -> Human {
        Human { name: name }
    }
    fn name(&self) -> &'static str {
        return self.name;
    }
    fn talk(&self) {
        println!("{} says hello", self.name)
    }
}

struct Cat {
    name: &'static str,
}

impl Animal for Cat {
    fn create(name: &'static str) -> Cat {
        Cat { name: name }
    }
    fn name(&self) -> &'static str {
        return self.name;
    }
    fn talk(&self) {
        println!("{} says meow", self.name)
    }
}

trait Summable<T> {
    fn sum(&self) -> T;
}

impl Summable<i32> for Vec<i32> {
    fn sum(&self) -> i32 {
        let mut result: i32 = 0;
        for x in self {
            result += *x;
        }
        return result;
    }
}

fn traits() {
    // let h = Human { name: "Joel" };
    let h: Human = Animal::create("Joel");
    h.talk();

    // let c = Cat { name: "Mona" };
    let c: Cat = Animal::create("Mona");
    c.talk();

    let a = vec![1, 2, 3];
    println!("sum = {}", a.sum())
}

// Trait Parameters
#[derive(Debug)]
struct Circle {
    radius: f64,
}

#[derive(Debug)]
struct Square {
    side: f64,
}

trait Shape {
    fn area(&self) -> f64;
}

impl Shape for Square {
    fn area(&self) -> f64 {
        self.side * self.side
    }
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        self.radius * self.radius * std::f64::consts::PI
    }
}

// Trait Parameter
// 3 Function signature options
// fn print_info(shape: impl Shape + Debug)             : Option 1
// fn print_info<T: Shape + Debug>(shape: T)            : Option 2
// fn print_info<T>(shape: T) where T: Shape + Debug    : Option 3
fn print_info<T>(shape: T)
where
    T: Shape + Debug,
{
    println!("{:?}", shape);
    println!("The Area: {}", shape.area());
}

fn trait_params() {
    let c = Circle { radius: 5.5 };
    print_info(c);
}

struct Person {
    name: String,
}

impl Person {
    // fn new(name: &str) -> Person {
    //     Person {
    //         name: name.to_string(),
    //     }
    // }
    // S must be convertable to a string
    fn new<S: Into<String>>(name: S) -> Person {
        Person { name: name.into() }
    }
}

fn into_trait() {
    let joel = Person::new("Joel");

    let name: String = "Jane".to_string();
    // let jane = Person::new(name: name.as_ref()); Had to do as_ref() for oriignal new() implementation
    let jane = Person::new(name);
}

struct Creature {
    name: String,
}

impl Creature {
    fn new(name: &str) -> Creature {
        println!("{} enters the game", name);
        Creature { name: name.into() }
    }
}
impl Drop for Creature {
    fn drop(&mut self) {
        println!("{} is dead", self.name);
    }
}

fn drop_trait() {
    let goblin = Creature::new("Jeff");
    println!("game proceeds");
    drop(goblin); // explicitly drops here
                  // Otherwise drops at end of scope
}

#[derive(Debug)]
struct Complex<T> {
    re: T,
    im: T,
}

impl<T> Complex<T> {
    fn new(re: T, im: T) -> Complex<T> {
        Complex::<T> { re, im }
    }
}

impl<T> Add for Complex<T>
where
    T: Add<Output = T>,
{
    type Output = Complex<T>;

    fn add(self, rhs: Self) -> Self::Output {
        Complex {
            re: self.re + rhs.re,
            im: self.im + rhs.im,
        }
    }
}

impl<T> AddAssign for Complex<T>
where
    T: AddAssign<T>,
{
    fn add_assign(&mut self, rhs: Self) {
        self.re += rhs.re;
        self.im += rhs.im;
    }
}

impl<T> Neg for Complex<T>
where
    T: Neg<Output = T>,
{
    type Output = Complex<T>;

    fn neg(self) -> Self::Output {
        Complex {
            re: -self.re,
            im: -self.im,
        }
    }
}

impl<T> PartialEq for Complex<T>
where
    T: PartialEq,
{
    fn eq(&self, rhs: &Self) -> bool {
        self.re == rhs.re && self.im == rhs.im
    }
}

fn overloading() {
    let mut a = Complex::new(1, 2);
    let mut b = Complex::new(3, 4);

    println!("{:?}", a + b);
}
