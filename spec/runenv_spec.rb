require "spec_helper"
require "runenv"

module DevTools
  module RunEnv
    describe RunEnv do
      it "has a version number" do
        expect(VERSION).not_to be nil
      end

      it "has a program name" do
        expect(PROGRAM_NAME).not_to be nil
      end

      describe OptParse do
        let (:options) { OptParse.parse([], true) }

        context "--[no-]build" do
          it "should be valid" do
            my_options = nil
            expect { my_options = OptParse.parse(%w(--build), true) }.not_to raise_error
            expect(my_options.build).to be true
          end

          it "should default to true" do
            expect(options.build).to be true
          end

          it "should be negatable" do
            expect(OptParse.parse(%w(--no-build), true).build).to be false
          end
        end

        context "--[no-]bundle" do
          it "should be valid" do
            my_options = nil
            expect { my_options = OptParse.parse(%w(--bundle), true) }.not_to raise_error
            expect(my_options.bundle).to be true
          end

          it "should default to false" do
            expect(options.bundle).to be false
          end

          it "should be negatable" do
            expect(OptParse.parse(%w(--no-bundle), true).bundle).to be false
          end
        end

        context "--[no-]run" do
          it "should be valid" do
            my_options = nil
            expect { my_options = OptParse.parse(%w(--run), true) }.not_to raise_error
            expect(my_options.run).to be true
          end

          it "should default to true" do
            expect(options.run).to eql(true)
          end

          it "should be negatable" do
            expect(OptParse.parse(%w(--no-run), true).run).to be false
          end
        end
      end
    end
  end
end
