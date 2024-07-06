ActiveAdmin.register Turn do
  actions :all, except: [:edit, :update, :destroy, :new]
end