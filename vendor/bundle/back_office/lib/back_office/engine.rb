module BackOffice
  class Engine < ::Rails::Engine
    isolate_namespace BackOffice

    initializer :back_office do
      ActiveAdmin.application.load_paths += [File.join(root, 'lib/back_office/admin')]
    end
  end
end
