# Spelunking in Ruby

--->

Wait, what are we doing?

--->

<iframe src="https://giphy.com/embed/xUySTXTjV5FEL8f8Os" width="480" height="318" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

--->

<iframe src="https://giphy.com/embed/xUySTvOb3qiAlrT9qU" width="480" height="318" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

--->

No.

---

Before we head in a couple things to prepare

<iframe src="https://giphy.com/embed/pO7jomKrTwfSw" width="480" height="260" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

--->

A bit about reading code.
<br>
<br>
(live demo time)

```
cd ~/Sites/slides/ruby-spelunking/samples
vi puts.rb hello.rb speak.rb supyo.rb hiya.rb rails.rb
```

--->

Rails tho.

🪄 🎩 🐰

<iframe src="https://giphy.com/embed/l2SqhmmWcv9pibmy4" width="480" height="270" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

---

Alright, let's dive in

<iframe src="https://giphy.com/embed/8UYMQ5MCmuqXu" width="480" height="345" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

---

You can start by looking around
<iframe src="https://giphy.com/embed/9ogI8f6Hnn4s8S5x1U" width="480" height="270" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

--->

How do we look around?

<br>

`puts`!
<br>
or better yet
`p`

--->

Everybody loves some good old-fashioned print debugging!
```rb
class Dog
  include Paws
  include Tail

  p "Howdy!"

  def speak(msg)
    # logic...
    p "the dog spoke: #{msg}"
  end

  def sit
    # logic...
    p "the dog sat"
  end

  # more methods...

end
```

--->

But don't commit your puts. Or if you do, at least call yourself out for it

```rb

def complex_function
  # logic...
  p "@jweir: hereiam #{datum}"
end
```

--->

Maybe you want to print where you are

```rb
p "#{__FILE__}:#{__LINE__}"
```

--->

Maybe I want to be able to toggle that

```rb
debug_mode = true

def complex_function
  # logic...
  p "@jweir: hereiam #{datum}" if debug_mode
end

```

--->

Maybe only if a specific file is somewhere in the call stack
```rb
p "@jweir: hereiam #{datum}" if caller.grep(/specific_file.rb/).any?
```

--->

Maybe I just want to see the call stack
```rb
p caller.join "\n\t"
```

Gives us

```rb
caller.rb: in 'foo'
  caller.rb:2:in 'bar'
  caller.rb:13:in '<main>'
```

---

# `-d`

Ever feel like an error is thrown, but you don't know where it's caught, or if it was
thrown or what's going on at all?

<iframe src="https://giphy.com/embed/v2MOe5HrDhHIdWpazB" width="480" height="269" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>

`-d` to the rescue!

--->

gulp.rb
```rb

def yumyum
  raise "Ruh roh!"
rescue
  # Hahaha, no.
end

yumyum
```

```rb
$ ruby -d gulp.rb

$ Exception 'RuntimeError' at gulp.rb:2 - Ruh roh!
```

---

### $!

Turns out you need not rescue an error to print it.
```rb
def thing
  unreliable_method
ensure
  puts $!
end
```

Alternatively:

```rb
def thing
  unreliable_method
rescue => e
  puts e
  raise e
end
```

---

# Gems

---

## Pry

Your basic debugging repl.

--->

Handy tip I wish I had had before now...

Put this in your ~/.config/pry/pryrc:
```
Pry::Commands.command /^$/, "repeat last command" do
  pry_instance.input = StringIO.new(Pry.history.to_a.last)
end
```

--->

Live demo time
```sh
ruby pry.rb
```

--->

Also be sure to check out:

# pry-byebug

---

# What the gem?

Ever wonder what a gem is doing?
<br>
Every want to dig into a gem's source code?

<br><br>(insert complaint about rails magic here)

--->

Wanna see the code or add a debug or something silly?

```
EDITOR=vim gem open stripe
```
<br>

(live demo time)

--->

But now I made changes, right? Gross.

```
gem pristine stripe
```

---

<iframe src="https://giphy.com/embed/3o6Mb9DgPPw9zKkfDO" width="480" height="362" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
