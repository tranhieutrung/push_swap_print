## push_swap_print

A minimal harness around my push_swap to observe and test how it operates when sorting a list of integers. This repo lets you build and run the program, feed different inputs, and quickly measure or inspect the produced operations.

### What is this?
- **Goal**: Run the push_swap program on various inputs to see the sequence of operations and validate sorting behavior.
- **Why**: Helpful for debugging, benchmarking move counts, and verifying correctness on random or edge-case inputs.

### Requirements
- A C toolchain (gcc/clang) and Make.
- On Windows, use MSYS2/MinGW or WSL for Make/GCC, or build with your preferred compiler manually.

### Build
```bash
make
```

Build output (binary): `./push_swap`

If you need a clean rebuild:
```bash
make fclean && make
```

### Usage
Run with a list of integers as arguments. The program prints the sequence of operations to sort them.

Unix/macOS:
```bash
./push_swap 2 1 3

# Using an env var for convenience
ARG="3 2 5 1 4"; ./push_swap $ARG
```

PowerShell (Windows):
```powershell
./push_swap 2 1 3

$ARG = "3 2 5 1 4"; ./push_swap $ARG
```

### Measure number of moves
Unix/macOS:
```bash
ARG="3 2 5 1 4"; ./push_swap $ARG | wc -l
```

PowerShell:
```powershell
$ARG = "3 2 5 1 4"; (./push_swap $ARG | Measure-Object -Line).Lines
```

### Test with random inputs
Unix/macOS (bash, requires `shuf`):
```bash
ARG=$(seq 1 100 | shuf | tr '\n' ' '); ./push_swap $ARG | wc -l
```

PowerShell (Windows):
```powershell
function Get-RandomPerm([int]$n) { 1..$n | Sort-Object { Get-Random } }
$ARG = (Get-RandomPerm 100) -join ' '
(./push_swap $ARG | Measure-Object -Line).Lines
```

### Optional: validate correctness with a checker
If you have a compatible `checker` binary, you can pipe the operations to it to verify the result:

Unix/macOS:
```bash
ARG="3 2 5 1 4"; OPS=$(./push_swap $ARG); echo "$OPS" | ./checker $ARG
```

PowerShell:
```powershell
$ARG = "3 2 5 1 4"
$OPS = ./push_swap $ARG
$OPS | ./checker $ARG
```

Note: The `checker` program is not included here. Use your own or the one from your environment.

### Project layout
- `mylib/`: local libft/printf dependencies.
- `srcs/`: push_swap sources (algo, ops, parse, utils).
- `includes/`: project headers.
- `Makefile`: build rules for the binary.

### Troubleshooting
- Make not found (Windows): build under MSYS2/MinGW or WSL, or compile manually with your compiler.
- Mixed CRLF/LF issues: prefer running under a Unix-like shell (WSL/MSYS2) to avoid EOL problems.
- Undefined refs: run `make fclean && make` to force a full rebuild.

### License
This repository is for educational/testing purposes around push_swap.


