fn main() {
    ownership();
    borrowing();
    lifetimes();
    lifetime_structure_impl();
}

fn ownership() {
    let u = 3;
    let _u2 = u;
    println!("{:?}", u); // Allowed for primitives

    let v = vec![1, 2, 3];
    //let _v2 = v; // Moves the pointer
    // cant print because v (the pointer to the vector) has been "moved" to v2
    //println!("{:?}", v);

    let print_vector = |x: Vec<i32>| {
        println!("{:?}", x);
        x
    };
    // pass ownership of vector
    let _vv = print_vector(v);
}

fn borrowing() {
    let print_vector = |x: &Vec<i32>| println!("x[0] = {}", x[0]);

    let v = vec![1, 2, 3];
    // Passing reference to let "borrow"
    print_vector(&v);
    println!("v[0] = {}", v[0]);

    let mut a = 40;
    let c = &a;
    {
        let b = &mut a;
        *b += 2;
    }
    println!("a = {}", a);

    let mut z = vec![1, 2, 3];

    for i in &z {
        println!("i = {}", i);
        //z.push(5); // doesnt work because you cannot add elements while iterating
    }
}

struct Person {
    name: String,
}

impl Person {
    // Gives you something like the comment below
    // fn get_ref_name<'a>(&'a self) -> &'a String
    fn get_ref_name(&self) -> &String {
        &self.name
    }
}

struct Company<'z> {
    name: String,
    ceo: &'z Person,
}

fn lifetimes() {
    let boss = Person {
        name: String::from("Elon"),
    };
    let _tesla = Company {
        name: String::from("Tesla"),
        ceo: &boss,
    };
}

struct Person2<'a> {
    name: &'a str,
}

impl<'a> Person2<'a> {
    fn talk(&self) {
        println!("Hi my name is {}", self.name);
    }
}

fn lifetime_structure_impl() {
    let joel = Person2 { name: "Joel" };
    joel.talk();
}
