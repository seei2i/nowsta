class JobsController < ApplicationController
	def create
    @job = Job.new(job_params)
    @job.save
    redirect_to event_path(@job.event_id), notice: "You've Added Someone to the job."
  end
private
  def job_params
    params.require(:jobs).permit(:status,:people_id, :event_id, :date, :id)
  end

end
