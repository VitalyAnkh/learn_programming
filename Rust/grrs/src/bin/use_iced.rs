use iced::{button, Button, Align, Column, Element, Sandbox, Settings, Text};

struct Counter {
    value: i32,

    // the local state of the two buttons
    increment_button: button::State,
    decrement_button: button::State,
}

#[derive(Debug, Clone, Copy)]
pub enum Message {
    IncrementPressed,
    DecrementPressed,
}


impl Sandbox for Counter {
    type Message = Message;

    fn new() -> Self {
        Self::default()
    }
    fn title(&self) -> String {
        String::from("Counter - Iced")
    }
    fn update(&mut self, message: Message) {
        match message {
            Message::IncrementPressed => {
                self.value += 1;
            }
            Message::DecrementPressed => {
                self.value -= 1;
            }
        }
    }
    fn view(&mut self) -> Element<Message> {
        // We use a column: a simple vertical layout
        Column::new()
            .padding(20)
            .align_items(Align::Center)
            .push(
                Button::new(&mut self.increment_button, Text::new("+"))
                    .on_press(Message::IncrementPressed),
            )
            .push(Text::new(&self.value.to_string()).size(50))
            .push(Button::new(&mut self.decrement_button, Text::new("-"))
                .on_press(Message::DecrementPressed)
            )
            .into()
    }
}

fn main() {
    Counter::run(Settings::default());
}