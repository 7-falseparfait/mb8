# Examples

The `examples/` folder contains tiny, runnable programs:

- `logo.asm` — draws the MB8 logo sprites stored in RAM and keeps scrolling.
- `bouncing.asm` — moves a 1-pixel-wide sprite around the screen, showing basic control flow and the drawing opcode.
- `turtle/rect.asm` - draws a rectangle using the turtle.
- `turtle/loop.asm` - draws a fractal using the turtle.

Assemble any of them with `customasm examples/<file>.asm` and run the resulting `.bin` with the CLI.
