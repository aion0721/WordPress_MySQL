require 'spec_helper'

# Checking SSH Port
describe port(22) do
  it { should be_listening }
end

# Checking Installed Apache2, PHP
%w{apache2 php7.2 php7.2-mysql}.each do |pkg|
  describe package(pkg) do
    it {should be_installed}
  end
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

# Checking Wordpress User
describe command("wp user list --allow-root --path='/var/www/html/'") do
  its(:stdout) { should contain ('admin') }
end

# Checking DB
describe command('wp --allow-root --path=/var/www/html db check') do
  its(:exit_status) { should eq 0 }
end

# Checking Wordpress Page
describe command('curl http://raspnetes01.local -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end
