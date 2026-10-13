# Half Adder and Full Adder using Verilog

## About
This beginner VLSI/digital-design project implements a half adder and a full adder using Verilog HDL. A testbench checks every possible input combination.

## Learning objectives
- Understand XOR, AND and OR logic.
- Describe combinational circuits in Verilog.
- Write a testbench and verify outputs.
- Run a simulation and inspect a waveform.

## Project structure
```text
vlsi-adders-first-project/
├── src/
│   ├── half_adder.v
│   └── full_adder.v
├── testbench/
│   └── tb_adders.v
├── results/
└── README.md
```

## Circuit logic

### Half adder
- `sum = a XOR b`
- `carry = a AND b`

### Full adder
- `sum = a XOR b XOR cin`
- `cout = (a AND b) OR (a AND cin) OR (b AND cin)`

## Tools
- Verilog HDL
- Icarus Verilog (compiler/simulator)
- GTKWave (optional waveform viewer)

## Run the simulation
Install Icarus Verilog first, then open a terminal in this project folder.

Compile:
```bash
iverilog -o adders_sim.vvp src/half_adder.v src/full_adder.v testbench/tb_adders.v
```

Run:
```bash
vvp adders_sim.vvp
```

The testbench prints the input combinations and reports whether all 12 cases passed. It also creates `adders.vcd`.

Optional: open the waveform:
```bash
gtkwave adders.vcd
```

## Expected result
The final status line should be:
```text
ALL TESTS PASSED: all 12 input combinations checked.
```

## Truth tables

### Half adder
| A | B | Sum | Carry |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

### Full adder
| A | B | Cin | Sum | Cout |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

## What I learned
After running the simulation, update this section in your own words. Explain how XOR, AND and OR gates determine the sum and carry outputs.

## Future improvements
- Build a 4-bit ripple-carry adder.
- Add a waveform screenshot to the repository.
- Compare the full adder with a design built from two half adders.
