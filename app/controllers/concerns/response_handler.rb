module ResponseHandler

  def result(code: 400, state: nil, result: [])
    render json: ({code: code, fullCode: error_state(state), reponse: error_state_description(state), result: result})
  end

  private 

  ERROR = '400'
  SUCCESS = '200'
  EMPTY_STRING = ''
  ACCESS_TOKEN = 'AccessToken'

  def error_state(state)
    error_states = {
      :admin_already_exists        => row_already_exists + '.001',
      :admin_not_found             => row_not_found + '.001',
      :api_key_expired             => api_key_errors + '.001',
      :city_already_exists         => row_already_exists + '.003',
      :city_not_found              => row_not_found + '.003',
      :driver_already_exists       => row_already_exists + '.002',
      :driver_not_found            => row_not_found + '.002',
      :invalid_admin_key           => ERROR + '.411',
      :invalid_api_key             => api_key_errors + '.002',
      :invalid_credentials         => ERROR + '.409',
      :invalid_token               => ERROR + '.406',
      :job_not_found               => row_not_found + '.006',
      :low_permission              => ERROR + '.412',
      :market_not_found            => row_not_found + '.005',
      :no_user_assoc_with_token    => ERROR + '.407',
      :not_found                   => ERROR + '404',
      :row_unsuccessfully_inserted => ERROR + '.403',
      :subscription_already_exists => row_already_exists + '.004',
      :subscription_not_found      => row_not_found + '.004',
      :unable_to_read_token        => ERROR + '.408',
      :unauthorized                => ERROR + '.401'
    }

    return error_states[state]
  end 

  def error_state_description(state)
    error_state_descriptions = {
      :admin_already_exists        => 'Admin already exist',
      :admin_not_found             => 'Admin not found',
      :api_key_expired             => 'Api key is Expired',
      :city_already_exists         => 'City already exist',
      :city_not_found              => 'City not found',
      :driver_already_exists       => 'Driver already exist',
      :driver_not_found            => 'Driver not found',
      :invalid_admin_key           => 'Invalid admin key',
      :invalid_api_key             => 'Invalid api key',
      :invalid_credentials         => 'Invalid Credintials',
      :invalid_token               => 'Invalid token',
      :job_not_found               => 'Job not found',
      :low_permission              => 'Low permission to perform this process',
      :market_not_found            => 'Market not found',
      :no_user_assoc_with_token    => 'No user associated with this token',
      :not_found                   => 'Resource not found',
      :row_already_exists          => 'Row already exist',
      :row_not_found               => 'Row not found',
      :row_unsuccessfully_inserted => 'Row unsuccessful inserted',
      :subscription_already_exists => 'User Id already exist',
      :subscription_not_found      => 'Subscription not found',
      :unable_to_read_token        => 'Unable to read token',
      :unauthorized                => 'Unauthorized'
    }

    return error_state_descriptions[state]
  end

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
