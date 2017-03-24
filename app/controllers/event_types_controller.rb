class EventTypesController < ApplicationController
  before_action :require_login

  # GET /event_types
  def index
    @event_types = EventType.where(account: current_user.email)

    if params[:q]
      @event_types = @event_types.where("name LIKE ?", "%#{params[:q]}%")
    end

    @event_types = @event_types.page(params[:page])

    respond_to do |format|
      format.html { render :index }
    end
  end

  # GET /event_types/:id
  def show
    @event_type = EventType.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @event_type, status: :ok }
    end
  end

  # GET /event_types/new
  def new
    @event_type = EventType.new
  end

  # POST /event_types
  def create
    @event_type = EventType.new(event_type_params_for_create)
    @event_type.account = current_user.email

    if @event_type.save
      flash[:success] = "Event type #{@event_type.name} has been created successfully"
      redirect_to event_types_path
    else
      render :new
    end
  end

  def edit
    @event_type = EventType.find(params[:id])
    @event_type_attribute = EventTypeAttribute.new
  end

  # PUT /event_types/:id
  def update
    @event_type = EventType.find(params[:id])
    @event_type.update_attributes(event_type_params_for_update)
    @event_type_attribute = EventTypeAttribute.new

    if @event_type.save
      flash[:success] = "#{@event_type.name} has been updated successfully"
    end

    render :show
  end

  # DELETE /event_types/:id
  def destroy
    @event_type = EventType.find(params[:id])
    @event_type.destroy

    flash[:success] = "#{@event_type.name} has been deleted"

    redirect_to event_types_path
  end

  private

  def event_type_params_for_create
    params.fetch(:event_type, {}).permit(
      :name,
      :description,
      :transaction_type,
      :format,
      :strict_format,
      event_type_attributes_attributes: [
        :name,
        :description,
        :attribute_type
      ]
    )
  end

  def event_type_params_for_update
    params.fetch(:event_type, {}).permit(
      :description,
      :transaction_type,
      :format,
      :strict_format,
      event_type_attributes_attributes: [
        :id,
        :name,
        :description,
        :attribute_type,
        :_destroy
      ]
    )
  end
end

