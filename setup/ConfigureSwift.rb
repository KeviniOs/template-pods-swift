module Pod

    class ConfigureSwift
        attr_reader :configurator

        def self.perform(options)
            new(options).perform
        end

        def initialize(options)
            @configurator = options.fetch(:configurator)
        end

        def perform
            module_type = configurator.ask_with_answers("What is the type of this module?", ["Feature", "Core", "Interface"]).to_sym
            project_folder = ""
            keep_demo = :no
            case module_type
                when :feature
                project_folder = "Feature/"
                keep_demo = :yes
                when :core
                project_folder = "Core/"
                keep_demo = :yes
                when :interface
                project_folder = "Interface/"
                keep_demo = :no
            end

            snapshots = configurator.ask_with_answers("Would you like to do view based testing", ["No", "Yes"]).to_sym
            case snapshots
                when :yes
                configurator.add_pod_to_podfile "FBSnapshotTestCase' , '~> 2.1.4"

                if keep_demo == :no
                    puts " Putting demo application back in, you cannot do view tests without a host application."
                    keep_demo = :yes
                end

                if framework == :quick
                    configurator.add_pod_to_podfile "Nimble-Snapshots' , '~> 6.3.0"
                end
            end

            Pod::ProjectManipulator.new({
                                        :configurator => @configurator,
                                        :xcodeproj_path => "templates/swift/" + project_folder + "Example/PROJECT.xcodeproj",
                                        :platform => :ios,
                                        :remove_demo_project => (keep_demo == :no),
                                        :prefix => ""
                                        }).run

                                        case module_type
                                            when :feature
                                            `mv ./templates/swift/Feature/* ./`
                                            `mv ./Podspec/Feature/* ./`
                                            `mv ./Sources/Feature/Resources ./`
                                            `mv ./Sources/Feature/Tests ./`
                                            `mv ./Sources/Feature/* ./Sources/`
                                            when :core
                                            `mv ./templates/swift/Core/* ./`
                                            `mv ./Podspec/Core/* ./`
                                            `mv ./Sources/Core/Resources ./`
                                            `mv ./Sources/Core/Tests ./`
                                            `mv ./Sources/Core/* ./Sources/`
                                            when :interface
                                            `mv ./Sources/Interface/* ./Sources/`
                                            `mv ./Podspec/Interface/* ./`
                                        end

                                        `rm -fr ./Sources/Feature`
                                        `rm -fr ./Sources/Core`
                                        `rm -fr ./Sources/Interface`
                                        `rm -fr ./Podspec`
                                        `rm -fr LICENSE`

                                        # The Podspec should be 8.0 instead of 7.0
                                        text = File.read("NAME.podspec")
                                        text.gsub!("7.0", "8.0")
                                        File.open("NAME.podspec", "w") { |file| file.puts text }

                                        # remove podspec for osx
                                        `rm ./NAME-osx.podspec`

                                        # remove git files
                                        `rm .gitignore`
                                        `rm -fr .git`
        end
    end

end
