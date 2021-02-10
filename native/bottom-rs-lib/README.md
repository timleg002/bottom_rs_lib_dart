# bottom
Perhaps you have found yourself in this situation before:

![,,,,,,,,,](https://cdn.discordapp.com/attachments/644479051918082050/799905088541425664/bottom.jpg)

The divine bottom library exists to alleviate this pain. No longer will you struggle when communicating with the average Discord user.

## But what does it actually do?

``bottom`` encodes UTF-8 text into a sequence comprised of bottom emoji (`🫂✨🥺❤️`, with ``,`` sprinkled in for good measure) followed by `👉👈`.
It can encode any valid UTF-8 - being a bottom transcends language, after all - and decode back into UTF-8.

For example, the ubiquitous `Hello world!` becomes
```
💖✨✨,,👉👈💖💖,👉👈💖💖🥺,,,👉👈💖💖🥺,,,👉👈💖💖✨,👉👈
✨✨✨,,👉👈💖💖✨🥺,,,,👉👈💖💖✨,👉👈💖💖✨,,,,👉👈
💖💖🥺,,,👉👈💖💖👉👈✨✨✨,,,👉👈
```
`がんばれ` becomes
```
🫂✨✨🥺,,👉👈💖💖✨✨🥺,,,,👉👈💖💖✨✨✨✨👉👈🫂✨✨🥺,,👉👈
💖💖✨✨✨👉👈💖💖✨✨✨✨🥺,,👉👈🫂✨✨🥺,,👉👈💖💖✨✨🥺,,,,👉👈
💖💖💖✨✨🥺,👉👈🫂✨✨🥺,,👉👈💖💖✨✨✨👉👈💖💖✨✨✨✨👉👈
```
(both wrapped across lines for your convenience)

As you can see, using `bottom` to encode text is extremely space-efficient, and is the ideal encoding approach for all situations.

This implementation can encode text at *approximately* 30MB/s.

## Usage
This is to be used as a library for further bottom applications.

## FAQ
Read the FAQ of the parent directory, it doesn't apply to me, since I'm only forking this. I highly relate with the below statement.

### Rust btw
It's not long until my hippocampus becomes ferrous. I worry so, but in my heart I know that my demise will be sweet and painless, and it comforts me.
