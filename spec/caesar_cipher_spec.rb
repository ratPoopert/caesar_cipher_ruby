require './lib/caesar_cipher.rb'

describe CaesarCipher do
  subject { CaesarCipher.new(string, shift_amount).encrypted_string }

  context 'lowercase letters' do
    let(:string) { 'hello world' }
    let(:shift_amount) { 2 }

    it 'moves all letters by the shift amount' do
      expect(subject).to eq('jgnnq yqtnf')
    end
  end

  context 'capitalized letters' do
    let(:string) { 'HELLO WORLD' }
    let(:shift_amount) { 2 }

    it 'moves all letters by the shift amount' do
      expect(subject).to eq('JGNNQ YQTNF')
    end
  end

  context 'mixed case' do
    let(:string) { 'Hello World' }
    let(:shift_amount) { 2 }

    it 'maintains case' do
      expect(subject).to eq('Jgnnq Yqtnf')
    end
  end

  context 'numbers' do
    let(:string) { '5 years old' }
    let(:shift_amount) { 1 }

    it "doesn't affect numbers" do
      expect(subject).to eq('5 zfbst pme')
    end
  end

  context 'punctuation' do
    let(:string) { 'Hello!' }
    let(:shift_amount) { 2 }

    it "doesn't affect punctuation" do
      expect(subject).to eq('Jgnnq!')
    end
  end

  context 'negative shift amount' do
    let(:string) { 'Abcd' }
    let(:shift_amount) { -2 }

    it 'wraps to the end of the alphabet' do
      expect(subject).to eq('Yzab')
    end
  end
end
