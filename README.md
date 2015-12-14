#ShangriLa SDK for Ruby

##Install

``gem install shangrila``

or Gemfile

``gem 'shangrila'``

##Usage

### Master API

#### Get master record

```Shangrila::Sora.new().get_master_data(year, cours)```

```Shangrila::Sora.new().get_master_data(2014, 1)```

#### Get anime title list

```Shangrila::Sora.new().get_title_list(year, cours)```

```Shangrila::Sora.new().get_title_list(2015, 1)```

#### Get anime master data map key=id

```Shangrila::Sora.new().get_map_key_id(year, cours)```

```Shangrila::Sora.new().get_map_key_id(2015, 1)```

#### Get anime title map

```Shangrila::Sora.new().get_map_with_key_title(year, cours, property)```

```Shangrila::Sora.new().get_map_with_key_title(2015, 2, 'twitter_account')```

#### Get flat data

```Shangrila::Sora.new().get_flat_data(year, cours, property_list)```

```Shangrila::Sora.new().get_flat_data(2014, 2, ['title', 'twitter_hash_tag'])```

#### (IN irb) 

```
irb(main):001:0> require 'shangrila'
=> true
irb(main):002:0> Shangrila::Sora.new().get_flat_data(2015, 4, ['id', 'title']).each{|v| p v}
```

### Twitter API

#### Get Twitter Follower Status

``Shangrila::Sana.new().follower_status(['usagi_anime','kinmosa_anime','aldnoahzero'])``

#### Get Twitter Follower History

``Shangrila::Sana.new().follower_history('usagi_anime')``

``Shangrila::Sana.new().follower_history('usagi_anime', 1446901208)``