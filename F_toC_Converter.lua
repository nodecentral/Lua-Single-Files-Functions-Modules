function start()`

  `print('Hello, would you like to convert from:')`

  `print('A) Celsius to Fahrenheit')`

  `print('B) Fahrenheit to Celsius?')`

  `local selection =` [`io.read`](https://io.read)`()`

  `--print(selection)`

  `if selection == 'a' or 'A' then`

`C_to_F()`

  `elseif selection == 'b' or 'B' then`

`F_to_C()`  

  `else`

`print('try again')`

`start()`

  `end`

	`end`