class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  def show
    @reference = @topic.references.new
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

      if @topic.save
        redirect_to @topic, notice: 'Topic was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /topics/1
  def update
      if @topic.update(topic_params)
        redirect_to @topic, notice: 'Topic was successfully updated.'
      else
        render :edit 
      end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'Topic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :description)
    end
end
