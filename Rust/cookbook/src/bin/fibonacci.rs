fn main() {
    let n = 12;

    println!("{}", fib(fib(n)));
}

fn fib(n: u128) -> u128 {
    let mut f = (0, 1);
    for _i in 0..(n - 1) {
        f = (f.1, f.0 + f.1)
    }
    f.0
}
