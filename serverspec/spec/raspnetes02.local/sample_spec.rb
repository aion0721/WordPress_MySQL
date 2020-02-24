require 'spec_helper'

describe package('httpd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('httpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
  it { should be_enabled }
  it { should be_running }
end

# Checking SSH Port
describe port(22) do
  it { should be_listening }
end

# Checking Installed Mysql
describe package('mysql-server') do
  it { should be_installed }
end

# Checking Installed Mysql-Client
describe package('mysql-client') do
  it { should be_installed }
end

# Checking Mysql Service Status
describe service('mysql') do
  it { should be_enabled }
  it { should be_running }
end

# Checking Mysql Port
describe port(3306) do
  it { should be_listening }
end

# Checking Database
describe command("mysqlshow") do
  its(:stdout) { should contain ('wordpress') }
end

# Checking User
describe command("mysql -u root mysql --execute='SELECT * FROM user;'") do
  its(:stdout) { should contain ('wpuser') }
end

