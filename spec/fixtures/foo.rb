class Foo
  def foo
    "foo: #{@foo}"
  end

  def bar
    @a = 'bar'
  end

  def baz(b)
    @a = b
  end

  def uncovered
    @a = 'baz'
  end
end

Foo.new.foo
Foo.new.foo
Foo.new.bar
Foo.new.baz 'hello'
