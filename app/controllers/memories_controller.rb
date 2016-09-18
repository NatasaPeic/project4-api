class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :update, :destroy]

  # GET /memories
  # GET /memories.json
  def index
    @memories = Memory.all
    # @memories = current_user.memories

    render json: @memories
  end

  # GET /memories/1
  # GET /memories/1.json
  def show
    render json: @memory
  end

  # POST /memories
  # POST /memories.json
  def create
    @memory = current_user.memories.build(memory_params)

    if @memory.save
      render json: @memory, status: :created, location: @memory
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /memories/1
  # PATCH/PUT /memories/1.json
  def update
    # @memory = Memory.find(params[:id])

    if @memory.update(memory_params)
      head :no_content
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.json
  def destroy
    @memory.destroy

    head :no_content
  end

  # private

    def set_memory
      @memory = Memory.find(params[:id])
      # @memory = current_user.memories.find(params[:id])
    end

    def memory_params
      params.require(:memory).permit(:name, :description, :cohort)
    end

    private :set_memory, :memory_params, :current_user
end
