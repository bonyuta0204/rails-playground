namespace :ridgepole do
  desc 'Apply db/Schemafile to database using Ridgepole'
  task :apply => :environment do
    config = Rails.configuration.database_configuration[Rails.env]
    adapter = config['adapter']
    database = config['database']
    username = config['username']
    password = config['password']
    host = config['host']
    port = config['port']

    cmd = [
      'bundle', 'exec', 'ridgepole',
      '--apply',
      '-c', 'config/database.yml',
      '--env', Rails.env,
      '-f', 'db/Schemafile'
    ]
    puts "Running: #{cmd.join(' ')}"
    system(*cmd) || abort('ridgepole apply failed')
  end

  desc 'Dump database schema to db/Schemafile using Ridgepole'
  task :dump => :environment do
    config = Rails.configuration.database_configuration[Rails.env]
    adapter = config['adapter']
    database = config['database']
    username = config['username']
    password = config['password']
    host = config['host']
    port = config['port']

    cmd = [
      'bundle', 'exec', 'ridgepole',
      '--export',
      '-c', 'config/database.yml',
      '--env', Rails.env,
      '-o', 'db/Schemafile'
    ]
    puts "Running: #{cmd.join(' ')}"
    system(*cmd) || abort('ridgepole dump failed')
  end
end
