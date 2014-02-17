#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "BJTableCeption"
  s.platform		 = :ios, "7.0"
  s.version          = "0.1.1"
  s.summary          = "Add categories (sub section headers) to your UITableView."
  s.description      = <<-DESC
                       Add categories (sub section headers) to your UITableView

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/jostster/BJTableCeption"
  s.screenshots      = "https://raw2.github.com/jostster/BJTableCeption/master/Project/images/Screenshot_1.png"
  s.license          = 'MIT'
  s.author           = 'Brian Jost'
  s.source           = { :git => "https://github.com/jostster/BJTableCeption.git", :tag => s.version.to_s }

  s.requires_arc = true

  s.source_files = 'BJTableCeption'
end
