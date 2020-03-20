require 'spec_helper'

# Checking SSH Port
describe port(22) do
  it { should be_listening }
end

# Checking Installed Mysql
%w{mariadb-server mariadb-client}.each do |pkg|
  describe package(pkg) do
    it {should be_installed}
  end
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

