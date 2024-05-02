require_relative 'calculator'

RSpec.describe Calculator do
  describe "Calculator#add" do
    before{ @calculator = Calculator.new }
    let(:error){ "Something is wrong into the input.."}
    let(:negative_val_error){ 'Some values found negative' }

    it 'Should add argument which is comma or \n seperated' do
      result = @calculator.add('1,1', "2\n3")
      expect(result.class).to eq(Array)
      expect(result).to eq([2, 5])
    end

    it 'Should add any number of arguments' do
      result = @calculator.add("1,\n1", "2\n3", "1,\n7\n")
      expect(result).to eq([2, 5, 8])
    end

    context 'Errors with unexpected inputs' do
      it 'Should raise error if input is unexpected' do
        result = @calculator.add("1,\n")
        expect(result.class).to eq(String)
        expect(result).to eq(error)
      end

      it 'Should raise error with negative numbers' do
        result = @calculator.add('1,1', "2\n-3")
        expect(result.class).to eq(String)
        expect(result).to eq(negative_val_error)
      end
    end
  end
end
