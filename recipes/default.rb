#
# Cookbook Name:: chef-metasploit
# Recipe:: default
#
# Copyright (C) 2015 cmluciano
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

%w( build-essential libreadline-dev libssl-dev libpq5 libpq-dev
	libreadline5 libsqlite3-dev libpcap-dev openjdk-7-jre git-core
	autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev
	libxslt1-dev vncviewer libyaml-dev curl zlib1g-dev nmap).each do |pkg|
  package pkg
end

package 'software-properties-common'
package 'python-software-properties'

execute 'add-apt-repository[ppa:brightbox]' do
  command 'add-apt-repository ppa:brightbox/ruby-ng-experimental'
  notifies :run, 'execute[apt-get update]', :immediately
  not_if 'test -f /etc/apt/sources.list.d/brightbox-ruby-ng-experimental-precise.list -o -f /etc/apt/sources.list.d/brightbox-ruby-ng-experimental-trusty.list'
end
