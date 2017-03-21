module ApplicationHelper

  def link_to_remove_table_row(form)
    form.hidden_field(:_destroy) +
    link_to("#", onclick: "EventStash.removeTableRow( this ); return false;", class: "btn btn-default") do
      "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>".html_safe
    end
  end

  def link_to_add_table_row(name, form, association)
    new_object = form.object.class.reflect_on_association(association).klass.new

    fields = form.fields_for(association, new_object, child_index: "new_row_id") do |builder|
      render("#{association.to_s.singularize}", attribute: builder)
    end

    link_to(name, "#",
            class: "btn btn-default",
            data: { role: "add_table_role", content: "#{fields}" },
            onclick: "EventStash.addTableRow( this ); return false;")
  end
end
