##
# to run: rake test:plugins PLUGIN=cms RAILS_ENV=test
##
require 'test_helper'

class CmsTest < ActiveSupport::TestCase
  def setup
    Cms::Base.config_filename = "cms_tool.config.TEST.rb"
    @config_path = File.join Rails.root.to_s, 'config', Cms::Base.config_filename
  end

  test "raises an error if config file absent" do
    File.stubs(:exists?).returns(false)
    assert_equal false, File.exists?(@config_path), "config file expected to NOT exist at [#{@config_path}]"
    assert_raises(Exception) { Cms::Base.load_config(false) }
  end

  test "loads the config file" do
    File.stubs(:exists?).returns(true)
    assert_equal true , File.exists?(@config_path), "config file expected to exist at [#{@config_path}]"
    
    struct = Struct.new(:read).new("username: qwerty\npassword: secret")
    File.expects(:open).returns(struct)
    assert_nothing_raised { Cms::Base.load_config(false) }
    
    assert_not_nil Cms::Base.username, "expected username to be populated"
    assert_not_nil Cms::Base.password, "expected password to be populated"
  end

end
