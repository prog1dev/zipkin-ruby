module Trace
  class NullSender
    def with_new_span(trace_id, name)
      span = start_span(trace_id, name)
      result = yield span
      end_span(span)
      result
    end

    def start_span(trace_id, name)
      Span.new(name, trace_id)
    end

    def end_span(span)
      span.close if span.respond_to?(:close)
    end

    def flush!
      # NOOP
    end
  end
end
