ActiveAdmin.register Category do

  permit_params :name, :memory_id

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

end