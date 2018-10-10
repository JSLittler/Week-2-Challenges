require 'Secret_Diary'

describe Diary do

  let (:diary_is_locked)  { double :secure, :secure? => true }
  let (:diary_not_locked) { double :secure, :secure? => false }
  let (:locked_diary)   { Diary.new(diary_is_locked) }
  let (:unlocked_diary) { Diary.new(diary_not_locked) }
  
  it 'exists' do
    expect(Diary.new).not_to eq nil
  end

  it 'raises error on add_entry if diary is locked' do
    expect{ locked_diary.add_entry("entry") }.to raise_error 'Diary is locked'
  end

  it 'allows new entries to be added when unlocked' do
    diary = unlocked_diary
    diary.add_entry("entry")
    expect(diary.entries).not_to eq nil
  end

  it 'does not allow entries to be printed when locked' do
    expect{ locked_diary.print_entries }.to raise_error 'Diary is locked'
  end

  it 'allows entries to be printed when unlocked' do
    diary = unlocked_diary
    diary.add_entry("entry")
    expect(diary.print_entries).to eq ["entry"]
  end

  it 'can be unlocked through Diary' do
    diary = Diary.new
    diary.secure.toggle
    expect(diary.secure.secure?).to eq false
  end
end

describe Security do

  let (:sec) { Security.new }
  it 'exists' do
    expect(sec).not_to eq nil
  end

  it 'has a default status of "locked"' do
    expect(sec.secure?).to eq true
  end

  it 'can be unlocked' do
    expect(sec.toggle).to eq false
  end
end