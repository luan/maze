require './lib/board'

describe Board do
  describe "creation" do
    context "when passing in '^$'" do
      subject { Board.new "^$\n" }
      its(:cells) { should == [['^', '$']] }
    end

    context "when passing in a complex map" do
      subject { Board.new "^..#\n..#\$\n" }
      its(:cells) { should == [["^", ".", ".", "#"], [".", ".", "#", "$"]] }
    end

    it "handles double entry points" do
      expect {
        Board. new "^^..$"
      }.to raise_error Board::InvalidBoard
    end

    context "when passing an invalid map" do
      it "raises an error for the empty string" do
        -> do
          Board.new ""
        end.should raise_error Board::InvalidBoard
      end

      it "raises an error for a map with unknown characters" do
        expect {
          Board.new "^hakuna.matata$"
        }.to raise_error Board::InvalidBoard
      end

      it "raises an error a map without both entry point and exit" do
        -> do
          Board.new ".\n"
        end.should raise_error Board::NoEntryFound
      end

      it "raises an error for a map without entry point" do
        -> do
          Board.new "#..#\n..#\$\n"
        end.should raise_error Board::NoEntryFound
      end

      it "raises an error for a map without an exit" do
        -> do
          Board.new "^..#\n..##\n"
        end.should raise_error Board::NoExitFound
      end
    end
  end
end
