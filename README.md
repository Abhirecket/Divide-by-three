# Divide by three
 While going through your Grandma's old store, you come across an interesting machine which takes an input x and gives an output whenever the number formed within the machine is divisible by 3. Being intrigued with the machine, you start tinkering with it and realise that the machine serially takes the input x and concatenates it to the least significant bit (LSB) position of the currently seen inputs to form the new number.


### RTL Description: Divide-By-3 Counter

- **Module Name**: div_by_3
- **Inputs**:
  - `clk`: Clock signal.
  - `rst_n`: Active low asynchronous reset signal.
  - `x_i`: Input signal.
- **Outputs**:
  - `div_o`: Output signal indicating if the input is divisible by 3.
- **Parameters**:
  - `REM_0`, `REM_1`, `REM_2`: Parameterized states representing the remainders of the input modulo 3.
- **Description**:
  - The `div_by_3` module is designed to determine whether the input signal is divisible by 3.
  - It uses a finite state machine (FSM) with three states representing the remainders of the input modulo 3.
  - The FSM transitions between these states based on the input signal `x_i`.
  - The output `div_o` indicates whether the input is divisible by 3 (`div_o = 1`) or not (`div_o = 0`).
- **State Transition Logic**:
  - If the input signal `x_i` is 0:
    - If the current state is `REM_0`, the next state remains `REM_0`, and `div_o` is set to 1.
    - If the current state is `REM_1`, the next state becomes `REM_2`, and `div_o` is set to 0.
    - If the current state is `REM_2`, the next state becomes `REM_1`, and `div_o` is set to 0.
  - If the input signal `x_i` is 1:
    - State transitions are similar to the case when `x_i` is 0, but the output `div_o` is set differently based on the current state.
  - The FSM resets to the initial state (`REM_0`) when the reset signal `rst_n` is asserted.
- **Dependencies**:
  - This module does not have any external dependencies.
- **Additional Comments**:
  - The FSM implementation ensures that the output signal `div_o` correctly indicates divisibility by 3 for any input signal `x_i`.
