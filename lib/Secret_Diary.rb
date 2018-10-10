class Diary

  attr_accessor :secure

  def initialize(secure = Security.new)
    @secure = secure
  end

  def entries
    @entries = []
  end

  def add_entry(entry)
    fail('Diary is locked') if @secure.secure? == true
    entries.push(entry)
  end

  def print_entries
    fail 'Diary is locked' if @secure.secure? == true
    index = 1
    @entries.each do | entry |
      puts "Entry number #{index}:
      #{entry}
      -- Entry ends."
      index += 1
    end
  end

end

class Security

  def initialize
    @lock = true
  end

  def secure?
    @lock
  end

  def toggle
    @lock == true ? (@lock = false) : (@lock = true)
    @lock
  end

end