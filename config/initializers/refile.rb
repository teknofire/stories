# config/initializers/refile.rb
if Rails.env.production?
  require "refile/backend/s3"

  aws = {
    access_key_id:  Rails.application.secrets.aws_client_id,
    secret_access_key:  Rails.application.secrets.aws_client_secret,
    bucket: "s2-stories",
    region: 'us-west-2'
  }
  Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)
  Refile.host = "//cdn.torquaret.teknofire.net"
end
