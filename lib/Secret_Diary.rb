#SecretDiary
# - lock
# - unlock
# - add_entry
# - get_entries

# Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

# When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

# When the user calls `lock` again they throw errors again.

class Diary

  attr_reader :entries, :secure

  def initialize
    @secure = Security.new
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

  def secure?(input = "lock")
    input == "unlock" ? (false) : (true)
  end

end