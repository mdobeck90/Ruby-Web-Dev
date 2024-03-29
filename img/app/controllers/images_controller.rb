class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    
    if  user_signed_in?
      @imageusers = current_user.ImageUsers
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @user = User.find_by_id(@image.user_id)

    @tag = @image.tags.new 
    @image_user = @image.ImageUsers.new

    #image_users who have access to the private image
    @accesslist = ImageUser.where(image_id: @image.id)

    if user_signed_in?
      #arrays of user name strings
      @userlist = @image.users_without_access
    end
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
    if current_user.id != @user.id
      redirect_to @image, notice: "You do not own this image."
    end
  end

  # POST /images
  # POST /images.json
  def create
    

    @image = Image.new(image_params)
    @image.generate_filename
    @image.user_id = current_user.id

    if params[:uploaded_file].nil?
      redirect_to :back, notice: "There was an error" and return
    end

    @uploaded_io = params[:image][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
      file.write(@uploaded_io.read)
    end

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    def set_user
      @user = User.find_by_id(@image.user_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:filename, :private, :user_id)
    end
end
