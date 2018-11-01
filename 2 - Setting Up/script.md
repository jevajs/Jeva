# 2 - Setting up a JS and HTML document | Making a Very Simple Calculator
**A Step by Step Guide on how to make a very easy calculator using html and javascript basics**

1. Introduction (How to setup a javascript environment in a browser using html)
2. Setup the HTML Document.
```html
<html>
    <head>
    </head>
    <body>


    </body>
</html>
```
3. Add a title into the `head` tag
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>


    </body>
</html>
```
4. Make input groups with id of `num1` and for second input, give it an id of `num2` - *this making the user be able to input values and the id will be used later* 
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1">
        <input id="num2">
        

    </body>
</html>
```
5. Add placeholders for input
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <input id="num2" placeholder="Number 2">
        

    </body>
</html>
```
6. Make form group for the user to pick any math operation *With the select tag having an id of operation*
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        

    </body>
</html>
```
7. Make option tags in the select tags for each math operation 
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        

    </body>
</html>
```
8. Create Calculate button using `button tags` *With an onlick value of calculate()*
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate</button>

    </body>
</html>
```
# JavaScript Part
9. Making the script tags *Below the inputs (for it to fetch the values when it runs)*
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate</button>
        <script>

        </script>
    </body>
</html>
```
10. Creating a function **for** when the button is clicked
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate</button>
        <script>
            function calculate() {

            }
        </script>
    </body>
</html>
```
11. Fetch the values of the input groups using the document class (due to being an html document) - *and Using the id's from the input groups*
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate</button>
        <script>
            function calculate() {
                var num1 = document.getElementById("num1").value;
                var num2 = document.getElementById("num2").value;
            }
        </script>
    </body>
</html>
```
12. Create error handlers using the `if` conditional and returning an alert
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate</button>
        <script>
            function calculate() {
                var num1 = document.getElementById("num1").value;
                var num2 = document.getElementById("num2").value;

                if(!num1 || !num2) {
                    return alert("Please provide numbers in each fields")
                }
            }
        </script>
    </body>
</html>
```
13. Fetch the value that the user selects of the `option` group for the math operation
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate!</button>
        <script>
            function calculate() {
                var num1 = document.getElementById("num1").value;
                var num2 = document.getElementById("num2").value;
                
                if(!num1 || !num2) {
                    return alert("Please provide numbers in both fields")
                }
                
                var operation = document.getElementById("operation").value;


            }
        </script>
    </body>
</html>
```
14. Use `switch case` conditional to calculate the numbers
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate!</button>
        <script>
            function calculate() {
                var num1 = document.getElementById("num1").value;
                var num2 = document.getElementById("num2").value;
                
                if(!num1 || !num2) {
                    return alert("Please provide numbers in both fields")
                }
                
                var operation = document.getElementById("operation").value;
                switch (operation) {
                    case "+":
                        // If the option is = +, then this code gets executed 
                    break;
                    case "-":
                        // If the option is = -, then this code gets executed 
                    break;
                    case "*":
                        // If the option is = *, then this code gets executed 
                    break;
                    case "/":
                        // If the option is = /, then this code gets executed 
                    break;
                }
                

            }
        </script>
    </body>
</html>
```
15. Create an paragraph tag with an id of `output`
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate!</button>
        <p id="output"></p>
        <script>
            function calculate() {
                var num1 = document.getElementById("num1").value;
                var num2 = document.getElementById("num2").value;
                
                if(!num1 || !num2) {
                    return alert("Please provide numbers in both fields")
                }
                
                var operation = document.getElementById("operation").value;
                switch (operation) {
                    case "+":
                        // If the option is = +, then this code gets executed 
                    break;
                    case "-":
                        // If the option is = -, then this code gets executed 
                    break;
                    case "*":
                        // If the option is = *, then this code gets executed 
                    break;
                    case "/":
                        // If the option is = /, then this code gets executed 
                    break;
                }
                

            }
        </script>
    </body>
</html>
```
16. make the switch statement execute for each operation using out **and make its inner html = the output**
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate!</button>
        <p id="output"></p>
        <script>
            function calculate() {
                var num1 = document.getElementById("num1").value;
                var num2 = document.getElementById("num2").value;
                
                if(!num1 || !num2) {
                    return alert("Please provide numbers in both fields")
                }
                

                var operation = document.getElementById("operation").value;
                switch (operation) {
                    case "+":
                        document.getElementById("output").innerHTML = num1 + num2
                    break;
                    case "-":
                        document.getElementById("output").innerHTML = num1 - num2
                    break;
                    case "*":
                        document.getElementById("output").innerHTML = num1 * num2
                    break;
                    case "/":
                        document.getElementById("output").innerHTML = num1 / num2
                    break;
                }
                

            }
        </script>
    </body>
</html>
```
17. add `parseInt` into the number vars
```html
<html>
    <head>
        <title>Calculator</title>
    </head>
    <body>

        <input id="num1" placeholder="Number 1">
        <form>
            <select id="operation">
                <option>+</option> <!-- Addition -->
                <option>-</option> <!-- Subtract -->
                <option>*</option> <!-- Multiply -->
                <option>/</option> <!-- Divide -->
            </select>
        </form>
        <input id="num2" placeholder="Number 2">
        <button onclick="calculate();">Calculate!</button>
        <p id="output"></p>
        <script>
            function calculate() {
                var num1 = parseInt(document.getElementById("num1").value);
                var num2 = parseInt(document.getElementById("num2").value);
                
                if(!num1 || !num2) {
                    return alert("Please provide numbers in both fields")
                }
                

                var operation = document.getElementById("operation").value;
                switch (operation) {
                    case "+":
                        document.getElementById("output").innerHTML = num1 + num2
                    break;
                    case "-":
                        document.getElementById("output").innerHTML = num1 - num2
                    break;
                    case "*":
                        document.getElementById("output").innerHTML = num1 * num2
                    break;
                    case "/":
                        document.getElementById("output").innerHTML = num1 / num2
                    break;
                }
                

            }
        </script>
    </body>
</html>
```

Done. Good job - if you have any questions, join our [discord](https://discord.gg/72vGX2N)