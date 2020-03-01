require 'spec_helper'

# Checking SSH Port
describe port(22) do
  it { should be_listening }
end

# Checking Installed Apache2
describe package('apache2')do
  it { should be_installed }
end

# Checking Installed PHP
describe package('php7.2') do
  it { should be_installed }
end

# Checking Installed PHP-Mysql
describe package('php7.2-mysql') do
  it { should be_installed }
end

# Checking Apache2 Service Status
describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

# Checking HTTP Port
describe port(80) do
  it { should be_listening }
end
