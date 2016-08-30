require_relative "../lib/mouse_tracker"
require "ostruct"

describe MouseTracker do
  let(:mouse)   { OpenStruct.new(:has_moved? => false) }
  let(:tracker) { MouseTracker.new(mouse: mouse, dwell_time: 3, drag_time: 2, drag_or_click: :drag) }

  it "starts at rest" do
    expect(tracker.moving?).to be_falsey
  end

  it "doesn't click if it hasn't moved" do
    expect(mouse).to_not receive(:left_down)
    tracker.tick
    tracker.tick
    tracker.tick
    tracker.tick
  end

  describe "when clicking" do
    let(:tracker) { MouseTracker.new(mouse: mouse, dwell_time: 5, drag_or_click: :click) }

    before do
      allow(mouse).to receive(:has_moved?).and_return(true, false, false, false)
    end

    it "clicks after 3 stationary ticks" do

    end
  end

  describe "when dragging is enabled" do
    describe "#set_ticks_to_event" do
      describe "while not dragging" do
        let(:mouse) { OpenStruct.new(:has_moved? => false, button_is_up: true) }

        it "sets ticks_to_event to be the dwell time" do
          tracker.set_ticks_to_event
          expect(tracker.ticks_to_event).to eq 3
        end
      end

      describe "while dragging" do
        let(:mouse) { OpenStruct.new(:has_moved? => false, button_is_up: false) }

        it "sets ticks_to_event to be the drag time" do
          tracker.set_ticks_to_event
          expect(tracker.ticks_to_event).to eq 2
        end
      end
    end
  end
end
