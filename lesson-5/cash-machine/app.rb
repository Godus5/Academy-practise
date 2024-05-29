# frozen_string_literal: true

require 'rack'
require_relative './cash_machine'

# The class describes the operation of the application in the application server
class App
  def call(env)
    req = Rack::Request.new(env)
    params = req.query_string.split('&').map { |pair| pair.split('=') }.to_h

    router(req.path, params)
  end

  def router(path, params)
    case path
    when '/'
      [200, { 'Content-Type' => 'text/html' }, ['Hello, world!']]
    when '/user'
      [200, { 'Content-Type' => 'text/html' }, ['Hello user!']]
    when '/cash_machine'
      [200, { 'Content-Type' => 'text/html' }, [cash_machine_controller(params)]]
    else
      [404, { 'Content-Type' => 'text/html' }, ['404']]
    end
  end

  def cash_machine_controller(params)
    cash_machine = CashMachine.new
    case params['method']
    when 'deposit'
      cash_machine.deposit(params['value'].to_i)
    when 'withdraw'
      cash_machine.withdraw(params['value'].to_i)
    when 'balance'
      "Current balance: #{cash_machine.current_balance}"
    else
      '404'
    end
  end
end
