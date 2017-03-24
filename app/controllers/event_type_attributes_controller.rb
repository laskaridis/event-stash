
class EventTypeAttributesController < ApplicationController
  before_action :require_login

  # POST /event_types/:event_type_id/event_type_attributes
  def create
    @event_type = EventType.find(params[:event_type_id])
    @event_type_attribute = EventTypeAttribute.new(event_type_attribute_params)
    @event_type_attribute.event_type = @event_type

    respond_to do |format|
      if @event_type_attribute.save
        format.js { render :create, status: :created, location: @event_type }
      else
        format.js { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /event_type_attributes/:id/edit
  def edit
    @event_type_attribute = EventTypeAttribute.find(params[:id])

    respond_to do |format|
      format.js
      format.html
    end
  end

  # PUT /event_type_attributes/:id
  def update
    @event_type_attribute = EventTypeAttribute.find(params[:id])
    @event_type_attribute.update_attributes(event_type_attribute_params)
    @event_type = @event_type_attribute.event_type

    respond_to do |format|
      if @event_type_attribute.save
        format.js { render :update }
      else
        format.js { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_type_attributes/:id
  def destroy
    @event_type_attribute = EventTypeAttribute.find(params[:id])
    @event_type = @event_type_attribute.event_type

    respond_to do |format|
      if @event_type_attribute.destroy
        format.js { render :destroy }
      end
    end
  end

  private

  def event_type_attribute_params
    params.fetch(:event_type_attribute, {}).permit(
      :name,
      :description,
      :attribute_type
    )
  end
end
