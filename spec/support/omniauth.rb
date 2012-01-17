INFO = {
  "id"=> "220439",
  "email" => "user@sample.com",
}
USER = {'email' => 'user@sample.com', 'name'=>'Sample User'}
OmniAuth.config.mock_auth[:github] = {
  'provider' => 'github',
  'uid' => '12345',
  'user_info' => USER,
  'credentials' => { 'token' => 'octodex' },
  "extra" => {"user_hash" => {'avatar_url' => '/assests/images/rails.png'}}
}
