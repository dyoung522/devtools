require "spec_helper"
require "pr_list"

module DevTools
  module PRlist
    describe "PRlist" do
      let (:repo) { "foobar/baz-bat" }
      let (:repo_short) { "baz-bat" }

      it "has a VERSION" do
        expect(VERSION).not_to be nil
      end

      it "has an IDENT" do
        expect(IDENT).not_to be nil
      end

      describe OptParse do
        let (:options) { OptParse.parse([], true) }

        context "--queue" do
          it "should be valid" do
            my_options = nil

            expect { my_options = OptParse.parse(%w(--queue), true) }.not_to raise_error
            expect(my_options.queue).to be true # can be set
          end

          it "should be negatable" do
            my_options = nil

            expect { my_options = OptParse.parse(%w(--no-queue), true) }.not_to raise_error
            expect(my_options.queue).to be false # can be unset
          end

          it "should default to false" do
            expect(options.queue).to be false
          end
        end

      end

      describe PullRequest do
        let (:issue) { build(:issue) }
        let (:pull_request) { PullRequest.new issue }

        it "should have a valid date method" do
          expect(pull_request.date).not_to be nil
          expect(pull_request.date).to eq(issue.created_at)
        end

        it "should have a valid labels method" do
          expect(pull_request.labels).not_to be nil
          expect(pull_request.labels).to be_a(Array)
        end

        it "should have a valid number method" do
          expect(pull_request.number).not_to be nil
          expect(pull_request.number).to eq(issue.number)
        end

        it "should have a valid title method" do
          expect(pull_request.title).not_to be nil
          expect(pull_request.title).to eq(issue.title)
        end

        context "#repo" do
          it "should return the full repository name by default" do
            expect(pull_request.repo).to eq(repo)
          end

          it "should return the short repository name when requested" do
            expect(pull_request.repo(true)).to eq(repo_short)
          end
        end
      end

      describe PullRequests do
        let (:pull_requests) { PullRequests.new 123456789 }
        let (:issue1) { build(:issue, :created_at => "2016-01-01 18:00:00.000000000 Z") }
        let (:issue2) { build(:issue, :created_at => "2016-01-01 17:59:00.000000000 Z") }
        let (:github) { build(:github, :issues => [issue1, issue2]) }

        before (:each) do
          allow(Octokit::Client).to receive(:new) { github }
          allow(github).to receive(:issues) { [issue1, issue2] }
        end

        it "should (re-)authenticate with #auth!" do
          pull_requests.auth!("123456789")

          expect(Octokit::Client).to have_received(:new).with(hash_including(:access_token => 123456789))
        end

        context "#load!" do
          it "should be valid" do
            expect(pull_requests).to respond_to(:load!)
          end

          it "should load issues" do
            pull_requests.load!(repo)
            expect(github).to have_received(:issues)
            expect(pull_requests.pulls.length).to eq(2)
          end
        end

        context "#by_date" do
          before(:each) do
            pull_requests.load!(repo)
          end

          it "should return an Array" do
            expect(pull_requests.by_date).to be_an(Array)
          end

          it "should return issues ordered by created_at" do
            pr = pull_requests.by_date
            expect(pr.length).to eq(2)
            expect(pr[0].issue).to eql(issue2)
            expect(pr[1].issue).to eql(issue1)
          end
        end

        context "#repos" do
          it "should return repository name(s)" do
            pull_requests.load!(repo)
            expect(pull_requests.repos).to eq([repo])
          end
        end

      end
    end
  end
end

