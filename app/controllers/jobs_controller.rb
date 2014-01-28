class JobsController < ApplicationController
  def create
    @job = Job.new(job_params)
    @job.save
    @mailuser = People.find(@job.people_id)
      if @job.save
        JobMailer.work_confirmation(@mailuser).deliver
        flash[:success] = "Success! Check your email."
        redirect_to event_path(@job.event_id)
      else
        flash[:faliure] = "Invalid entry, try again."
        redirect_to event_path(@job.event_id)
      end
  end
private
  def job_params
    params.require(:jobs).permit(:status,:people_id, :event_id, :date, :id)
  end

end
