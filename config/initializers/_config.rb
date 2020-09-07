APP_CONFIG = JSON
               .parse(
                 YAML.safe_load(
                   ERB.new(
                     File.read("#{Rails.root}/config/config.yml")
                   ).result
                 ).to_json,
                 object_class: OpenStruct
               )
               .send(Rails.env)

SECRET_CREDENTIALS = JSON.parse(Rails.application.credentials[Rails.env.to_sym].to_json, object_class: OpenStruct)