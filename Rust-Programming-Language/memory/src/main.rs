use std::rc::Rc; // reference counter (non-threadsafe)
use std::sync::{Arc, Mutex}; // atomic reference counter (threadsafe)
use std::thread;

// Rc:      Used when you want to pass the variable around in a thread
// Arc:     Used when you want to pass the variable around & read it in multiple threads
// Mutex:   Used when you want to pass the variable around & mutate it in multiple threads

fn main() {
    reference_count();
    atomic_reference_count();
    thread_safe_mutex();
}

struct Person {
    name: Rc<String>,
}

impl Person {
    fn new(name: Rc<String>) -> Person {
        Person { name: name }
    }

    fn greet(&self) {
        println!("Hi my name is {}", self.name);
    }
}

fn reference_count() {
    let name = Rc::new("John".to_string()); // RC allows you to have multiple references (pointers)
    println!("{} has {} strong pointers", name, Rc::strong_count(&name));
    {
        let person = Person::new(name.clone()); // 1 reference

        println!("{} has {} strong pointers", name, Rc::strong_count(&name));

        person.greet();
    }
    println!("{} has {} strong pointers", name, Rc::strong_count(&name));
}

struct Person1 {
    name: Arc<String>,
}

impl Person1 {
    fn new(name: Arc<String>) -> Person1 {
        Person1 { name: name }
    }

    fn greet(&self) {
        println!("Hi my name is {}", self.name);
    }
}

fn atomic_reference_count() {
    let name = Arc::new("John".to_string());
    let person = Person1::new(name.clone()); // 1 reference

    let t = thread::spawn(move || {
        person.greet();
    });
    println!("{}", name);

    t.join().unwrap();
}
struct Person2 {
    name: Arc<String>,
    state: Arc<Mutex<String>>,
}

impl Person2 {
    fn new(name: Arc<String>, state: Arc<Mutex<String>>) -> Person2 {
        Person2 {
            name: name,
            state: state,
        }
    }

    fn greet(&self) {
        let mut state = self.state.lock().unwrap();
        state.clear(); // mutate the state
        state.push_str("Excited");

        println!("Hi my name is {} and I'm {}", self.name, state.as_str());
    }
}

fn thread_safe_mutex() {
    let name = Arc::new("John".to_string());
    let state = Arc::new(Mutex::new("bored".to_string()));
    let person = Person2::new(name.clone(), state.clone()); // 1 reference

    let t = thread::spawn(move || {
        person.greet();
    });
    println!("{} is {}", name, state.lock().unwrap().as_str());

    t.join().unwrap();
}
