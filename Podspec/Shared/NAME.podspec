Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '1.0.0'
  s.summary          = 'A short description of ${POD_NAME}.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/KeviniOs/PokemonUniverse'
  s.authors          = 'Kevin'
  s.source           = { :git => 'https://github.com/KeviniOs/PokemonUniverse.git', :tag => s.version.to_s }

  s.platform = :ios
  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/**/*'
  s.resource_bundles = {
    '${POD_NAME}' => [ "Resources/Assets/*.xcassets",
                       "Resources/Strings/*.strings" ]
  }

  s.frameworks = 'UIKit'

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*.swift'
  end
end
