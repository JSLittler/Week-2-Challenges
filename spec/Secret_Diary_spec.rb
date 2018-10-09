require 'Secret_Diary'

describe Diary do
  
  it 'exists' do
    diary = Diary.new
    expect(diary).not_to eq nil
  end

  it 'raises error on add_entry if diary is locked' do
    allow_any_instance_of(Security).to receive(:secure?) { true }
    diary = Diary.new
    expect{ diary.add_entry("entry") }.to raise_error 'Diary is locked'
  end

  it 'allows new entries to be added when unlocked' do
    allow_any_instance_of(Security).to receive(:secure?) { false }
    diary = Diary.new
    diary.add_entry("entry")
    expect(diary.entries).not_to eq nil
  end

  it 'does not allow entries to be printed when locked' do
    allow_any_instance_of(Security).to receive(:secure?) { false }
    diary = Diary.new
    diary.add_entry("entry")
    allow_any_instance_of(Security).to receive(:secure?) { true }
    expect{ diary.print_entries }.to raise_error 'Diary is locked'
  end

  it 'allows entries to be printed when locked' do
    diary = Diary.new
    allow_any_instance_of(Security).to receive(:secure?) { false }
    diary.add_entry("entry")
    expect(diary.print_entries).to eq ["entry"]
  end
end

describe Security do
  it 'exists' do
    expect(Security.new).not_to eq nil
  end

  it 'has a default status of "locked"' do
    sec = Security.new
    expect(sec.secure?("lock")).to eq true
  end

  it 'can be unlocked' do
    sec = Security.new
    expect(sec.secure?("unlock")).to eq false
  end
end