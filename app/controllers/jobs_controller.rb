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
           render json: job
       else
           render json: { errors: "validation errors"}, status: :unprocessable_entity
       
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

       def job_params
           params_permit(:title, :recruiter, :stack, :ifremote, :location, :user_id)
       end

       def authorize
            return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
       end
       
       
       def render_not_found_response
           render json: { error: "Job not found" }, status: :not_found
       end

end
