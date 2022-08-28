//! This module contains english phrases
//!
//! # Examples
//! ```
//! let usr = "Joel";
//! println!("{}, {}.", phrases::greetings::english::hello(), usr);
//! ```

/// This function says hello
pub fn hello() -> String {
    "hello".to_string()
}

/// This function says goodbye
pub fn goodbye() -> String {
    "goodbye".to_string()
}
