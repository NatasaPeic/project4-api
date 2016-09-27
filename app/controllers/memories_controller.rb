class MemoriesController < OpenReadController
  before_action :set_memory, only: [:update, :destroy]


  # def index
  #   @memories = Memory.all
  #   # @memories = current_user.memories
  #
  #   render json: @memories
  # end



  def index
    if params[:all] == 'true'
      @memories = Memory.all
    else
      @memories = current_user.memories
    end
    render json: @memories
  end








  # GET /memories/1
  # GET /memories/1.json
  def show
      render json: Memory.find(params[:id])
    # render json: @memory
  end

  def new
    @memory = current_user.memories.build(memory_params)
  end


  # POST /memories
  # POST /memories.json
  # missed memory_params for create, showed null on localhost:3000
  def create
    @memory = current_user.memories.build(memory_params)

    if @memory.save
      render json: @memory, status: :created, location: @memory
    else
      render json: @memory.errors, status: :unprocessable_entity
    end
  end



  def update
    # @memory = Memory.find(params[:id])
    # @memory = current_user.memories.find(params[:id])

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

     private :memory_params, :set_memory
end
