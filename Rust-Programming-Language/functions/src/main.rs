#![allow(dead_code)]
#![allow(unused_variables)]

fn main() {
    functions();
    methods();
    closures();
    higher_order_functions();
}

fn functions() {
    let mut x = 25;
    let y = 10;
    print_value(x);
    increase(&mut x);
    print_value(x);
    println!("{}", product(x, y));
}

fn print_value(x: i32) {
    println!("{}", x);
}

fn increase(x: &mut i32) {
    *x += 1;
}

fn product(x: i32, y: i32) -> i32 {
    //return x * y;
    x * y // returns last lineof function if you leave off the ;
}

fn methods() {
    let p = Point { x: 3.0, y: 4.0 };
    let p2 = Point { x: 5.0, y: 10.0 };
    let l = Line { start: p, end: p2 };

    println!("length = {}", l.len());
}

struct Point {
    x: f64,
    y: f64,
}

struct Line {
    start: Point,
    end: Point,
}

impl Line {
    fn len(&self) -> f64 {
        let dx = self.start.x - self.end.x;
        let dy = self.start.y - self.end.y;
        (dx * dx + dy * dy).sqrt()
    }
}

fn closures() {
    let sh = say_hello;
    sh();

    let plus_one = |x: i32| -> i32 { x + 1 };
    let a = 5;
    println!("{} + 1 = {}", a, plus_one(a));

    let mut two = 2;
    {
        let plus_two = |x: i32| -> i32 {
            let mut z = x;
            z += two;
            z
        };
        println!("{} + 1 = {}", 3, plus_two(3));
    }

    let borrow_two = &mut two;

    let mut f = 12;
    let plus_three = |x: &mut i32| *x += 3;
    plus_three(&mut f);
    println!("f = {}", f);
}

fn say_hello() {
    println!("Hello");
}

fn higher_order_functions() {
    // sum of all even squares < 500
    let limit = 500;
    let mut sum = 0;

    let above_limit = greater_than(limit);

    for i in 0.. {
        let isq = i * i;
        if above_limit(isq) {
            break;
        } else if is_even(isq) {
            sum += isq;
        }
    }
    println!("Loop sum: {}", sum);

    let sum2 = (0..)
        .map(|x| x * x)
        .take_while(|&x| x < limit)
        .filter(|x| is_even(*x))
        .fold(0, |sum, x| sum + x);
    println!("Loop sum: {}", sum2);
}

fn greater_than(limit: u32) -> impl Fn(u32) -> bool {
    move |y| y > limit
}

fn is_even(x: u32) -> bool {
    x % 2 == 0
}
