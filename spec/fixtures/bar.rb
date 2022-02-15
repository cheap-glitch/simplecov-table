class Bar
  def uncovered_1
    "foo: #{@foo}"
  end

  def bar
    @a = 'bar'
  end

  def uncovered_2(a)
    @a = a
    @b = 'baz'
    @c = false
  end
end

Bar.new.bar
