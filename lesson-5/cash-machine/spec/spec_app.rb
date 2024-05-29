# frozen_string_literal: true

require_relative '../app'
require 'rspec'

describe 'Testing methods in the app script' do
  let(:current_balance) { 100 }
  let(:deposit_amount) { 250 }
  let(:withdraw_amount) { 50 }
  let(:app) { App.new }
  let(:full_path) do
    {
      hello_world: '/',
      hello_user: '/user',
      deposit: "/cash_machine?method=deposit&value=#{deposit_amount}",
      withdraw: "/cash_machine?method=withdraw&value=#{withdraw_amount}",
      balance: '/cash_machine?method=balance'
    }
  end

  before do
    File.write(TASK_FILE, current_balance)
  end

  it 'deposit' do
    path, params = full_path[:deposit].split('?')
    params = params.split('&').map { |pair| pair.split('=') }.to_h
    expect(app.router(path,
                      params)[2]).to eq(["Deposit accepted.\nCurrent balance: #{current_balance + deposit_amount}"])
  end

  it 'withdraw' do
    path, params = full_path[:withdraw].split('?')
    params = params.split('&').map { |pair| pair.split('=') }.to_h
    expect(app.router(path,
                      params)[2]).to eq(["Funds have been withdrawn.\nCurrent balance: #{current_balance - withdraw_amount}"])
  end

  it 'balance' do
    path, params = full_path[:balance].split('?')
    params = params.split('&').map { |pair| pair.split('=') }.to_h
    expect(app.router(path, params)[2]).to eq(["Current balance: #{current_balance}"])
  end

  it 'Hello, world!' do
    path = full_path[:hello_world].split('?')[0]
    params = ''
    params = params.split('&').map { |pair| pair.split('=') }.to_h
    expect(app.router(path, params)[2]).to eq(['Hello, world!'])
  end

  it 'Hello, world!' do
    path = full_path[:hello_user].split('?')[0]
    params = ''
    params = params.split('&').map { |pair| pair.split('=') }.to_h
    expect(app.router(path, params)[2]).to eq(['Hello user!'])
  end
end
