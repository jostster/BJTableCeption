#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "BJTableCeption"
  s.version          = "0.1.0"
  s.summary          = "Add categories (sub sections) to your UITableView sections."
  s.description      = <<-DESC
                       Add categories (sub sections) to your UITableView sections.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://EXAMPLE/NAME"
  s.screenshots      = "https://raw2.github.com/jostster/BJTableCeption/master/Project/images/Screenshot_1.png"
  s.license          = 'MIT'
  s.author           = 'Brian Jost'
  s.source           = { :git => "https://github.com/jostster/BJTableCeption.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/NAME'

  s.requires_arc = true

  s.source_files = 'BJTableCeption'
  s.resources = 'Assets'
end
