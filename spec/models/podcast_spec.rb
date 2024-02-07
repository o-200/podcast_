require 'rails_helper'

RSpec.describe Podcast, type: :model do
  subject(:podcast) { FactoryBot.build(:podcast) }

  ########## ACTIVE-STORAGE-VALIDATIONS ##########
  it { is_expected.to validate_attached_of(:audio) }
  it { is_expected.to validate_content_type_of(:audio).allowing('audio/mpeg', 'audio/mp4', 'audio/wav', 'audio/aac', 'audio/ogg', 'audio/webm', 'audio/3gpp') }
  it { is_expected.to validate_size_of(:audio).between(15.kilobyte..2.gigabytes) }
  ################################################

  it 'is valid with FactoryBot attributes' do
    expect(podcast).to be_valid
  end

  describe 'validations' do
    context 'name' do
      it 'is invalid when nil' do
        podcast.name = nil
        expect(podcast).to_not be_valid
      end

      it 'is invalid with non-unique name' do
        podcast.save
        failed_podcast = Podcast.new(name: podcast.name)

        expect(failed_podcast).to_not be_valid
      end
    end

    context 'body' do
      it 'is valid when nil' do
        podcast.body = nil
        expect(podcast).to be_valid
      end

      it 'is valid with a unique body' do
        podcast.save
        new_podcast = FactoryBot.build(:podcast)
        new_podcast.body = podcast.body

        expect(new_podcast).to be_valid
      end
    end
  end
end
