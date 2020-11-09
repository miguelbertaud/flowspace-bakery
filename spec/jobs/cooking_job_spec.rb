require 'rails_helper'

RSpec.describe CookingJob, type: :job do
  describe '#perform_later' do
    before do
      ActiveJob::Base.queue_adapter = :test
    end

    it 'cooking' do
      expect { CookingJob.perform_later }.to have_enqueued_job
    end

    it 'correct queue' do
      expect { CookingJob.perform_later }.to have_enqueued_job.on_queue('default')
    end
  end
end
