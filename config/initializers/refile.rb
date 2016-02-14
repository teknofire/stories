# config/initializers/refile.rb
if Rails.application.secrets.refile_s3_bucket
  aws = {
    access_key_id:  Rails.application.secrets.aws_client_id,
    secret_access_key:  Rails.application.secrets.aws_client_secret,
    bucket: Rails.application.secrets.refile_s3_bucket,
    region: 'us-west-2'
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
  Refile.cdn_host = "//cdn.torquaret.teknofire.net"
end
