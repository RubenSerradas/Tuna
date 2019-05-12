# Tuna

## Simple Data types

There are different data types in Tuna, these are:

### Integer

A 64 bit integer (long long int in C++). 

```
  foo = 28
```

### Float

A long double, depending of the architecture we're going to have 64 or 128 bits.

```
  bar = 0.5
```

### String

A character or string of characters. These could be made with "" or ''.
Right now there are no difference between these two options, maybe later
with the dessign of RegExes I change them.

```
  foo = 'hello world'
  bar = "hola mundo"
```

### Boolean

Booleans only have 2 values: true or false. 

```
  a = true
  b = false
```

## Complex Data Types

### Lists

Lists are ordered sequences of eclectic data. These acts like maps or dictionaries, 
for example:

```
  [1,"ruben",true]
```

### Dictionaries

```
  foo = %{ 
           0: "cero",
           1: "uno",
           2: "dos"
          }
```
### Functions

There are 2 equivalent ways of defining functions:

```
  foo = fn (a, b) {
          a + b
        }

  fn foo(a, b) {
    a + b  
  }
```

You can also forget the parenthesis is there's no list of parameters:

```
  fn foo {
    42  
  }
```

## Assignation

Variables in Tuna are assigned with `=`. We can make simultaneous assignment:

a, b, c = 2, "hello", 2.4

## Comments

There're 2 types of comments:

```
  # Simple line comments and....

  #=
    Multilines comments.
    Maybe I'll change this one. 
   =#

```
# Expressions

## Numeric Expressions

Numeric expressions are the one who have at least ONE number in them.

### Exponentiation

```
  2 ** 2 
  # 4
  
  2 ** 2.5 
  # 5.65
  
  2.5 ** 2
  # 6.25

  "abc" ** 2
  # "abcabcabcabcabcabcabcabcabc"
  # "abc".size ** 2 

  # In the case of a Float I'm going to transform the Float to a Integer first.
  "abc" ** 2.4
  # "abcabcabcabcabcabcabcabcabc"

```

### Unary Minus

```
  -2
```


### /, *, %

```
  # If you combine an Integer with a Float you're going to get 
  # the largest number.
  
  2* 2.5 
  # 5.0
  
  # Same with the /
  
  5.0 / 2
  # 2.5
  
  5 % 2.5 # module operator
  # 0.0
  
  # When you try to combine Integers or Floats with a String
  # you'll get in this case a String
  
  "abc" * 2
  # "abcabc" 

  "abc" * 2.4
  # "abcabc" 

  "abc" / 2
  # "a"
  # "abc".size / 2

  "abc" % 2
  # "a"

  # If you don't combine Floats and Integers then we get the same Number 
  5 / 2
  # 2
```

### +, Binary -

```
  1 + 2
  # 3

  1 + 2.0
  # 3.0

  "1" + 2
  # "12"

  "1" + 2.5
  # "12.5"


  1 - 2
  # -1

  1.0 - 2
  # -1.0 

  "123" - "1"
  # "23"

  # But you can concatenate
  "1" + "hola"
  # "1hola"

```

## Boolean Expressions

### Not (!)

```
  !false
  # true

  ! true
  # false

  ! null
  # null 
```

### Ordering (<, <=, =>, >)

```
  # You can compare every number
  2 > ( 3 - 1.5 )
  # true

  # But you can't compare Strings and Numbers!
  "a" < 2
  # Error!

  # Tuna also has the UFO operator

  2 <=> 2
  # 0
  # pretty cool.

  # You can compare between Strings
  "a" > "b"
  # false

```

### Equality

```
  2 == 2.0
  # true

  #=
    What about the Strings and Numbers?
  =#

  "2" == 2
  # false!

  #=
    When we use Strings to calculate Tuna makes some transformations but
    when we are talking about equality and ordering it does not.
  =#

```
# Precedence List

* !, ~
* "**"
* - 
* %,/,*
* +, - 
* <<, >>
* &
* | ^
* < <= => >
* == === != <=>
* &&
* ||
* ::
* exception
* =

# Control Flow

## ifs


Control flow expressions in Tuna are similar to Ruby, in the sense
that everything is true except null or false (these values are considered falsey).

```
  if "hello" {
    # This is going to be always true.
  }

  # You can put parenthesis if you want.
  if ( a > b ) {
  }

  # For elses and else ifs 
  if a > b {
    pr("a is greater than b")
  } elsif a < b {
    pr("a is less than b")
  } else {
     pr("say no to racism.")
  }

  # An if is  also an expretion

  x = if a == b { 
        "stuff"
      } else {
        "happen"  
      }
  x
  # is going to be stuff or happen
```
## cases

With cases you can destructure certain structures like in Haskell. I'm thinking
that you can destructure Objects and Classes too but that's for later :). 

```
  a = case x {
        "hello" => "this says hello",
        1 => "number 1",
        [b, _] => "the first element is" + b,
        _ => "doesnt matter"
      }

  b = case type(x) {
        "string" => 0,
        "boolean" => 1
      }
```
# Loops

## Infinite loops

```
  loop {
    pr "dont forget you are here forever"  
  }
```

## While loops

```
  a = 0
  while a < 10 {
    # stuff
    a += 1  
  }
```
## for loops

```
  for i in [1::10] {
    #stuff  
  }

  # you can also instantiate 2 variables
  for i, y in [1::3] {
    pr (i)
    pr (y)
  }
  #=
    0
    1
    1
    2
    2
    3
  #=
```

## Controling loops

```
  # breaking a loop
  loop {
    break
  }

  # continue jumps to 
  # the begining of the iteration.
  for i in [1::10] {
    if i % 2 == 0 {
      continue  
    }
    pr i
  }

```
# Object Oriented Tuna

In Tuna you can make anonymous dictionary objects with functions or 
have classes to instantiate objects. For example: 

```
  anon = @[ "hello": fn { pr("hello world") },
            "hola": fn {pr("yo hablo espanol")}
          ]
  anon["hello"]
  # its gonna call the function.

  # for dictionaries you can call attributes inside with the '.' operator.
  # This only work with Strings!
  a.hello
  # calls the "hello" function.
```

## Classes

```
  class Metal {

    attr $subgenre, $bands, @static_var
    
    fn Metal($subgenre, $bands){
    }

    op <<(band) {
        $bands << band
    }

    fn @new_genre (genre){
      genre + " metal"
    }
    
    private: 
  
      fn private_stuff {
        # some code that I use inside the class.  
      }
  }

  death_metal = new Metal(Metal.new_genre("death"), 
                          ["death", "obituary", "bolt thrower"])

```

We have the "private" reserved word for attributes and functions that we don't
want that the Class user uses, but Tuna does NOT enforce encapsulation,
the interpreter is going to show a warning if the user uses a private function
but thats it!

## Inheritance

```
  class Animal {
    # You don't need to put the attributes if they are in 
    # the constructor. 
    fn Animal($name){}

    fn hello(){
      pr "I'm a "+ $name  
    }

  }

  class Dog < Animal {
    
    fn Dog($breed){
      super($name)    
    }

    fn hello(){ 
      pr "I'm a "+ $name +  "of " + $breed + "breed." 
    }

    fn woof() {
      pr "woof!"  
    }
  }

```

