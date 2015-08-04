class VideosController < ApplicationController
	before_action :find_video, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@videos = Video.all.order('created_at DESC')
	end

	def new
		@video = current_user.videos.build
	end

	def create
		@video = current_user.videos.build(video_params)
		if @video.save
			redirect_to @video, notice: "sucessfully created video"
		else
			render 'new'
		end 			
	end
	def show
		@video = Video.find(find_video)
	end

	def edit
		
	end
	def update
		if @video.update(video_params)
			redirect_to @video, notice: "sucessfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	private

	def video_params
		params.require(:video).permit(:title, :description)
	end

	def find_video
		@video = Video.find(params[:id])
	end
end
