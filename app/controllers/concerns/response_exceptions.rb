module ResponseExceptions
    extend ActiveSupport::Concern

    private

    def render_unprocessable_entity_error(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_record_not_found
        render json: {error: "#{controller_path.classify}, not found"}, status: :not_found
    end
end