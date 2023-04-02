class JobsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
    def index
       jobs = Job.all
       render json: jobs
   end

   def show
       job = job_finder
       render json: job
   end

   def create
       job = Job.create!(job_params)
       if job
        render json: { message: 'Job successfully created!', job: job }
       else
        render json: { message: 'Failed to create job' }, status: :unprocessable_entity
       
       end
   end

   
   # def update
   #    job = job_finder
   #    puts review.book_id
   #    review.update!(review_params)
   #    render json: review
   # rescue ActiveRecord::InvalidRecord => e
   #     render json: {error: e.record.errors.full_messages }, status: :unprocessable_entity
   
   # end

   def update
       job = job_finder
       if job
         job.update!(job_params)
         render json: job
       end
   end

   def destroy
       job = job_finder
       job.destroy
       head :no_content
     
   end


   


   private

       def job_finder
           job = Job.find_by(id: params[:id])
       end

    #    def job_params
    #        params.permit(:title, :recruiter, :details, :deadline, :location, :category, :user_id)
    #    end

    def job_params
        params.permit(:title, :recruiter, :image, :details, :deadline, :location, :category, :user_id)
        .tap do |job_params|
          job_params[:deadline] = DateTime.parse(job_params[:deadline]) if job_params[:deadline].present?
        end
      end
      

       def authorize
            return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
       end
       
       
       def render_not_found_response
           render json: { error: "Job not found" }, status: :not_found
       end

end
