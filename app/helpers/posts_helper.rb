module PostsHelper
    def form_title
        @post.new_record? ? "Crear Post" : "Actualizar Post"
    end
end
