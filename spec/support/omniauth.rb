INFO = {
  "id"=> "220439",
  "email" => "user@sample.com",
}
OmniAuth.config.mock_auth[:github] = {
  'provider' => 'github',
  'uid' => '12345',
  'user_info' => {'email' => 'user@sample.com', 'name'=>'Sample User'},
  'credentials' => { 'token' => 'octodex' },
  "extra" => {"user_hash" => INFO}
}

