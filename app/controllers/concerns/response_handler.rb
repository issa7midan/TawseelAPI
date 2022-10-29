module ResponseHandler
  def error_state
    error_states = {
      :unauthorized                => ERROR + '.401',
      :row_unsuccessfully_inserted => ERROR + '.403',
      :not_found                   => ERROR + '404',
      :invalid_token               => ERROR + '.406',
      :no_user_assoc_with_token    => ERROR + '.407',
      :unable_to_read_token        => ERROR + '.408',
      :invalid_credentials         => ERROR + '.409',
      :invalid_admin_key           => ERROR + '.411',
      :low_permission              => ERROR + '.412',
      :admin_not_found             => row_not_found + '.001',
      :driver_not_found            => row_not_found + '.002',
      :city_not_found              => row_not_found + '.003',
      :subscription_not_found      => row_not_found + '.004',
      :market_not_found            => row_not_found + '.005',
      :job_not_found               => row_not_found + '.006',
      :admin_already_exists        => row_already_exists + '.001',
      :driver_already_exists       => row_already_exists + '.002',
      :city_already_exists         => row_already_exists + '.003',
      :subscription_already_exists => row_already_exists + '.004',
      :api_key_expired             => api_key_errors + '.001',
      :invalid_api_key             => api_key_errors + '.002'
    }
    return error_states
  end 

  def error_state_description
    error_state_descriptions = {
      :unauthorized              => 'Unauthorized'
      :rowAlreadyExist           => 'Row already exist'
      :rowUnsuccessfullyInserted => 'Row unsuccessful inserted'
      :notFound                  => 'Resource not found'
      :rowNotFound               => 'Row not found'
      :invalidToken              => 'Invalid token'
      :noUserAssocWithToken      => 'No user associated with this token'
      :unableToReadToken         => 'Unable to read token'
      :adminNotFound             => 'Admin not found'
      :driverNotFound            => 'Driver not found'
      :cityNotFound              => 'City not found'
      :adminAlreadyExist         => 'Admin already exist'
      :driverAlreadyExist        => 'Driver already exist'
      :cityAlreadyExist          => 'City already exist'
      :invalidCredintials        => 'Invalid Credintials'
      :apiKeyExpired             => 'Api key is Expired'
      :invalidApiKey             => 'Invalid api key'
      :subscriptionNotFound      => 'Subscription not found'
      :invalidAdminKey           => 'Invalid admin key'
      :subscriptionAlreadyExist  => 'User Id already exist'
      :marketNotFound            => 'Market not found'
      :jobNotFound               => 'Job not found'
      :lowPermission             => 'Low permission to perform this process'
    } 
  end

  private 

  ERROR = '400'
  SUCCESS = '200'
  EMPTY_STRING = ''
  ACCESS_TOKEN = 'AccessToken'
  
  def row_not_found
    row_not_found_code = ERROR + '.405'
  end 

  def row_already_exists
    row_already_exists_code = ERROR + '.402'
  end

  def api_key_errors
    api_key_error_code = ERROR + '.410'
  end
end
