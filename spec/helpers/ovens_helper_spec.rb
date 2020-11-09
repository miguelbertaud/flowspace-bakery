describe OvensHelper do
  describe '#cookie_fillings' do
    context 'with argument' do
      it { expect(helper.cookie_fillings('flavor')).to eq('flavor') }
    end

    context 'without argument' do
      it {expect(helper.cookie_fillings('')).to eq('no filling')}
    end
  end
end