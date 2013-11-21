require 'spec_helper'

describe Placement do
  describe 'finish' do
    let!(:placement) { create(:placement) }
    it 'hide placement from active placements' do
      expect {
        placement.finish
      }.to change{Placement.count}.by(-1)
    end
  end
end
