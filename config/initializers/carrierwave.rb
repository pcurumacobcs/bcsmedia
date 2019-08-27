CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'D23QR5CCARJJ6D65UX63',
    :aws_secret_access_key  => 'uNWm/VoiANkcbKDthTVJ0tjc7KRx7PCaRG/20sPlZ70',
    :region                 => 'SFO2',
    :endpoint               => 'https://ams3.digitaloceanspaces.com'
  }
  config.fog_directory  = ENV['DO_BUCKET']
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  config.fog_public = false
  config.asset_host = "https://ams3.digitaloceanspaces.com"
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000' }
end