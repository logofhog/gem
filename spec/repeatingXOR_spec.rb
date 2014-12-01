require_relative 'spec_helper'

describe RepeatingXOR do
  subject {RepeatingXOR}

  describe 'encrypt' do
    let(:input_string) {'This is my first gem lets see how it works out'}
    let(:key) {'it works!'}
    let(:encryptyed_string) {subject.encrypt(input_string, key)}

    it 'encrypts the string' do
      expect(encryptyed_string).to eq('3d1c49044f1b18534c1054461e1d011f53460c19001b0a061853520c11001f00054b1a5549034f0504014b1c541d')
    end

    it 'decrypts the string' do
      expect(subject.decrypt(encryptyed_string, key)).to eq(input_string)
    end
  end
end



