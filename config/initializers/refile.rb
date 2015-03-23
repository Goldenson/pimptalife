require "refile/backend/s3"

aws = {
  access_key_id: ENV['ACCES_KEY_ID'],
  secret_access_key: ENV['SECRET_ACCES_KEY'],
  bucket: ENV['BUCKET'],
}

Refile.cache = Refile::Backend::S3.new(prefix: "cache", **aws)
Refile.store = Refile::Backend::S3.new(prefix: "store", **aws)