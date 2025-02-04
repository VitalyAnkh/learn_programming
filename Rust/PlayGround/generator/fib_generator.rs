#![feature(generators, generator_trait)]

use std::ops::{Generator, GeneratorState};
use std::pin::Pin;

fn main() {
    let mut g = || {
        let mut curr: u64 = 1;
        let mut next: u64 = 1;
        loop {
            let new_next = curr.checked_add(next);
            if let Some(new_next) = new_next {
                curr = next;
                next = new_next;
                yield curr;
            } else {
                return;
            }
        }
    };
    // let p = Pin::new(&mut g);
    loop {
        match Pin::new(&mut g).resume() {
            GeneratorState::Yielded(v) => println!("{}", v),
            GeneratorState::Complete(_) => return,
        }
    }
}
