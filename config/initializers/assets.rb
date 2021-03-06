# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.paths << Rails.root.join('vendor','ico')
Rails.application.config.assets.paths << Rails.root.join('vendor','images')
Rails.application.config.assets.paths << Rails.root.join('vendor','css')
Rails.application.config.assets.paths << Rails.root.join('node_modules','datatables','media','images')
Rails.application.config.assets.paths << Rails.root.join('node_modules','datatables','media','images')
Rails.application.config.assets.paths << Rails.root.join('node_modules','datatables','media','images')
Rails.application.config.assets.paths << Rails.root.join('node_modules','datatables','media','images')
Rails.application.config.assets.paths << Rails.root.join('node_modules','datatables','media','images')




# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( *.jpg *.png *.gif *.svg *.ico)
Rails.application.config.assets.precompile += %w(*.eot *.ttf *.woff *otf)
Rails.application.config.assets.precompile += %w( chartkick.js )
Rails.application.config.assets.precompile += %w( sort_desc.png )
Rails.application.config.assets.precompile += %w( sort_desc_disabled.png )
Rails.application.config.assets.precompile += %w( sort_both.png )
Rails.application.config.assets.precompile += %w( sort_asc.png )
Rails.application.config.assets.precompile += %w( sort_asc_disabled.png )

